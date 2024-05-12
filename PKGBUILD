# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=ef3kffusb
pkgver=1.93
pkgrel=1
pkgdesc='All-in-1 utility for the Kung Fu Flash cartridge based on EasyFlash 3 USB Utilities and its USB connection to the PC'
arch=('x86_64')
url='https://github.com/KimJorgensen/KungFuFlash/tree/master/3rd_party/ef3utils'
makedepends=('git' 'tass64')
license=('unknown')
source=("git+https://github.com/KimJorgensen/KungFuFlash")
sha256sums=('SKIP')

pkgver() {

   head -n 1 "$srcdir/KungFuFlash/3rd_party/ef3utils/readme.txt" | cut -d ' ' -f 5 | cut -d 'V' -f 2

}

prepare() {

   rm "$srcdir/KungFuFlash/3rd_party/ef3utils/ef3usb"
   rm "$srcdir/KungFuFlash/3rd_party/ef3utils/ef3usb.exe"
   rm "$srcdir/KungFuFlash/3rd_party/ef3utils/ef3usb.prg"

   sed -i s#"ef3usb.prg"#"/usr/share/${pkgname}/${pkgname}.prg"#g "$srcdir/KungFuFlash/3rd_party/ef3utils/Src/ef3usb.c"

}

build() {

   cd "$srcdir/KungFuFlash/3rd_party/ef3utils/Src"
   make all

}

package() {

  install -Dm755 "$srcdir/KungFuFlash/3rd_party/ef3utils/ef3usb" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/KungFuFlash/3rd_party/ef3utils/ef3usb.prg" "${pkgdir}/usr/share/${pkgname}/${pkgname}.prg"
  install -Dm644 "$srcdir/KungFuFlash/3rd_party/ef3utils/readme.txt" "$pkgdir/usr/share/doc/$pkgname/README"

  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0660", TAG+="uaccess"' > "$pkgdir/usr/lib/udev/rules.d/65-$pkgname.rules"

}
