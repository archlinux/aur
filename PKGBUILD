# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=syobon
pkgver=rc1
pkgrel=3
pkgdesc="A free version of the unforgiving Japanese parody of Super Mario Bros"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opensyobon/"
license=('unknown')
depends=(sdl_gfx sdl_image sdl_mixer sdl_ttf)
makedepends=()
source=(syobon
        syobon.desktop
        "http://sourceforge.net/projects/opensyobon/files/src/SyobonAction_rc2_src.tar.gz"
        "http://sourceforge.net/projects/opensyobon/files/src/SyobonAction_rc2_data.tar.gz")
sha256sums=('c749349348357eeca4c9a1e150d5f32a40d5e11517d46840cba0c777fa788885'
            'f8a78cbb118fe85b7d36c315d068aea28f8079879bb852e6648f4d4f6989d64b'
            'a61a621de7e4603be047e8666c0376892200f2876c244fb2adc9e4afebc79728'
            '073be7634600df28909701fa132c8e474de1ff9647bf05816f80416be3bcaa9f')

build() {
  cd "$srcdir/src/"
  sed -i 's/gcc/g++ -Wno-narrowing `sdl-config --cflags`/g' Makefile
  make
}

package() {
  _data_dirs=(BGM SE res)
  install -Dd -m755 "$pkgdir/usr/share/syobon"
  for _ddir in ${_data_dirs[*]}; do
    cp -r "$srcdir/$_ddir/" "$pkgdir/usr/share/syobon/"
  done
  find "$pkgdir/usr/share/syobon/" -type d -exec chmod 755 "{}" \;
  find "$pkgdir/usr/share/syobon/" -type f -exec chmod 644 "{}" \;
  install -D -m755 "$srcdir/syobon" "$pkgdir/usr/bin/syobon"
  install -D -m755 "$srcdir/src/SyobonAction" "$pkgdir/usr/lib/syobon/syobon"
  install -D -m644 "$srcdir/syobon.desktop" "$pkgdir/usr/share/applications/syobon.desktop"

  install -d "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  convert -format png "$srcdir/icon.ico" "$pkgdir/usr/share/icons/hicolor/32x32/apps/syobon.png"
  for res in 48 64 128 192 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps"
    convert -scale "${res}x${res}" "$pkgdir/usr/share/icons/hicolor/32x32/apps/syobon.png" "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/syobon.png"
  done
}

# vim:set ts=2 sw=2 et:
