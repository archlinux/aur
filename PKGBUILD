# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: zhullyb <zhullyb at outlook dot com>

pkgname=sunloginclient
_pkgname=sunlogin
_debname=SunloginClient
pkgver=11.0.1.44968
pkgrel=2
pkgdesc="Proprietary software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(GUI version)"
arch=("x86_64" "aarch64")
url="https://sunlogin.oray.com"
depends=("libappindicator-gtk3"
         'xorg-xhost'
         'libcrypt.so=1-64')
license=('custom')
provides=('sunlogin')
source=("runsunloginclient.service"
        'LICENSE')
source_x86_64=("https://down.oray.com/${_pkgname}/linux/${_debname}_${pkgver}_amd64.deb")
source_aarch64=("https://down.oray.com/${_pkgname}/linux/${_debname}_${pkgver}_kylin_arm.deb")
install="${pkgname}.install"
sha256sums=('7f36a60d84741d817a0d0804bd39c8c7d7058144a6934b2abf0841446f4a56de'
            'b3da0bda5ab0d4badb2cf7723dac95a9c5f5efb89f3d3f192d78728b064d0720')
sha256sums_x86_64=('e8175ed0e3deff2e04ae7d6927c3f47b9586a085b67109109ceba4ed54fd24b2')
sha256sums_aarch64=('4d34fdea6c4ca7421acbb3ee791ea4d1470ff4fd567204f00a09042cfd547c09')

build() {
  mkdir -p build
  tar -xf data.tar.xz -C build
}

_install (){
  cd ${srcdir}/build

  find usr/local/${_pkgname}/$1 -type f -exec \
      install -Dm$2 {} -t ${pkgdir}/opt/${_pkgname}/$1 \;
}

package() {
  cd build
  # system service
  install -Dm644 ${srcdir}/run${pkgname}.service -t \
                 "${pkgdir}/usr/lib/systemd/system/"
  # bin
  _install bin 755

  # font
  _install res/font 644

  # icon
  _install res/icon 644

  # skin
  # write permission is required for sunlogin client to work
  _install res/skin 666

  # desktop entry
  install -Dm644 usr/share/applications/${_pkgname}.desktop -t \
                 ${pkgdir}/usr/share/applications
  # fix path
  sed -i -e "
    s#Exec=/usr/local/sunlogin/#Exec=/usr/#g
    s#Icon=/usr/local/sunlogin/res/icon/sunlogin_client.png#Icon=sunloginclient#g
  " "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # icon
  install -Dm644 usr/local/${_pkgname}/res/icon/sunlogin_client.png \
                 ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  
  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # soft link
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/${_pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # ugly hack
  sed -i "s#/usr/local/sunlogin#///////opt/sunlogin#g" \
          "${pkgdir}/opt/${_pkgname}/bin/${pkgname}" \
          "${pkgdir}/opt/${_pkgname}/bin/${pkgname}_desktop" \
          "${pkgdir}/opt/${_pkgname}/bin/oray_rundaemon"
}
# vim: ts=2 sw=2 et: 

