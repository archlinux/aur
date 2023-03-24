# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: MeMi69 <MetalMilitia@gmx.net>

pkgname=marsyas
pkgver=0.5.0
pkgrel=10
pkgdesc="Music Analysis, Retrieval and Synthesis for Audio Signals"
arch=(x86_64)
url="http://marsyas.info"
license=(GPL2)
groups=(
  pd-externals
  pro-audio
  vamp-plugins
)
depends=(
  gcc-libs
  glibc
  lame
  libmad
)
makedepends=(
  alsa-lib
  cmake
  doxygen
  extra-cmake-modules
  jack
  libvorbis
  pd
  qt5-base
  qt5-declarative
  vamp-plugin-sdk
)
optdepends=(
  'pd: for ibt_pd external'
  'qt5-base: for MarGrid2, MarLpc, MarPhasevocoder, MarPlayer and marsyas-inspector'
  'qt5-declarative: for marsyas-inspector'
  'vamp-plugin-sdk: for vamp plugin'
)
provides=(libmarsyas.so)
source=(
  https://github.com/$pkgname/$pkgname/archive/version-$pkgver/$pkgname-version-$pkgver.tar.gz
  $pkgname-0.5.0-qpainterpath.patch
  $pkgname-0.5.0-vamp_include_dirs.patch
  $pkgname-0.5.0-pd_extension.patch
)
sha512sums=('0ff8943028753c70d409e78a8c5487da2006b7599c8909c0e0050433a6e7051f32b3c5f31fe833085a479d0486e4c96c5f4a4bd63ac00ee68b89dee941aebc9a'
            'a1a61964f3588b58ee95c16b70a1641b13032c07ec1fba030a9f5fa62c9f355f0c67a147dcdd04d70b0ef5d3a513fbe07341e73abeab3cce82cdfa65385fe22e'
            '29d6a67195241d67b16da9afe522741cbdbfda84183f40f205d50d133bb8ebbcfebff01f011351851660bd59c6bb8cf629316de6345801caf6e0a41c7eeb354c'
            '028329689ba460266b673a88d4ac316dd1077f93c6f2a5b3283961a457bf34fca64222b62f24d5478436c53a4868bd2a7337ffc1802089a2d829b3707ea48c6d')
b2sums=('d30b3f2ab5c2f71c56a86f8a23a3001122115ed97012347a1a3ede2b028c5a4398f712700c05715dedd67beb4195002bce4b3206d1957b1b1cf182ff4ad1fa7b'
        'de864ac8fd1e2f4f1b204ff86e3f4eb2fdc0fc088c1122b855c8da2156a8a4e659526c8959040d51300ec7cb86a57bfb509712ae936de275e0e47877e2e21af1'
        'a309be3a68e5e27c202f5078b566f248526283b37bef4a8237b88bdce2400f0810a07f5a50f5982612c958913896e8e76ef27fec448411d3309c6b797340c11f'
        '3d41f3c13a9b313a7a1e25bcc6c8f6d194ec93bac390d9d9ba61c4cdf9a2ba45227679be8fe36bc421025894ed6e86d5621aef9bdc4431892ec5c2a935c927ae')

prepare() {
  # add missing include for QPainterPath (offered upstream):
  # https://github.com/marsyas/marsyas/issues/77
  patch -Np1 -d $pkgname-version-$pkgver -i ../$pkgname-0.5.0-qpainterpath.patch
  # fix include dirs for vamp plugins (offered upstream):
  # https://github.com/marsyas/marsyas/issues/79
  patch -Np1 -d $pkgname-version-$pkgver -i ../$pkgname-0.5.0-vamp_include_dirs.patch

  # fixing build of pd external (offered upstream):
  # https://github.com/marsyas/marsyas/issues/81
  patch -Np1 -d $pkgname-version-$pkgver -i ../$pkgname-0.5.0-pd_extension.patch
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_SKIP_RPATH=ON
    -D WITH_LAME=ON
    -D WITH_MAD=ON
    -D WITH_PD=ON
    # disable build of python module, as it is python2 only:
    # https://github.com/marsyas/marsyas/issues/71
    -D WITH_SWIG=OFF
    -D WITH_VAMP=ON
    -D WITH_VORBIS=ON
    -S $pkgname-version-$pkgver
    -W no-dev
  )

  CXXFLAGS+=' -ffat-lto-objects'
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  depends+=(
    alsa-lib libasound.so
    jack libjack.so
    libvorbis libvorbisfile.so
  )

  DESTDIR="$pkgdir" cmake --install build
  # pd external
  install -vDm 755 build/lib/ibt_pd.pd_linux -vDm 644 "$pkgname-version-$pkgver/src/${pkgname}_pd/ibt_pd-help.pd" -t "$pkgdir/usr/lib/pd/extra/"
  # vamp plugin
  install -vDm 755 build/lib/mvamp.so -t "$pkgdir/usr/lib/vamp"
  # docs
  install -vDm 644 $pkgname-version-$pkgver/{AUTHORS,README,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"

  # rename sfinfo https://bugs.archlinux.org/task/60787
  mv -v "$pkgdir/usr/bin/sfinfo" "$pkgdir/usr/bin/$pkgname-sfinfo"
  # rename record: https://bugs.archlinux.org/task/69837
  mv -v "$pkgdir/usr/bin/record" "$pkgdir/usr/bin/$pkgname-record"
}
