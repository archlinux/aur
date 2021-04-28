# Maintainer: qvshuo

pkgname=wechat-nativefier
pkgver=20210429.1
pkgrel=1
pkgdesc="由nativefier生成（基于Electron 12）, 模仿了Windows版微信的界面。"
arch=("x86_64")
url="https://wx.qq.com/"
license=("MIT")
makedepends=("nodejs-nativefier")
source=(
  "${pkgname}.css"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha512sums=(
  "a5cbabd4eb17c89fe7cee345a5a3a3263306e6510ad34b06f6cee1f9221da18d7d38158a8e9cd102efe7f220efe862a8ec08d7422840e5587b19e611667280c2"
  "1d7f3f2b11f689b22149b369dd1d6261c2c5ffc77a27e5351596597d790a1066a1765511975e8260188db8d48f8c5dbabb2375dba60027316c8e3809591c9b4f"
  "718d0a44567a32a9ae4e875df8ee905b93f52bc6570dd7b75120bd5f801d2d350ae6d378e84b243cb8af80ccf85c1c873f43a8138efb880f27df8e356a2bcfce"
)

_instname=WeChat

build() {
  nativefier \
	--name "$_instname" \
	--icon "${pkgname}.png" \
	--user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Safari/537.36' \
	--internal-urls ".*?" \
	--inject "${pkgname}.css" \
	--tray \
	--file-download-options '{"saveAs": true}' \
	"${url}"
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}
