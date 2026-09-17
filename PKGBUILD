# Maintainer: sfslinux@gmail.com

_pkgname=screentest
pkgname=$_pkgname-git
pkgver=r111.bf1ad7d
pkgrel=1
pkgdesc="Tesing the quality of CRT/LCD screens"
arch=('x86_64')
url="https://github.com/TobiX/screentest"
#url="https://github.com/sfs-pra/screentest"
license=('GPL2')
depends=('gtk3' )
makedepends=('meson')
source=(git+$url "ru.po" "screentest.desktop")
sha256sums=('SKIP'
            'f126afdabf9c8cd2b7f52690149596569fd0c774a4ef8d62aac55c651c804307'
            '29ba6b4eab54b7fb47593adf52f095307f6665d81a1f7fbb4cc1f43193d33b3e')

pkgver() {
  cd $_pkgname
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  meson build --prefix /usr 
  meson compile -C build
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" meson install -C build
  install -dm755 "$pkgdir"/usr/share/locale/ru/LC_MESSAGES &&
      msgfmt -o "$pkgdir"/usr/share/locale/ru/LC_MESSAGES/screentest.mo ../ru.po
  install -Dm644 ../screentest.desktop "$pkgdir"/usr/share/applications/screentest.desktop
}
