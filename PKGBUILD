# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=ft9xx-libc
pkgver=2.5.0
pkgrel=2
pkgdesc='C register and peripheral library for the FT9XX family of microcontrollers'
arch=(any)
url='https://github.com/BRTSG-FOSS/ft90x-sdk'
license=(MIT)
makedepends=(ft32-elf-gcc)
options=(!strip)
source=("$pkgname::git+https://github.com/BRTSG-FOSS/ft90x-sdk.git"#commit=9230beeaa5e1500db2117f6dec26dec5f434e565)
sha512sums=('SKIP')

build() {
  cd $pkgname

  rm -r Source/Release/*

  export CFLAGS='-fno-math-errno -fno-common -fsigned-char -fdata-sections'

  make TARGET=ft900 CONFIG=Release MKDIR='mkdir -p' -C Source/
  make TARGET=ft930 CONFIG=Release MKDIR='mkdir -p' -C Source/
}

package() {
  cd $pkgname

  mkdir -p "$pkgdir/usr/ft32-elf/lib"

  cp -r --no-preserve=ownership Source/include "$pkgdir/usr/ft32-elf/"

  install -Dm644 Source/Release/ft900/libft900.a "$pkgdir/usr/ft32-elf/lib"
  install -Dm644 Source/Release/ft930/libft930.a "$pkgdir/usr/ft32-elf/lib"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
