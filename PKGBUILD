# Maintainer: qvshuo

pkgname=wechat-nativefier
pkgver=20210503.6
pkgrel=1
pkgdesc='Yet another electron WeChat for Linux desktop.'
arch=('x86_64')
url='https://wx.qq.com/'
license=('MIT')
source=('git+https://github.com/qvshuo/yachat')
sha512sums=('SKIP')

appname=WeChat
gitname=yachat

build() {
  cd $gitname

  nativefier \
    --name "$appname" \
    --icon "$pkgname.png" \
    --inject "$pkgname.css" \
    --inject "$pkgname.js" \
    --internal-urls ".*?" \
    --file-download-options '{"saveAs": true}' \
    "${url}"
}

package() {
  cd $gitname

  # Creating needed directories
  install -dm755 "$pkgdir/opt/"
	install -dm755 "$pdkdir/usr/bin"
	install -dm755 "$pdkdir/usr/share/pixmaps/"
	install -dm755 "$pdkdir/usr/share/applications/"

  # Install program
  cp -rL "$appname-linux-x64" "$pkgdir"/opt/$pkgname
  ln -sf "$pkgdir"/opt/$pkgname "$pkgdir"/usr/bin/$appname

  # Install desktop launcher
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$appname.desktop
  ln -sf "$pkgdir"/opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$appname.png

  chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}
