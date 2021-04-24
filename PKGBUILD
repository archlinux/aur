# Maintainer: HeyCitizen <4637290+InTheMorning@users.noreply.github.com>
# Contributers: Vesa Kaihlavirta <vegai@iki.fi>, Hal Gentz <zegentzy@protonmail.com>
 
pkgname=openttd-btpro
_pkgname=openttd
_btpro_release=1111A
pkgver=1.11.1
pkgrel=1
pkgdesc='An engine for running Transport Tycoon Deluxe. BTPro patches applied.'
arch=('x86_64')
url='http://openttd.btpro.nl/index.php/forum/30-btpro-openttd-client-talk/'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz' 'fluidsynth')
optdepends=('openttd-opengfx: free graphics' 
            'openttd-openmsx: free musicset'
            'openttd-opensfx: free soundset')
makedepends=('cmake' 'ninja')

source=("https://proxy.binaries.openttd.org/openttd-releases/${pkgver}/${_pkgname}-${pkgver}-source.tar.xz"
        "http://openttd.btpro.nl/OpenTTD_versions/BTPro_Client_${pkgver}_${_btpro_release}_patch.zip"
        "http://openttd.btpro.nl/OpenTTD_versions/innerhighlight.grf")
sha256sums=(
            'a9919e2e429bb08fa29fe8e67ba9bc75c90e9ef6fa64248eb34223a325d400a3'
            'ab86b0d1694b154b20f89af5bc9f2a3d126d7f96d1c815013426f03341b1c2b1'
            '1b181a27fbb468c7301291fc61384087ce7b1592cb0023be00f04736eec6e79b')
conflicts=('openttd')
 
prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p1 < "../OpenTTD_${pkgver}_${_btpro_release}_patch/public_${_btpro_release}.diff" || true
}
 
build() {
  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_BINDIR=bin \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DGLOBAL_DATA_DIR=/usr/share/openttd \
    -G Ninja \
    -S $_pkgname-$pkgver
  ninja -C build
}
 
package() {
  DESTDIR="$pkgdir" ninja -C build install
  mkdir -p "${pkgdir}/usr/share/openttd/baseset/newgrf/"
  install -m644 -D innerhighlight.grf "${pkgdir}/usr/share/openttd/baseset/newgrf/innerhighlight.grf"
}

