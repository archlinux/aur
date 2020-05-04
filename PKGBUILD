# Maintainer: Oliver Jaksch <arch-aur@com-in.de>
# based on Arch's package pango by Jan de Groot <jgc@archlinux.org>

pkgname=pango-anydesk
pkgver=1.43.0
pkgrel=3
epoch=1
pkgdesc="Older version of pango temporary needed by AnyDesk package"
url="https://www.pango.org/"
arch=(x86_64)
license=(LGPL)
depends=(libthai cairo libxft harfbuzz fribidi)
makedepends=(gobject-introspection help2man gtk-doc git meson)
checkdepends=(ttf-dejavu cantarell-fonts)
_commit=26f1135f374f3ad5eb963dcdf016542fbbda361b  # tags/1.43.0^0
source=("git+https://gitlab.gnome.org/GNOME/pango.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pango
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pango

  # Fix .pc
  git cherry-pick -n d0cb6be7431d1a3c711bd45bcf05b34601604037
}

build() {
  arch-meson pango build -D enable_docs=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  mkdir -p "${pkgdir}/usr/share/anydesk/files/pango-1.43.0-2/"
  cp -r "${srcdir}/build/pango/libpango"* "${pkgdir}/usr/share/anydesk/files/pango-1.43.0-2/"
  ln -sf "libpangoxft-1.0.so" "${pkgdir}/usr/share/anydesk/files/pango-1.43.0-2/libpangox-1.0.so.0"
}
