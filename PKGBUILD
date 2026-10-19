# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: witt <1989161762 at qq dot com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
_binaryname=ToDesk
pkgver=4.9.7.0
pkgrel=1
pkgdesc="Remote control and team work"
arch=('x86_64' 'aarch64')
url="https://www.todesk.com/"
license=('custom')
depends=('gtk3'
         'libappindicator-gtk3'
         'noto-fonts-cjk')
makedepends=('wget' 'tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# !strip: strip could generate error.
# ---> 
# strip: error: the input file './opt/todesk/bin/todesk' has no sections
# strip: error: the input file './opt/todesk/bin/todeskd' has no sections
#
# emptydirs: leave /opt/todesk/config empty dir
options=('!strip' 'emptydirs')
DLAGENTS=("https::/usr/bin/wget -U 'Mozilla' -O %o %u")
install="${_pkgname}.install"
source=('license.html')
source_x86_64=("https://dl.todesk.com/linux/${_pkgname}-v${pkgver}-amd64.deb")
source_aarch64=("https://dl.todesk.com/linux/${_pkgname}-v4.8.5.1-arm64.deb")
source_armv7h=("https://dl.todesk.com/linux/${_pkgname}-v${pkgver}-armv7l.deb")
sha256sums=('402b2db2586c723af990beb0f96249b9680880f4f30e58a7cbe7cbd20b979a0b')
sha256sums_x86_64=('e6aee6f7fecd67a9bcec00b763afa2e2b663c5b9b9375db9d60a9081c09acf4b')
sha256sums_aarch64=('0c3a78f52df7b2d7877f05cb0ed9a112607be5976e09c01527cacfe3fb8dc2fc')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

build() {
  mkdir -p "${srcdir}/build"

  # 4.9.7.0 起上游把 data.tar.zst 换成了 data.tar.xz，这里不再写死压缩格式
  local _data
  for _data in "${srcdir}"/data.tar.*; do
    tar -xf "${_data}" -C "${srcdir}/build"
  done
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
