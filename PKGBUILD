# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sunloginclient
_pkgname=sunlogin
pkgver=11.0.0.35346
pkgrel=1
pkgdesc="Proprietary software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(GUI version)"
arch=("x86_64")
url="https://sunlogin.oray.com"
depends=("libappindicator-gtk3"
         'aspell'
         'hspell'
         'nuspell' 
         'hunspell'
         'libvoikko'
         'xorg-xhost')
license=('custom')
provides=('sunlogin')
source=("https://down.oray.com/${_pkgname}/linux/${pkgname}-${pkgver}-amd64.deb"
        "runsunloginclient.service"
        'LICENSE::https://service.oray.com/question/1820.html')
install="${pkgname}.install"
sha256sums=('6f7d6d91f87da0b8dd5f101df5f49e6fa2ab027e01fe34205e920fe48da9c21e'
            'e23fe5524a0574e3fec38a36b1f87582f75bce68bceaef5982dc3a459eb57e18'
            'SKIP')

build() {
  mkdir -p build
  tar -xf data.tar.xz -C build
}

package() {
  cd build

  # system service
  install -Dm644 ${srcdir}/run${pkgname}.service -t \
      "${pkgdir}/usr/lib/systemd/system/"
  
  # bin
  find usr/local/${_pkgname}/bin -type f -exec \
      install -Dm755 {} -t ${pkgdir}/opt/${_pkgname}/bin \;

  # font
  find usr/local/${_pkgname}/res/font -type f -exec \
      install -Dm644 {} -t ${pkgdir}/opt/${_pkgname}/res/font \;

  # icon
  find usr/local/${_pkgname}/res/icon -type f -exec \
      install -Dm644 {} -t ${pkgdir}/opt/${_pkgname}/res/icon \;

  # skin
  # needed write permission
  find usr/local/${_pkgname}/res/skin -type f -exec \
      install -Dm666 {} -t ${pkgdir}/opt/${_pkgname}/res/skin \;

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

  #  ugly hack
  sed -i "s#/usr/local/sunlogin\x0#/opt/sunlogin\x0\x0\x0\x0\x0\x0\x0#g" \
          "${pkgdir}/opt/${_pkgname}/bin/${pkgname}"
  sed -i "s#/usr/local/sunlogin/res/icon/%s.ico\x0#/opt/sunlogin/res/icon/%s.ico\x0\x0\x0\x0\x0\x0\x0#g" \
          "${pkgdir}/opt/${_pkgname}/bin/${pkgname}"
  sed -i "s#/usr/local/sunlogin\x0#/opt/sunlogin\x0\x0\x0\x0\x0\x0\x0#g" \
          "${pkgdir}/opt/${_pkgname}/bin/oray_rundaemon"
}
# vim: ts=2 sw=2 et: 

