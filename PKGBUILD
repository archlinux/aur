# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: swordfeng <swordfeng123@gmail.com>
# Contributor: TheGoliath <hidden>

pkgname=cajviewer
pkgver=9.0
pkgrel=3
pkgdesc="CAJViewer for Linux. Document Viewer for TEB, CAJ, NH, KDH and PDF format"
arch=('x86_64')
url="http://cajviewer.cnki.net/"
license=('custom')
depends=(
        'glibc'
        'gcc-libs'
        'bash'
        'hicolor-icon-theme'
        'libxml2-legacy'
#        'qt5-base'
#        'libcups'
#        'openssl-1.1'
#        'qt5-webchannel'
#        'qt5-webengine'
)
source=("cajviewer.sh")
source_x86_64=("https://download.cnki.net/${pkgname}_${pkgver}_amd64.deb")

# strip will cause cajviewer core dumped 
options=('!strip')
sha256sums=('a85c0526d3cdbbc33808c34f8c149050790134f8127b86cbb0bd53786bfeb88b')
sha256sums_x86_64=('3142c633d74dcf34ebaca9b7653f88ad3619f0b7a6cb689487b6cc583ec926d3')

_install() {
  find ${@: 2} -type f,l -exec install -Dm$1 {} ${pkgdir}/{} \;
}

prepare() {
  cd ${srcdir}

  install -dm755 build
  tar -xf data.* -C build
}

package() {
  cd "$srcdir/build"
  
  _install 644 opt/${pkgname}/bin
  _install 644 opt/${pkgname}/doc/
  # _install 644 opt/${pkgname}/lib -name "libreaderex_x64.so"
  _install 644 opt/${pkgname}/lib/
  _install 644 opt/${pkgname}/libexec/
  _install 644 opt/${pkgname}/plugins/
  _install 644 opt/${pkgname}/resources/
  _install 644 opt/${pkgname}/translations/
  _install 644 opt/${pkgname}/${pkgname}.png
  _install 644 opt/${pkgname}/VERSION
  
  for _exe in backgroundprocess CAJViewer start.sh
  do
    chmod 0755 ${pkgdir}/opt/${pkgname}/bin/${_exe}
  done
  chmod 0755 ${pkgdir}/opt/${pkgname}/libexec/QtWebEngineProcess

  # install -dm755 ${pkgdir}/usr/bin/
  # ln -s /opt/${pkgname}/bin/start.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ${srcdir}/cajviewer.sh -t ${pkgdir}/usr/bin

  # mime
  _install 644 usr/share/mime/
  _install 644 usr/share/icons/
  _install 644 usr/share/applications/
}

# vim: set sw=2 ts=2 et:
