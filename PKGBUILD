# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sunloginclient-cli
_pkgname=sunloginclientshell
pkgver=10.1.1.28779
pkgrel=2
pkgdesc="Sunlogin Remote Control is a software that supports remote control of mobile devices, Windows, Mac, Linux and other systems.(CLI version)"
arch=("x86_64")
url="https://sunlogin.oray.com"
license=('custom')
depends=("ncurses5-compat-libs"
         "glib2")
conflicts=('sunloginclient')
options=('!emptydirs')
source=("http://dl-cdn.oray.com/sunlogin/linux/${_pkgname}-${pkgver}-amd64.deb"
        'LICENSE::https://service.oray.com/question/1820.html')
install='.INSTALL'
sha256sums=('923a8bfdb1194ee50d8c6dd7b51a0f16ab34b3414c768f5ffa2b49d80874eed5'
            'SKIP')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/opt"
  cp -r "${pkgdir}/usr/local/sunlogin" "${pkgdir}/opt/sunlogin"

  # 安装systemd service	
  install -Dm644 "${pkgdir}/usr/local/sunlogin/scripts/runsunloginclient.service" "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
  # 修改路径
  sed -i 's#/usr/local/#/opt/#g' "${pkgdir}/opt/sunlogin/etc/watch.sh"
  sed -i "s#/usr/local/#/opt/#g" "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
  # 安装图标
  install -Dm644 "${pkgdir}/opt/sunlogin/res/icon/sunlogin_client.png" "${pkgdir}/usr/share/pixmaps/sunlogin_client.png"
  # 安装协议
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # 创建软链
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/sunlogin/bin/sunloginclient" "${pkgdir}/usr/bin/sunloginclient"
  ln -s "/opt/sunlogin/bin/oray_rundaemon" "${pkgdir}/usr/bin/oray_rundaemon"

  #  ugly hack
  sed -i "s#/usr/local/sunlogin\x0#/opt/sunlogin\x0\x0\x0\x0\x0\x0\x0#g" "${pkgdir}/opt/sunlogin/bin/sunloginclient"

  # delete unnecessary files
  rm -r "${pkgdir}/usr/local"
  rm -r "${pkgdir}/opt/sunlogin/scripts"

  #fix permission
  chmod 755 ${pkgdir}/usr
  chmod 755 ${pkgdir}/usr/share
}
# vim: ts=2 sw=2 et:
