# Maintainer: Daniel Menelkir (dmenelkir at gmail dot com)

pkgname=fuse-emulator-git
pkgver=1.6.0.r76.gd9dc145
pkgrel=2
epoch=1
pkgdesc="ZX Spectrum emulator."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/fuse.php"
license=("GPL")
depends=('gtk3' "libspectrum-git" 'sdl')
conflicts=('fuse-emulator-sdl' 'fuse-emulator' 'fuse-emulator-sdl-git')
source=("fuse-emulator::git+https://git.code.sf.net/p/fuse-emulator/fuse"
        "https://gitlab.com/menelkir/fuseroms/-/archive/0.2/fuseroms-0.2.tar.gz"
        "fuse-emulator-git.desktop")
sha512sums=("SKIP"
                "16f0993e6237252893e4624733f6e609a02a7cd9a726976b6dbf3ef1f08b3bda36c5ebadb07ba5283326dce1f71be10ce1ef6601262aa11e1ddc94e958ab63ac"
                "f1a3b0920092b5d55d5d021cfa16331d656114eaf0dabff065f8adc727d1642a2dce788c0fd2c7385ff843720da1a90e8b8a7d1858786d0bd882fc4462cba421")

pkgver() {
  cd "fuse-emulator"
  git describe --long --tags --abbrev=7 | sed 's/^fuse-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "fuse-emulator"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "fuse-emulator"
    make DESTDIR="$pkgdir" install
    install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    for resolution in 16x16 32x32 48x48 64x64 128x128 256x256
    do
        install -D -m 644 "data/icons/$resolution/fuse.png" "$pkgdir/usr/share/icons/hicolor/$resolution/apps/$pkgname.png"
        install -D -m 644 "data/icons/$resolution/application-x-spectrum.png" "$pkgdir/usr/share/icons/hicolor/$resolution/mimetypes/application-x-spectrum.png"
    done

    # Extra ROMs
    install -D -m 644 "$srcdir"/fuseroms-0.2/fuse-extra/* -t "$pkgdir"/usr/share/fuse/

}

