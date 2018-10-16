# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=tinyemu
pkgname=(tinyemu jslinux)
pkgver=2018_09_23
pkgrel=3
pkgdesc='RISC-V system emulator'
arch=('x86_64')
groups=('risc-v')
url='https://bellard.org/tinyemu/'
license=('MIT')
makedepends=('gendesk' 'setconf' 'sdl')
source=('jslinux.sh'
        "https://bellard.org/tinyemu/$pkgname-${pkgver//_/-}.tar.gz"
        'https://bellard.org/jslinux/buildroot-riscv64-xwin.cfg'
        'https://bellard.org/jslinux/bbl64-4.15.bin'
        'http://roboticoverlords.org/risc-v.png')
# risc-v.png is drawn by me, in mtPaint. CC0.
# Link to a better icon is more than welcome! :)
sha256sums=('f48f00a16613668b795d1c83333b948f75c4eda7e647ab7f509a306e4ac34e2a'
            '9b58d5521df8356c3be09a520387d3e4adcb510cf8d2fd6bdd971287bd57d734'
            '7d26b9a028d2c5ab70c8c7422fb02dd34f1185c80185629ef526b5cffa0d5db5'
            '81b7dc5671a457d4cdf85690efd5948b228a3f7e7788d0ade57b939f5f450ee1'
            'e3da1fd27e0a12e7c8be082ec33e36133a4beb171a59f4e6cbfec33f8dd8160c')

prepare() {
  gendesk -n -f \
    --name=TinyEMU \
    --pkgname="$pkgname" \
    --pkgdesc="$pkgdesc" \
    --exec=jslinux \
    --categories=Emulator \
    --comment='RISC-V Emulator'
  setconf "$pkgbase-${pkgver//_/-}/Makefile" bindir /usr/bin
}

build() {
  make -C "$pkgbase-${pkgver//_/-}"
}

package_tinyemu() {
  depends=('curl' 'sdl')
  optdepends=('jslinux: Launcher for JS/Linux running on emulated RISC-V')

  cd "$pkgbase-${pkgver//_/-}"
  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
  install -Dm644 readme.txt \
    "$pkgdir/usr/share/doc/$pkgname/readme.txt"
  install -Dm644 MIT-LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_jslinux() {
  depends=('tinyemu')

  install -Dm644 buildroot-riscv64-xwin.cfg \
    "$pkgdir/usr/share/$pkgbase/buildroot-riscv64-xwin.cfg"
  install -Dm644 bbl64-4.15.bin "$pkgdir/usr/share/$pkgbase/bbl64-4.15.bin"
  install -Dm755 jslinux.sh "$pkgdir/usr/bin/jslinux"
  install -Dm644 tinyemu.desktop \
    "$pkgdir/usr/share/applications/tinyemu.desktop"
  install -Dm644 risc-v.png \
    "$pkgdir/usr/share/pixmaps/tinyemu.png"
  install -Dm644 "$pkgbase-${pkgver//_/-}/readme.txt" \
    "$pkgdir/usr/share/doc/$pkgname/readme.txt"
  install -Dm644 "$pkgbase-${pkgver//_/-}/MIT-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
