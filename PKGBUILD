pkgname=mdview-mtx-git
_pkgname=mdview
pkgver=r73.fc2c705
pkgrel=1
pkgdesc='GTK markdown viewer and CLI converter. GTK3 version.'
url='https://github.com/step-/mdview'
arch=('x86_64')
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('git' 'meson' 'ninja' 'help2man')
source=(
    "git+$url"
    mdview.desktop
    ru.po
)
conflicts=('mdview')
md5sums=(
    'SKIP'
    '18610172326078776b64150442ca822b'
    'b8b963110e0785335817b77dba4985ad'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  mkdir build
  meson --prefix=/usr build 
  ninja -C build
}

package() {
  cd $_pkgname
  DESTDIR="${pkgdir}" ninja -C build install
  install -D -m 644 ../../mdview.desktop ${pkgdir}/usr/share/applications/mdview.desktop
  install -D -m 644 data/icons/hicolor/scalable/apps/mdview.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/mdview.svg
  mkdir -p ${pkgdir}/usr/share/locale/ru/LC_MESSAGES && msgfmt ../../ru.po -o ${pkgdir}/usr/share/locale/ru/LC_MESSAGES/mdview.mo
}
