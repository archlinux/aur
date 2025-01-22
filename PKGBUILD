# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: zhullyb <zhullyb at outlook dot com>

pkgname=sunloginclient
_pkgname=sunlogin
_debname=SunloginClient
pkgver=15.2.0.63064
pkgrel=2
pkgdesc="Proprietary software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(GUI version)"
arch=("x86_64")
url="https://sunlogin.oray.com"
depends=("libappindicator-gtk3"
         'xorg-xhost'
         'libcrypt.so=1-64')
license=('custom')
provides=('sunlogin')
source=("runsunloginclient.service"
        'LICENSE::https://service.oray.com/question/1820.html')
source_x86_64=("https://down.oray.com/${_pkgname}/linux/${_debname}_${pkgver}_amd64.deb")
install="${pkgname}.install"
options=(emptydirs)
sha256sums=('bdf8bae0231c1ba656adba5d8fb519fa00eb2294dee487e8c06b4ffd3e9f487e'
            'SKIP')
sha256sums_x86_64=('ddae5d364eb8b69406a0e183490450fd2f91f072972b3708e9518e8852cb8a63')

build() {
  mkdir -p build
  tar -xf data.tar.xz -C build
}

_install (){
  cd ${srcdir}/build

  find usr/local/${_pkgname}/$1 -maxdepth 1 -type f -exec \
      install -Dm$2 {} -t ${pkgdir}/opt/${_pkgname}/$1 \;
}

package() {
  cd build

  # system service
  install -Dm644 ${srcdir}/run${pkgname}.service -t \
                 "${pkgdir}/usr/lib/systemd/system/"
  # bin
  _install bin 755

  # etc
  # empty dir
  install -dm755 ${pkgdir}/opt/${_pkgname}/etc

  # lib
  _install lib 644

  # res
  _install res 644

  # res/font
  _install res/font 644

  # res/icon
  _install res/icon 644

  # res/locales
  _install res/locales 644

  # res/skin
  _install res/skin 644

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
