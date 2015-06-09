# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=uplink
pkgver=1.55
pkgrel=4
pkgdesc="Trust is a weakness - a futuristic computer crime game"
arch=(i686 x86_64)
url="http://www.introversion.co.uk/uplink"
license=(custom)
depends=(libjpeg6 mesa zlib libxdamage)
[[ $CARCH == x86_64 ]] && depends=(lib32-libjpeg6 lib32-mesa lib32-zlib lib32-libxdamage)
noextract=(uplink.zip)

# Requires uplink.zip from original Uplink CD
source=(uplink.zip uplink.desktop
        "$url/downloads/uplink-patch-${pkgver}.tar.gz"
        "$url/downloads/UplinkBoBCodeCard.pdf")
sha256sums=('52d5b1efaecca11b400c2ab7755924a8034c09a4edd201737ba61da6bc479c02'
            'c8df0262817154926f73c373621783d0274fec3e0eb58cde0ebc6b2a407064eb'
            '147f41468b0d837a168c760d045b23eecd95a7936fca239d3bea78be0a1936a0'
            'e5734f6c394b8eaa3a3449f4d4a6df0fefa4675fb8e8a515f83e4a3b710d528a')

prepare() {
  bsdtar -xf uplink.zip data.dat fonts.dat graphics.dat loading.dat music.dat world.dat
  cat >uplink.sh <<END
#!/bin/sh
exec /usr/share/$pkgname/lib/uplink.bin.x86 "\$@"
END
}

package() {
  install -Dm755 uplink/lib/uplink.bin.x86 "$pkgdir/usr/share/$pkgname/lib/uplink.bin.x86"
  install -m644 *.dat uplink/lib/*.dat "$pkgdir/usr/share/$pkgname/lib"
  install -m755 uplink/lib/*.so.* "$pkgdir/usr/share/$pkgname/lib"
  install -Dm644 uplink.desktop "$pkgdir/usr/share/applications/uplink.desktop"
  install -Dm644 uplink/uplink.png "$pkgdir/usr/share/pixmaps/uplink.png"
  install -Dm644 UplinkBoBCodeCard.pdf "$pkgdir/usr/share/doc/$pkgname/UplinkBoBCodeCard.pdf"
  install -m644 uplink/*.{txt,patch} "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 uplink.sh "$pkgdir/usr/bin/uplink"
}
