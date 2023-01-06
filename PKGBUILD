# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=coolq-pro
pkgname=${_pkgname}-bin
pkgver=5.15.5
pkgrel=1
pkgdesc="一款智能机器人软件，由应用提供群管理、智能对话、好友互动、生活助理等智能功能。"
arch=(any)
url="https://cqp.cc/t/14901"
license=('custom')
depends=('wine' 'wqy-microhei' 'xorg-xhost' 'novnc' 'websockify' 'tigervnc')
makedepends=('unzip-iconv')
groups=('eqs')
install=coolq-pro.install
provides=('coolq')
source=("$pkgname-$pkgver.zip::https://dlsec.cqp.me/cqp-full"
        "LICENSE.html::https://docs.cqp.im/about/tos/"
        dll.tar.xz
        coolq-wine.reg
        coolq-vncserver.service
        xstartup
        tmpfiles.d
        sysusers.d
        coolq@.service
        coolq-wrapper)
sha512sums=('a63dbaeed73f98e4ae44641838c27536bd9cfdaec8b0bb2c7ec3da20633954b7b27ab1726d26d33ca7c953dacd2df484e6652e191822a38a3ac37ec30ba86d57'
            '9470f692d5b257eff200dd28109467223302f1a8d8d16e0c172607643244917f2592a48d638dc3f95da26174a7e9bddfdaa004c4be3ad4d2b00897103c73137e'
            '0ac185656fa96d186270f6e99347a1895098377938f20efca5f8fa7b7cf77f0b842fb13569b3f77e610906d3dd4eb46a4715c5cdee409d589b211f30fbb2b92f'
            'a6614806ce2a976dcdbcc3534cd60e6270629fd89e84dc965188fa2df9ada5a3fbf9211950e8221cd044cf2f95720db1d62e5a371bc8c9fd2ebfbc64f4ca4428'
            '0a4e9babd15138f928337649bd30a60d429202255e5516a030f34662caa98adb7db6db64765ff506f8b00106007b48b9714f75836d4d4ea48a91e69d50baa86b'
            'cd13da780da4cbee7428bc8be5e67da80d2b1aaca07f9bae9f5721116ec517c33b62db168e689b3b289308ae01ffa615967844a4f42749a50a489ba7e5af79e9'
            'ea67079f4cc5f5c224ad4b6b6db666ab5da68e858aaebb5951848b48e728570850a28387f9f5eb3cd0de889fdd71cb8944537ada6987addd47d59a4179a3f11b'
            'd762cb27141c3cffe455922c45d98642dcb551f31f11b310f658e0359959d11a93981be4ceea69405b6fbd5b9b892da0f6b34a53f94401b9e551d9d2845a8415'
            '94e87b1bffd83606e71fe072459dea0a190539540a5f3aaf28ee746874757c98c1bad75fb7bb22831d5503a787c323be74c638c6bd6fd9ee20200b29475db082'
            '127e254f6b9390456d013f30858757657bf3338f427323efcac5d666fd02da3ac133404019b892b467ef428995009794ed5aca844a58ad1ddbbfb796b81844d7')
noextract=("$pkgname-$pkgver.zip")

prepare() {
  unzip -oO gbk $pkgname-$pkgver.zip
  sed -i 's/1/0/g' "酷Q Pro/conf/CQP.cfg"
}

build() {
  tee env << EOF
VNC_PASSWORD=MAX8char
DISPLAY=:233
XAUTHORITY=/run/coolq-vnc/.Xauthority
EOF
}

package() {
  install -Dm644 LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a "酷Q Pro"/*  "$pkgdir/opt/$_pkgname"

  install -Dm755 coolq-wrapper "$pkgdir/usr/bin/coolq"

  install -Dm644 msscript.ocx "$pkgdir/opt/$_pkgname/wine/msscript.ocx"
  install -Dm644 winhttp.dll "$pkgdir/opt/$_pkgname/wine/winhttp.dll"
  install -Dm644 coolq-wine.reg "$pkgdir/opt/$_pkgname/wine/coolq-wine.reg"

  install -Dm644 coolq-vncserver.service "$pkgdir/usr/lib/systemd/system/coolq-vncserver.service"
  install -Dm644 coolq@.service "$pkgdir/usr/lib/systemd/system/coolq@.service"

  install -Dm755 xstartup "$pkgdir/usr/lib/coolq/xstartup"
  install -Dm644 env "$pkgdir/etc/coolq/env"

  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/coolq.conf"
  install -Dm644 sysusers.d "$pkgdir/usr/lib/sysusers.d/coolq.conf"
}
