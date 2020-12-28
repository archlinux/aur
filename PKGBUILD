# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sunloginclient-cli
_pkgname=sunloginclientshell
pkgver=10.1.1.28779
pkgrel=3
pkgdesc="Proprietary software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(CLI version)"
arch=("x86_64")
url="https://sunlogin.oray.com"
license=('custom')
depends=("ncurses5-compat-libs"
         "glib2")
conflicts=('sunlogin')
options=('!emptydirs')
source=("http://dl-cdn.oray.com/sunlogin/linux/${_pkgname}-${pkgver}-amd64.deb"
        'LICENSE::https://service.oray.com/question/1820.html')
install="${pkgname}.install"
sha256sums=('923a8bfdb1194ee50d8c6dd7b51a0f16ab34b3414c768f5ffa2b49d80874eed5'
            'SKIP')

build() {
  mkdir -p build
  tar -xf data.tar.xz -C build
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -r build/usr/local/sunlogin "${pkgdir}/opt/sunlogin"

  # systemd service
  install -Dm644 "build/usr/local/sunlogin/scripts/runsunloginclient.service" "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
  
  # fixed path
  sed -i 's#/usr/local/#/opt/#g' "${pkgdir}/opt/sunlogin/etc/watch.sh" \
                                 "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
  
  # LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # soft link
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/sunlogin/bin/sunloginclient" "${pkgdir}/usr/bin/sunloginclient"

  #  ugly hack
  sed -i "s#/usr/local/sunlogin\x0#/opt/sunlogin\x0\x0\x0\x0\x0\x0\x0#g" "${pkgdir}/opt/sunlogin/bin/sunloginclient"

  # delete unnecessary files
  rm -r "${pkgdir}/opt/sunlogin/scripts"

}
# vim: ts=2 sw=2 et:
