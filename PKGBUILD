# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=distroshelf-git
pkgver=r196.g691729d
pkgrel=1
pkgdesc='A GUI for Distrobox Containers'
url='https://github.com/ranfdev/DistroShelf'
arch=('x86_64')
depends=(
  'cairo' 
  'dconf' 
  'distrobox' 
  'gcc-libs' 
  'gdk-pixbuf2' 
  'glibc' 
  'glib2' 
  'graphene' 
  'gtk4' 
  'libadwaita' 
  'hicolor-icon-theme'
  'pango' 
  )
makedepends=('cargo' 'git' 'gtk4' 'libadwaita' 'meson')
license=('GPL-3.0-only')
provides=(distroshelf)
conflicts=(
	distroshelf
	distroshelf-git
)
replaces=(distroshelf distroshelf-git)
# changelog=CHANGELOG
source=(
  ${pkgname}::git+https://github.com/ranfdev/DistroShelf.git
)
# backup=('')
b2sums=('SKIP')

pkgver(){
  cd "${pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS+=" -ffat-lto-objects"

  meson build --prefix=/usr
  ninja -C build
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname}/build/src/distroshelf
  install -Dm644 -t "${pkgdir}/usr/share/applications" ${pkgname}/build/data/com.ranfdev.DistroShelf.desktop
  install -Dm644 -t "${pkgdir}/usr/share/metainfo" ${pkgname}/build/data/com.ranfdev.DistroShelf.metainfo.xml
  install -Dm644 -t "${pkgdir}/usr/share/distroshelf" ${pkgname}/build/src/distroshelf.gresource
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" ${pkgname}/data/com.ranfdev.DistroShelf.gschema.xml
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" ${pkgname}/data/icons/hicolor/scalable/apps/com.ranfdev.DistroShelf.svg
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/" ${pkgname}/data/icons/hicolor/symbolic/apps/com.ranfdev.DistroShelf-symbolic.svg
  install -Dm644 -t "${pkgdir}/usr/share/dbus-1/services" ${pkgname}/build/data/com.ranfdev.DistroShelf.service
}
