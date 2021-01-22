# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=1.2.3
pkgrel=2
pkgdesc="Remote control and team work"
arch=('x86_64' 'aarch64')
url="https://www.todesk.cn/"
license=('unknown')
depends=('libxtst'
         'freetype2')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
options=('!strip')
source_x86_64=("https://update.todesk.com/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://update.todesk.com/${_pkgname}_${pkgver}_aarch64.deb")
sha256sums_x86_64=('d7b7cc986e28160f700bab8e821c8fe31b3e3d46ed75def4c9158b64ed398a3b')
sha256sums_aarch64=('bf40ada6f54b7683433951356447f21b58026b9e471a447b8ba909afba766a84')

build() {
  mkdir -p ${srcdir}/build

  tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/build 
}

package() {
  cd ${srcdir}/build/

  # binary wrapper
  install -Dm 755 usr/local/bin/${_pkgname} -t ${pkgdir}/usr/bin/
  # install -Dm 755 usr/local/bin/${_pkgname}update -t ${pkgdir}/usr/bin/

  # lib
  find opt/${_pkgname}/lib     -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  find opt/${_pkgname}/plugins -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # font
  find opt/${_pkgname}/res     -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # binary & scripts
  install -Dm755 opt/${_pkgname}/${_pkgname} -t ${pkgdir}/opt/${_pkgname}/
  install -Dm755 opt/${_pkgname}/${_pkgname}d -t ${pkgdir}/opt/${_pkgname}/
  # install -Dm755 opt/${_pkgname}/${_pkgname}update -t ${pkgdir}/opt/${_pkgname}/
  install -Dm755 opt/${_pkgname}/daemon.sh -t ${pkgdir}/opt/${_pkgname}/
  install -Dm755 opt/${_pkgname}/${_pkgname}c -t ${pkgdir}/opt/${_pkgname}/

  # qt.conf & todeskd.conf
  install -Dm644 opt/${_pkgname}/qt.conf -t ${pkgdir}/opt/${_pkgname}/
  install -Dm666 opt/${_pkgname}/${_pkgname}d.conf -t ${pkgdir}/opt/${_pkgname}/

  # desktop entry 
  install -Dm 644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  sed -i "s|Emulator;||g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # systemd service
  install -Dm644 etc/systemd/system/${_pkgname}d.service -t ${pkgdir}/usr/lib/systemd/system 

  # icon
  install -Dm 644 usr/share/pixmaps/${_pkgname}.png -t ${pkgdir}/usr/share/pixmaps

  # ugly permission fix
  chmod 0777 ${pkgdir}//opt/${_pkgname}
  
  # log files
  install -Dm666 opt/${_pkgname}/${_pkgname}.log -t ${pkgdir}/opt/${_pkgname}/
  install -Dm666 opt/${_pkgname}/${_pkgname}d.log -t ${pkgdir}/opt/${_pkgname}/
}
# vim: set sw=2 ts=2 et:
