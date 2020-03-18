# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-gtkgreet-git
pkgver=r48.075343f256
pkgrel=1
pkgdesc="GTK based greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/gtkgreet"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd-gtkgreet)
provides=(greetd-gtkgreet)
makedepends=(meson ninja gtk-layer-shell scdoc)

pkgver() {
  cd gtkgreet
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

prepare() {
  [ -d build ] ||
  meson gtkgreet build \
    -D layershell=true
}

build() {
  ninja -C build
  cd gtkgreet/man
  for i in *.scd
  do
    scdoc < "$i" > "${i::-4}".roff
  done
}

check() {
  ninja -C build test
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 build/gtkgreet/gtkgreet "$pkgdir"/usr/bin/

  install -d "$pkgdir"/usr/share/man/man1
  for i in gtkgreet/man/*-1.roff
  do
    install -m755 "$i" "$pkgdir"/usr/share/man/man1/"${i:13:-7}.1"
  done
}
