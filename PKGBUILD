# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd
pkgver=0.9.0
pkgrel=1
pkgdesc="Generic greeter daemon"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(GPL3)
source=("https://git.sr.ht/~kennylevinsen/greetd/archive/$pkgver.tar.gz"
        'greetd.pam')
sha256sums=('a0cec141dea7fd7838b60a52237692d0fd5a0169cf748b8f8379d8409a3768eb'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92')
depends=(systemd pam)
makedepends=(git rust scdoc)
optdepends=(
  'greetd-gtkgreet: Simple GTK based greeter'
  'greetd-dlm: Dumb Login Manager'
  'greetd-wlgreet: Wayland greeter'
)
backup=(
  'etc/greetd/config.toml'
  'etc/pam.d/greetd'
)

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

  install -Dm644 "$srcdir/greetd-$pkgver/greetd.service" \
    "$pkgdir/usr/lib/systemd/system/greetd.service"

  echo 'u greeter - "greetd greeter user" - /bin/bash' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/greetd.conf"

  install -Dm644 "$srcdir/greetd.pam" \
    "$pkgdir/etc/pam.d/greetd"

  install -Dm644 "$srcdir/greetd-$pkgver/config.toml" \
    "$pkgdir/etc/greetd/config.toml"
}
