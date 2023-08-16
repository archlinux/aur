# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: swordfeng <swordfeng123@gmail.com>
# Contributor: TheGoliath <hidden>

pkgname=cajviewer
_pkgname=CAJViewer
pkgver=1.3.22_1
pkgrel=1
pkgdesc="Document Viewer for TEB, CAJ, NH, KDH and PDF format"
arch=('x86_64')
url="http://cajviewer.cnki.net/"
license=('custom')
depends=('qt5-base'
        'glibc'
        'gcc-libs'
        'libcups'
        'bash'
        'openssl-1.1'
        'hicolor-icon-theme'
        'qt5-webchannel'
        'qt5-webengine')
source=("${pkgname}.sh"
        "${pkgname}.desktop")
source_x86_64=("https://download.cnki.net/${pkgname}_${pkgver//_/-}_amd64.deb")

# strip will cause cajviewer core dumped 
# options=('!strip')
sha256sums=('28debde2450cfae595fae4b8ed85e4785d2214f6864905dc54b62d902b057d5a'
            '2d602dc832fd45d4bfa1d8abba58ceec5d5a35e327788ee8774af55a57a7e87f')
sha256sums_x86_64=('2b9193a5980bc9afede11d7e7ea56ce6a185b9b351789b69c366be356ab40059')

_install() {
  find ${@: 2} -type f,l -exec install -Dm$1 {} ${pkgdir}/{} \;
}

prepare() {
  install -dm755 build
  tar -xf data.* -C build

  cd "$srcdir/build"
  mv opt/apps/${pkgname}  opt/${pkgname}
}

package() {
  cd "$srcdir/build"
  
  # binary wrapper
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  _install 755 opt/${pkgname}/${_pkgname}
  _install 644 opt/${pkgname}/Resource
   _install 644 opt/${pkgname}/qt.conf
  _install 644 opt/${pkgname}/VERSION

  # _install 644 opt/${pkgname}/lib -name "libreaderex_x64.so"
  _install 644 opt/${pkgname}/lib
  _install 644 opt/${pkgname}/libexec
  _install 644 opt/${pkgname}/plugins
  _install 644 opt/${pkgname}/resources
  _install 644 opt/${pkgname}/translations
  

  # mime
  _install 644 usr/share/mime/packages/
  _install 644 usr/share/icons/hicolor/

  install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
  install -Dm644 opt/${pkgname}/${pkgname}.png -t ${pkgdir}/usr/share/pixmaps
}

# vim: set sw=2 ts=2 et:
