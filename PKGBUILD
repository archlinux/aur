# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-git
pkgver=r150.b519d8a265
pkgrel=1
pkgdesc="Generic greeter daemon"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd)
provides=(greetd)
depends=(systemd pam)
makedepends=(rust scdoc)
optdepends=(
  'greetd-gtkgreet: Simple GTK based greeter'
  'greetd-dlm: Dumb Login Manager'
  'greetd-wlgreet: Wayland greeter'
)
backup=(
  'etc/greetd/config.toml'
)

pkgver() {
  cd greetd
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

build() {
  cd greetd
  cargo build --release
  cd man
  for i in *.scd
  do
    scdoc < "$i" > "${i::-4}".roff
  done
}

check() {
  cd greetd
  cargo test --release
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 greetd/target/release/greetd "$pkgdir"/usr/bin/
  install -m755 greetd/target/release/agreety "$pkgdir"/usr/bin/

  install -d "$pkgdir"/usr/share/man/man1
  for i in greetd/man/*-1.roff
  do
    install -m755 "$i" "$pkgdir"/usr/share/man/man1/"${i:11:-7}.1"
  done

  install -d "$pkgdir"/usr/share/man/man5
  for i in greetd/man/*-5.roff
  do
    install -m755 "$i" "$pkgdir"/usr/share/man/man5/"${i:11:-7}.5"
  done

  install -d "$pkgdir"/usr/share/man/man7
  for i in greetd/man/*-7.roff
  do
    install -m755 "$i" "$pkgdir"/usr/share/man/man7/"${i:11:-7}.7"
  done

  install -d "$pkgdir"/usr/lib/systemd/system
  install -m644 greetd/greetd.service "$pkgdir"/usr/lib/systemd/system/

  echo 'u greeter - "greetd greeter user"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/greetd.conf"

  install -d "$pkgdir"/etc/greetd
  install -m644 greetd/config.toml "$pkgdir"/etc/greetd/
}
