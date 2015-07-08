# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Tom < tomgparchaur at gmail dot com >

pkgname=copy-agent
pkgver=3.2.01.0481
pkgrel=1
pkgdesc="Copy.com sync agent"
arch=("i686" "x86_64" "armv6h")
url="http://www.copy.com"
license=(custom)
depends=("fuse" "desktop-file-utils")
optdepends=("qt4: GUI support"
            "libindicator-gtk2: indicator support")
options=('!strip' '!upx')
install=$pkgname.install
sha256sums=('f33c0297c2d8f7e90ec481beed88a918446a87507c9ea29f8feae21a4e85f72e'
            'ef1767720b5e5eff6567e537f3fed1c1d7da17e4f4248479816cab924f62e431'
            'b69bc2f8b4315a43d3b60b11ec9c226c2060d14ac4d5702140260961c74620cb'
            'f9a460a12e5ee382b9d2d435028b46e3e289c0b49e4fd382d67052f297531c4a'
            'b0f44d8e7144b2b00b4494c14795dde87f1db9bd7947b9be2986f393562f8a98'
            '059995cd96ae09d92681063ffd6d5ee603fa1a4b9fdae9b315494d5becb203c6'
            'c328ddfce46fb5577b1d3d4f67258aa1caee671214e335d802cdc9a065a1595a')

source=(https://copy.com/install/linux/Copy.tgz
        $pkgname.desktop
        $pkgname.png
        $pkgname.service
        copy-console.service
        launch.sh
        TERMS)

package() {
  cd ${srcdir}
  desktop-file-install $pkgname.desktop --dir "$pkgdir/usr/share/applications/"
  install -Dm0644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm0644 $pkgname.service "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm0644 copy-console.service "$pkgdir/usr/lib/systemd/user/copy-console.service"
  install -Dm0644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 TERMS "$pkgdir/usr/share/licenses/$pkgname/TERMS"

  if [ "$CARCH" == "x86_64" ]; then
    cd copy/x86_64
  elif [ "$CARCH" == "i686" ]; then
    cd copy/x86
  else
    cd copy/armv6h
  fi

  for i in lib{AgentSync,Brt,CloudSync}.so; do
    install -Dm755 $i "$pkgdir/opt/copy/$i"
  done

  if [ "$CARCH" != "armv6h" ]; then
    install -Dm755 libGui.so "$pkgdir/opt/copy/libGui.so"
  fi

  for i in ca-bundle.crt copyext.rcc; do
    install -Dm755 $i "$pkgdir/opt/copy/$i"
  done

  mkdir -p $pkgdir/usr/bin
  for i in Copy{Agent,Cmd,Console}; do
    install -Dm755 $i "$pkgdir/opt/copy/$i"
    install -Dm755 $srcdir/launch.sh $pkgdir/usr/bin/$i
  done

  install -Dm755 libnautilus-copy.so "$pkgdir/usr/lib/nautilus/extensions-3.0/libnautilus-copy.so"
  install -Dm755 libcaja-copy.so "$pkgdir/usr/lib/caja/extensions-2.0/libcaja-copy.so"
}
