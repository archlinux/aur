# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
_binaryname=ToDesk
pkgver=4.7.2.0
pkgrel=3
pkgdesc="Remote control and team work"
arch=('x86_64' 'aarch64')
url="https://www.todesk.com/"
license=('custom')
depends=('gtk3'
         'libappindicator-gtk3')
optdepends=("noto-fonts-cjk: Chinese display support")
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# !strip: strip could generate error.
# ---> 
# strip: error: the input file './opt/todesk/bin/todesk' has no sections
# strip: error: the input file './opt/todesk/bin/todeskd' has no sections
#
# emptydirs: leave /opt/todesk/config empty dir
options=('!strip' 'emptydirs')
install="${_pkgname}.install"
source=('license.html')
source_x86_64=("https://dl.todesk.com/linux/${_pkgname}-v${pkgver}-amd64.deb")
source_aarch64=("https://dl.todesk.com/linux/${_pkgname}-v${pkgver}-arm64.deb")
source_armv7h=("https://dl.todesk.com/linux/${_pkgname}-v${pkgver}-armv7l.deb")
sha256sums=('402b2db2586c723af990beb0f96249b9680880f4f30e58a7cbe7cbd20b979a0b')
sha256sums_x86_64=('bfb5695d715568a23df51a735167c073a784ecd1c625e16b35e5136d5b97fb28')
sha256sums_aarch64=('07a1239d0ea6b94f24e12b446d39cf6b23747b2e52f09c3dff50daa1394ae0b5')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

build() {
  mkdir -p ${srcdir}/build

  tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/build 
}

package() {
  cd ${srcdir}/build/

  # binary wrapper
  install -Dm755 usr/local/bin/${_pkgname} -t ${pkgdir}/usr/bin/

  # binary & scripts
  install -Dm755 opt/${_pkgname}/bin/${_binaryname}{,_Service,_Session} -t ${pkgdir}/opt/${_pkgname}/bin
  install -Dm755 opt/${_pkgname}/bin/CrashReport -t ${pkgdir}/opt/${_pkgname}/bin

  # lib
  # bundled libaray for hardware video encode
  cp -a opt/${_pkgname}/bin/*.so* ${pkgdir}/opt/${_pkgname}/bin/
  # _install 644 opt/${_pkgname}/bin -name libzrtc.so

  # icon
  # find opt/${_pkgname}/res -maxdepth 1 -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  _install 644 opt/${_pkgname}/res -maxdepth 1

  # config 
  # empty dir
  install -dm755 ${pkgdir}/opt/${_pkgname}/config

  # desktop entry 
  install -Dm644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications

  # systemd service
  install -Dm644 etc/systemd/system/${_pkgname}d.service -t ${pkgdir}/usr/lib/systemd/system 

  # icon
  # find usr/share/icons -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  _install 644 usr/share/icons

  # license
  install -Dm644 ${srcdir}/license.html -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
# vim: set sw=2 ts=2 et:
