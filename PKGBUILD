# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: zhullyb <zhullyb at outlook dot com>

pkgname=sunloginclient
_pkgname=sunlogin
pkgver=11.0.0.36662
pkgrel=3
pkgdesc="Proprietary software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(GUI version)"
arch=("x86_64" "aarch64")
url="https://sunlogin.oray.com"
depends=("libappindicator-gtk3"
         'xorg-xhost')
license=('custom')
provides=('sunlogin')
source=("runsunloginclient.service"
        'LICENSE')
source_x86_64=("https://down.oray.com/${_pkgname}/linux/${pkgname}-${pkgver}-amd64.deb")
source_aarch64=("https://down.oray.com/${_pkgname}/linux/${pkgname}_${pkgver}_arm.deb")
install="${pkgname}.install"
sha256sums=('7f36a60d84741d817a0d0804bd39c8c7d7058144a6934b2abf0841446f4a56de'
            'SKIP')
sha256sums_x86_64=('825e05405dcdd31e87a91a0bfa961c6e954f953d6ead667715924b4703e41ef0')
sha256sums_aarch64=('7e3d9fd33eca25e0fca07c04777d81bdc1b5832819d36b37f0773de742dcbd59')

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
  sed -i 's#Exec=/usr/local/sunlogin/#Exec=/usr/#g' \
          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i 's#Icon=/usr/local/sunlogin/res/icon/sunlogin_client.png#Icon=sunloginclient#g' \
          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # icon
  install -Dm644 usr/local/${_pkgname}/res/icon/sunlogin_client.png \
                 ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  
  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # soft link
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/${_pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # ugly hack
  sed -i "s#/usr/local/sunlogin\x0#/opt/sunlogin\x0\x0\x0\x0\x0\x0\x0#g" \
          "${pkgdir}/opt/${_pkgname}/bin/${pkgname}"
  sed -i "s#/usr/local/sunlogin/res/icon/%s.ico\x0#/opt/sunlogin/res/icon/%s.ico\x0\x0\x0\x0\x0\x0\x0#g" \
          "${pkgdir}/opt/${_pkgname}/bin/${pkgname}"

  # replace /usr/local with /opt
  # prefix 0x48b8, suffix 0x4889, char count(?) 0x45d0
  sed -i "s#\x48\xB8/usr/loc\x48\x89\x45\xD0\x48\xB8al#\x48\xB8///////o\x48\x89\x45\xD0\x48\xB8pt#g" \
         "${pkgdir}/opt/${_pkgname}/bin/oray_rundaemon"
}
# vim: ts=2 sw=2 et: 

