pkgname=prism2-usb-firmware
pkgver=0.2.9
pkgrel=1
arch=(x86_64)
_deb="prism2-usb-firmware-installer_0.2.9+dfsg-5_amd64.deb"
source=("http://ftp.bg.debian.org/debian/pool/contrib/l/linux-wlan-ng/$_deb"
        "git://git.shaftnet.org/linux-wlan-ng.git")
sha256sums=('c0ea25167f45eaafb07c75c7b20d6cefacefcba57c17f8f98ca793804f843ea1'
            'SKIP')

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  install -Dm 755 usr/bin/srec2fw "$pkgdir/usr/bin/srec2fw"

  for file in linux-wlan-ng/src/prism2/*.hex; do
    usr/bin/srec2fw "$file" "${file/%.hex/.fw}"
  done

  for file in linux-wlan-ng/src/prism2/*.{hex,fw}; do
    install -Dm 644 "$file" "$pkgdir/usr/lib/firmware/${file##*/}"
  done

  ln -s ru010803.hex "$pkgdir/usr/lib/firmware/prism2_ru.hex"
  ln -s ru010803.fw  "$pkgdir/usr/lib/firmware/prism2_ru.fw"
}

# vim: ts=2:sw=2:et
