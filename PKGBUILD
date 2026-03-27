# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# xbrzscale does not currently have any version or release tags to use
# Pinned to xbrzscale 1.8 via the git commit
# Update vendored xbrz library to 1.9
# Patch makefile to fix RELRO

pkgname=xbrzscale
pkgver=1.9
pkgrel=1
pkgdesc="New Generation Image Upscaling Tool"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/xbrz/files/xBRZ/"
url="https://github.com/atheros/xbrzscale"
license=('GPL-3.0-only')
depends=(sdl2_image sdl2-compat libgcc glibc libstdc++)
_commit=ef36908831c058df7a202c8175d575a1fdfaf156
source=("$pkgname.zip::https://github.com/atheros/xbrzscale/archive/$_commit.zip"
    "xbrz-$pkgver.zip::https://sourceforge.net/projects/xbrz/files/xBRZ/xBRZ_1.9.zip/download"
    "001-makefile.patch"
    "002-argb.patch")
sha256sums=('5b418a271d79f5e7b7add2cc487785c05dbbfd8342e3c18ed7c0a4f70e121bfa'
            'b2dff73b3abd24a18a7cde78d5ff5ed8f0922296dce6ed734dce2264cd0a0fc9'
            'ee087616687da45a8496de4109e0188eb6bdcd24a13cad9d80361ef4a32c0a8c'
            '1d71df7bdcebd0893ff66e85eb409207d559ee04defe34ee167ad073d6e9292b')
noextract=($pkgname.zip)


prepare() {
  bsdtar -xf $pkgname.zip -s /$pkgname-$_commit/$pkgname/
  bsdtar -xf xbrz-1.9.zip

# Replace /xbrz contents (Update to version 1,9)
  rm "$pkgname"/xbrz/*
  mv xbrz.cpp      "$pkgname/xbrz/"
  mv xbrz.h        "$pkgname/xbrz/"
  mv xbrz_config.h "$pkgname/xbrz/"
  mv xbrz_tools.h  "$pkgname/xbrz/"
  mv Changelog.txt "$pkgname/xbrz/"

# Apply patches
  cd "$pkgname"
  patch -Np1 < "$srcdir/001-makefile.patch"
  patch -Np1 < "$srcdir/002-argb.patch"
}


build() {
  cd "$pkgname"
  make
}


package() {
  cd "$pkgname"
  install -Dm 755 "$pkgname"         -t "$pkgdir/usr/bin"
  install -Dm 644 xbrz/Changelog.txt -t "$pkgdir/usr/share/doc/$pkgname"
}
