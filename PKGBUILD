pkgname=prism2-usb-firmware
pkgver=0.2.9
pkgrel=2
arch=(x86_64)
source=("git://git.shaftnet.org/linux-wlan-ng.git"
        "srec2fw.c::http://anonscm.debian.org/viewvc/linux-wlan-ng/trunk/debian/srec2fw.c?revision=200&view=co"
        "srec2fw.1::http://anonscm.debian.org/viewvc/linux-wlan-ng/trunk/debian/srec2fw.1?revision=205&view=co")
sha256sums=('SKIP'
            'ef406281b2734be7b3e6ee837a0a859ff5920351ac47decdaaad9b4c2e705fc4'
            '4ca9855fd8a15bf573ece48e839e9560fde93eab43c0dec76db27fcdb7258d50')

build() {
  make srec2fw
}

package() {
  install -Dm 755 srec2fw   "$pkgdir/usr/bin/srec2fw"
  install -Dm 644 srec2fw.1 "$pkgdir/usr/share/man/man1/srec2fw.1"

  for file in linux-wlan-ng/src/prism2/*.hex; do
    ./srec2fw "$file" "${file/%.hex/.fw}"
  done

  for file in linux-wlan-ng/src/prism2/*.{hex,fw}; do
    install -Dm 644 "$file" "$pkgdir/usr/lib/firmware/${file##*/}"
  done

  ln -s ru010803.hex "$pkgdir/usr/lib/firmware/prism2_ru.hex"
  ln -s ru010803.fw  "$pkgdir/usr/lib/firmware/prism2_ru.fw"
}

# vim: ts=2:sw=2:et
