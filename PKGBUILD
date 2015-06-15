#! /bin/bash
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: darkraid1 <darkraid1@gmail.com>
# Contributor: jorge_barroso <jorge.barroso.11 at gmail dot com>
#
pkgname=carnagecontest
pkgver=0.1.0.1
_ver=0101
pkgrel=2
pkgdesc="A free 2D turn based multiplayer shooter with fully destructible terrain"
arch=('i686' 'x86_64')
url="http://carnagecontest.com/"
license=('custom')

if [ "$CARCH" == "i686" ]; then
    depends=('freetype2' 'libtxc_dxtn' 'libxcursor' 'mesa' 'openal' 'lua')
elif [ "$CARCH" == "x86_64" ]; then
    depends=('lib32-freetype2' 'lib32-libtxc_dxtn' 'lib32-libxcursor' 'lib32-mesa' 'lib32-openal' 'lua')
fi
makedepends=('unzip' 'curl')

#https://bbs.archlinux.org/viewtopic.php?id=141195
grabcid() {
  local file=cc_b${_ver}_linux.zip
  echo "$(curl -Ss "http://www.unrealsoftware.de/get.php?get=${file}&p=1" | 
            grep -o '"get.php[^"]\+"' | cut -d'"' -f2 | sed 's/&amp;/\&/g')"
}
_cid=$(grabcid) # this will hide the cmd line above from AUR interface

source=(cc_b${_ver}_linux.zip::"http://www.unrealsoftware.de/get.php?get=cc_b${_ver}_linux.zip&p=1&cid=${_cid}"
        cc_b${_ver}_win.zip::"http://www.unrealsoftware.de/get.php?get=cc_b${_ver}_win.zip&p=1&cid=${_cid}"
        $pkgname.desktop)
install="$pkgname.install"
noextract=(cc_b${_ver}_linux.zip
           cc_b${_ver}_win.zip)

sha512sums=('a6ce91c774f5fa6c8d509508b4aef097b78cea6644815fda9947233dd12ab42ec63acb62c19dc733123a2da90c4d7d043db9a61a739b11f63259ee9a4053a152'
            'dc7c184f77df074f10b3d27ad9087eaddb231d78cac6db3ab57f0a7257a6897763039868b78f285b98603670a1bdf3112fdbd1e06917b9321d1dd284ba9aeae2'
          'cb69c66b037c4cea9572dfbaff3f29b532875848f24d931b3b5aff6bd1b2dad01698c36ac4c940c65b853a03858e49062b53043185ccb0895f6309faa5fed1f4')

package() {
    install -d -m 755 "$pkgdir"/usr/share/$pkgname
    unzip cc_b${_ver}_win.zip -d "$pkgdir"/usr/share/$pkgname
    unzip -o cc_b${_ver}_linux.zip -d "$pkgdir"/usr/share/$pkgname
    
    find "$pkgdir"/usr/share/$pkgname/sys -type f -exec chmod -R 666 {} \;
    find "$pkgdir"/usr/share/$pkgname/teams -type f -exec chmod -R 666 {} \;
    chmod 777 "$pkgdir"/usr/share/$pkgname/{teams,sys,sys/gamesettings}
    install -d -m 666 "$pkgdir"/usr/share/$pkgname/debug

    install -d -m 755 "$pkgdir"/usr/bin
    ln -s /usr/share/$pkgname/CarnageContest "$pkgdir"/usr/bin/$pkgname
    chmod +x "$pkgdir"/usr/share/$pkgname/CarnageContest
    
	#install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

