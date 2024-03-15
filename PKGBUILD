# Maintainer: Marco Pompili <aur (at) mg (dot) odd (dot) red>
# Contributor: Gautham Velchuru <gvelchuru@gmail.com>

pkgname=kiibohd-configurator-git
_pkgname=kiibohd-configurator
pkgver=r286.2e12869
pkgrel=3
pkgdesc="Client Side Configuration & Flashing Software for Kiibohd compatible keyboards"
arch=('x86_64')
url="https://github.com/kiibohd/configurator"
license=('GPL3')
depends=('dfu-util')
makedepends=('git' 'yarn' 'nodejs-lts-fermium')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=(
  "${pkgname}::git+https://github.com/kiibohd/configurator.git"
  node-lts-fermium-dep.patch
)
sha256sums=('SKIP'
            'f85d77db6ba1f7e5b0fa32c4b933c187bbfb3cee70502ac2a4aed2ac5bfc8656')

#_pkg="${srcdir}/${pkgname}"
#cd "${_pkg}"
#cp -R * "${pkgdir}/usr/share/${_pkgname}"

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd "$srcdir/${pkgname}"
  patch --forward --strip=1 --input=../../node-lts-fermium-dep.patch
}


build() {
  cd ${pkgname}
  yarn
  yarn dist:dir
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${pkgname}/output/linux-unpacked" "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
