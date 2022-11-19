# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=electronwmd-appimage-git
_pkgname=electronwmd
pkgver=r15.e305508
pkgrel=1
pkgdesc='Upload music to NetMD MiniDisc devices'
arch=('x86_64')
url='https://web.minidisc.wiki/'
license=('GPL2')
depends=()
makedepends=('git' 'npm' 'typescript')
provides=('web-minidisc-pro' 'electronwmd')
conflicts=('web-minidisc-pro' 'electronwmd')
options=('!strip')
source=("$_pkgname::git+https://github.com/asivery/ElectronWMD.git"
        "electronwmd.build.patch"
        "electronwmd.desktop"
        "electronwmd.sh")
sha256sums=('SKIP'
            '8e75afb02bfa1b38ca62cab907a948c290695b45485f50e42ee87fcd0de1b8b9'
            '68baf1dc69b425598dee4d2aedc468c0ee8bba980ad25204a4b4fababd61e787'
            '17538d248d36555d08227cf28c0e3436d92c0ed00f317dd9a1833a3cc847a530')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 < "${srcdir}/electronwmd.build.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"

  rm -rf build dist renderer

  npm i
  npm run dist

  cd build
  mv electronwmd-*-linux_x86_64.AppImage electronwmd.AppImage
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/build/electronwmd.AppImage" "${pkgdir}/opt/appimages/electronwmd.AppImage"
  install -Dm755 "${srcdir}/electronwmd.sh" "${pkgdir}/usr/bin/electronwmd"
  install -Dm644 "${srcdir}/electronwmd.desktop" "${pkgdir}/usr/share/applications/electronwmd.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/res/icon.png" "${pkgdir}/usr/share/pixmaps/electronwmd.png"
}
