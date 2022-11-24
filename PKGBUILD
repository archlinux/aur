# Maintainer: mekb https://github.com/mekb-turtle
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-artix-dinit
pkgver=0.8.0
pkgrel=1
pkgdesc="Generic greeter daemon, packaged for artix-dinit"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(GPL3)
source=("https://git.sr.ht/~kennylevinsen/greetd/archive/$pkgver.tar.gz"
        'greetd.pam'
        'change-default-vt.patch'
        'greetd')
sha256sums=('47a73709df60f04b63fc50cfc409e47a451a9620777638f527b9d9333256035f'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92'
            'cad9073f77421e21752806ae74dbbc4c3ccf30978e196b6a1ae07382e4a7caa8'
            '65ffc65bfb989f2e4a23edabcd1424c94685cd504a252a06085db7d8b60265dd')
depends=(pam)
makedepends=(git rust scdoc)
optdepends=(
  'greetd-gtkgreet: Simple GTK based greeter'
  'greetd-dlm: Dumb Login Manager'
  'greetd-wlgreet: Wayland greeter'
  'greetd-tuigreet: TUI based greeter'
)
backup=(
  'etc/greetd/config.toml'
  'etc/pam.d/greetd'
)
provides=('greetd')
prepare() {
    cd greetd-$pkgver
    patch < ../change-default-vt.patch
}

build() {
  cd greetd-$pkgver
  RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
  cd man
  for i in *.scd
  do
    scdoc < "$i" > "$(basename "$i" .scd)".roff
  done
}

package() {
  install -Dm755 "$srcdir/greetd-$pkgver/target/release/greetd" \
    "$pkgdir/usr/bin/greetd"
  install -Dm755 "$srcdir/greetd-$pkgver/target/release/agreety" \
    "$pkgdir/usr/bin/agreety"
  install -Dm755 "greetd" \
      "$pkgdir/etc/dinit.d/greetd"

  (
    cd greetd-$pkgver/man
    for s in 1 5 7
    do
      install -d "$pkgdir/usr/share/man/man$s"
      for i in *-$s.roff
      do
        install -m755 "$i" "$pkgdir/usr/share/man/man$s/${i%-*}.$s"
      done
    done
  )

  echo 'u greeter - "greetd greeter user" - /bin/bash' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/greetd.conf"

  install -Dm644 "$srcdir/greetd.pam" \
    "$pkgdir/etc/pam.d/greetd"

  install -Dm644 "$srcdir/greetd-$pkgver/config.toml" \
    "$pkgdir/etc/greetd/config.toml"

}
