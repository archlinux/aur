# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-git
pkgver=0.5.1+13.gc7068fe8fd
pkgrel=1
pkgdesc="Generic greeter daemon"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(GPL3)
source=("git+$url" 'greetd.pam')
sha256sums=('SKIP' 'SKIP')
conflicts=(greetd)
provides=(greetd=${pkgver%+*})
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

pkgver() {
  git -C greetd describe --abbrev=10 | sed 's/-/+/; s/-/./'
}

build() {
  cd greetd
  RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
  for i in man/*.scd
  do
    scdoc < "$i" > "${i::-4}".roff
  done
}

package() {
  install -Dm755 "$srcdir/greetd/target/release/greetd" \
    "$pkgdir/usr/bin/greetd"
  install -Dm755 "$srcdir/greetd/target/release/agreety" \
    "$pkgdir/usr/bin/agreety"

  for i in "$srcdir/greetd/man"/*-1.roff
  do
    base="$(basename "$i")"
    install -Dm644 "$i" "$pkgdir/usr/share/man/man1/${base::-7}.1"
  done

  for i in "$srcdir/greetd/man"/*-5.roff
  do
    base="$(basename "$i")"
    install -Dm644 "$i" "$pkgdir/usr/share/man/man5/${base::-7}.5"
  done

  for i in "$srcdir/greetd/man"/*-7.roff
  do
    base="$(basename "$i")"
    install -Dm644 "$i" "$pkgdir/usr/share/man/man7/${base::-7}.7"
  done

  install -Dm644 "$srcdir/greetd/greetd.service" \
    "$pkgdir/usr/lib/systemd/system/greetd.service"

  echo 'u greeter - "greetd greeter user" - /bin/bash' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/greetd.conf"

  install -Dm644 "$srcdir/greetd.pam" \
    "$pkgdir/etc/pam.d/greetd"

  install -Dm644 "$srcdir/greetd/config.toml" \
    "$pkgdir/etc/greetd/config.toml"
}
