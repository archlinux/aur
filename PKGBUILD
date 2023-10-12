# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
# Contributer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=gnome-shell-extension-gsconnect45
_pkgname=gnome-shell-extension-gsconnect
pkgver=55.r103.g018c7fe6
pkgrel=1
pkgdesc="KDE Connect for GNOME Shell (with GNOME 45 patches)"
arch=('any')
url="https://github.com/GSConnect/gnome-shell-extension-gsconnect"
license=('GPL')
depends=('gnome-shell')
optdepends=('folks: Contacts integration (Evolution)'
            'libgdata: Contacts integration (GNOME Online Accounts)'
            'python-nautilus: Nautilus integration'
            'gsound: Themed sound effects')
makedepends=('git' 'meson' 'eslint')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}"
        'pr1683.patch::https://patch-diff.githubusercontent.com/raw/GSConnect/gnome-shell-extension-gsconnect/pull/1683.patch')
md5sums=('SKIP'
         '186d716afa4ee086108751f69006ca72')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}

prepare() {
  cd "${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/pr1683.patch"
}

build() {
  cd "${_pkgname}"
  arch-meson --buildtype=plain build
  ninja -C build
}

check() {
  cd "${_pkgname}"
  arch-meson check 
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set ts=4 sw=4 et:
