# Maintainer: Evan Chen <evan@evanchen.cc>
# Contributor: Marcin Kolesinski <m dot kolesinski at gmail dot com>
# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>
# Contributor: Nascher <kevin@nascher.org>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Philip Sequeira <phsequei@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: ZipFile <lin.aaa.lin@gmail.com>
# Contributor: Carlos Solis <csolisr at gmail dot com>
pkgname=stepmania
_pkgver=d55acb1ba26f1c5b5e3048d6d6c0bd116625216f
pkgver=5.1.0.b2.r627.d55acb1ba2
pkgrel=5
pkgdesc="Advanced rhythm game. Designed for both home and arcade use."
arch=(x86_64)
url="http://www.stepmania.com/"
license=('MIT AND CC-BY-NC-4.0')
depends=('mesa' 'glew' 'glu' 'udev' 'libx11' 'libxext' 'libxtst' 'libxinerama' 'libxrandr'
  'alsa-lib' 'libpulse' 'ffmpeg' 'libmad' 'libogg' 'libvorbis' 'libjpeg' 'libpng'
  'gtk3' 'libtommath' 'libtomcrypt' 'jsoncpp' 'pcre' 'zlib')
makedepends=('cmake')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/stepmania/stepmania/archive/$_pkgver.tar.gz"
  "$pkgname-3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch::https://github.com/stepmania/stepmania/commit/3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
  "$pkgname-e0d2a5182dcd855e181fffa086273460c553c7ff.patch::https://github.com/stepmania/stepmania/commit/e0d2a5182dcd855e181fffa086273460c553c7ff.patch"
  "ffmpeg-7.patch"
  "ffmpeg-8.patch"
  "libtom-use-pkgconfig.patch"
  "ffmpeg-remove-asm-requirement.patch"
  "stepmania.sh")
sha256sums=('7d0e0d4b13f780fc6181561b257d9cd8a3ef73df513f4b8f36743acebb63a130'
  'fe3c77293d65b654c91d419ba7421feb2ad2da8e4561fadc5f02b3bd0f791634'
  'b04bc15cbe85a41117220fadbadce5aa0893582fa8d720697ee6b864f7f0c093'
  'f6406a9daa61f53a530402965cfc9533f9836d558026b0fc5627db05f8cde068'
  'f6dd2f33ff89c56728df15d808a7853c27c82aad774ff63e231983906656619c'
  '490c8a8eb89e637ddfdaefec4d6212e8607d94580ae99d8069b26559d0ecdbe5'
  'ae8d9911eaf7680d7f05a5bafa98588a1582f9b7713a295a66603a2ca8b5addf'
  'e2caeb91fccaba9502273fba875355b516e821e6754b2238a20cb7c31f3c4a60')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -Np1 -i "$srcdir/$pkgname-3fef5ef60b7674d6431f4e1e4ba8c69b0c21c023.patch"
  patch -Np1 -i "$srcdir/$pkgname-e0d2a5182dcd855e181fffa086273460c553c7ff.patch"
  patch -Np1 -i "$srcdir/ffmpeg-7.patch"
  patch -Np1 -i "$srcdir/ffmpeg-8.patch"
  # wtf why does this use CRLF endings??
  sed -i 's/\r$//' $srcdir/$pkgname-$_pkgver/extern/CMakeProject-tomcrypt.cmake
  patch -Np1 -i "$srcdir/libtom-use-pkgconfig.patch"
  patch -Np1 -i "$srcdir/ffmpeg-remove-asm-requirement.patch"
}

build() {
  cd "$srcdir/$pkgname-$_pkgver/Build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt \
    -DWITH_FULL_RELEASE=YES \
    -DWITH_PORTABLE_TOMCRYPT=NO \
    -DWITH_SYSTEM_FFMPEG=YES \
    -DWITH_SYSTEM_MAD=YES \
    -DWITH_SYSTEM_OGG=YES \
    -DWITH_SYSTEM_JPEG=YES \
    -DWITH_SYSTEM_PNG=YES \
    -DWITH_SYSTEM_GLEW=YES \
    -DWITH_SYSTEM_TOMMATH=YES \
    -DWITH_SYSTEM_TOMCRYPT=YES \
    -DWITH_SYSTEM_JSONCPP=YES \
    -DWITH_SYSTEM_PCRE=YES \
    -DWITH_SYSTEM_ZLIB=YES \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations" \
    -DWITH_GTK3=no \
    -Wno-dev \
    ..
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make -C Build DESTDIR="$pkgdir" install

  install -Dm755 "$srcdir/stepmania.sh" "$pkgdir/usr/bin/stepmania"
  install -Dm644 stepmania.desktop "$pkgdir/usr/share/applications/stepmania.desktop"

  install -Dm644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
  cp -a icons "$pkgdir/usr/share"
}
