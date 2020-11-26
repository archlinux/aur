# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sunloginclient
_pkgname=sunlogin
pkgver=10.1.1.38139
pkgrel=6
pkgdesc="Sunlogin Remote Control is a software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(GUI version)"
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
source=("http://dl-cdn.oray.com/${_pkgname}/linux/SunloginClient-${pkgver}_amd64.deb"
        'LICENSE::https://service.oray.com/question/1820.html')
install="${pkgname}.install"
sha256sums=('0467fa18f99d01d38f311c5b36b0f53f8ad36f5a6f1426ee552143b9de42939c'
            'SKIP')
prepare() 
{
  mkdir -p build
  tar -xf data.tar.xz -C build
}

package() {
  cd build

  # system service
  install -Dm644 usr/local/${_pkgname}/scripts/runsunloginclient.service "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
  
  # bin
  find usr/local/${_pkgname}/bin -type f -exec install -Dm755 {} -t ${pkgdir}/opt/${_pkgname}/bin \;

  # etc
  find usr/local/${_pkgname}/etc -type f -exec install -Dm644 {} -t ${pkgdir}/opt/${_pkgname}/etc \;

  # font
  # needed write permission
  find usr/local/${_pkgname}/res/font -type f -exec install -Dm666 {} -t ${pkgdir}/opt/${_pkgname}/res/font \;

  # icon
  find usr/local/${_pkgname}/res/icon -type f -exec install -Dm644 {} -t ${pkgdir}/opt/${_pkgname}/res/icon \;

  # skin
  # needed write permission
  find usr/local/${_pkgname}/res/skin -type f -exec install -Dm666 {} -t ${pkgdir}/opt/${_pkgname}/res/skin \;

  # desktop entry
  install -Dm644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications

  # fix path
  sed -i 's#/usr/local/#/opt/#g' "${pkgdir}/opt/${_pkgname}/etc/watch.sh"
  sed -i "s#/usr/local/#/opt/#g" "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
  sed -i 's#Exec=/usr/local/sunlogin/#Exec=/usr/#g' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i 's#Icon=/usr/local/sunlogin/res/icon/sunlogin_client.png#Icon=sunloginclient#g' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	  # 修复开机启动后第一次连接失败的问题
  sed -i '2a\Requires=network-online.target\nAfter=network-online.target' "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
  
  # icon
  install -Dm644 usr/local/${_pkgname}/res/icon/sunlogin_client.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  
  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # soft link
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/${_pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "/opt/${_pkgname}/bin/oray_rundaemon" "${pkgdir}/usr/bin/oray_rundaemon"

  #  ugly hack
  sed -i "s#/usr/local/sunlogin\x0#/opt/sunlogin\x0\x0\x0\x0\x0\x0\x0#g" "${pkgdir}/opt/${_pkgname}/bin/${pkgname}"
  sed -i "s#/usr/local/sunlogin/res/icon/%s.ico\x0#/opt/sunlogin/res/icon/%s.ico\x0\x0\x0\x0\x0\x0\x0#g" "${pkgdir}/opt/${_pkgname}/bin/${pkgname}"
}
# vim: ts=2 sw=2 et:
