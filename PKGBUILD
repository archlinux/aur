# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: MeMi69 <MetalMilitia@gmx.net>

pkgname=marsyas
pkgver=0.5.0
pkgrel=7
pkgdesc="Music Analysis, Retrieval and Synthesis for Audio Signals"
arch=('x86_64')
url="http://marsyas.info"
license=('GPL2')
groups=('pd-externals' 'pro-audio' 'vamp-plugins')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'lame' 'libjack.so' 'libmad'
'libvorbisfile.so')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'pd' 'qt5-base'
'qt5-declarative' 'libvamp-sdk.so')
optdepends=('pd: for ibt_pd external'
            'qt5-base: for MarGrid2, MarLpc, MarPhasevocoder, MarPlayer and marsyas-inspector'
            'qt5-declarative: for marsyas-inspector'
            'libvamp-sdk.so: for vamp plugin')
provides=('libmarsyas.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/version-$pkgver.tar.gz")
sha512sums=('0ff8943028753c70d409e78a8c5487da2006b7599c8909c0e0050433a6e7051f32b3c5f31fe833085a479d0486e4c96c5f4a4bd63ac00ee68b89dee941aebc9a')

prepare() {
  mv -v "${pkgname}-version-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  # fixing build of vamp plugins
  sed -e 's|"MarSystemTemplateBasic.h"|<marsyas/marsystems/MarSystemTemplateBasic.h>|' \
      -e 's|"MarSystemTemplateAdvanced.h"|<marsyas/marsystems/MarSystemTemplateAdvanced.h>|' \
      -i src/mvamp/MarsyasIBT.h
  # fixing build of pd external
  sed -e 's|= atom_getsymbol(argv+1)->s_name|= const_cast<char*>(atom_getsymbol(argv+1)->s_name)|' \
      -i src/marsyas_pd/ibt_pd.cpp
  sed -e 's/--export-dynamic/-export-dynamic/g' \
      -i src/marsyas_pd/CMakeLists.txt
}

build() {
  cd "${pkgname}-${pkgver}"
  # disabling build of python module, as it's python2 only:
  # https://github.com/marsyas/marsyas/issues/71
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=ON \
        -DWITH_MAD=ON \
        -DWITH_LAME=ON \
        -DWITH_PD=ON \
        -DWITH_SWIG=OFF \
        -DWITH_VAMP=ON \
        -DWITH_VORBIS=ON \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install -C build
  # pd external
  install -vDm 755 build/lib/ibt_pd.pd_linux \
    -vDm 644 src/${pkgname}_pd/ibt_pd-help.pd \
    -t "${pkgdir}/usr/lib/pd/extra/"
  # vamp plugin
  install -vDm 755 build/lib/mvamp.so -t "${pkgdir}/usr/lib/vamp"
  # docs
  install -vDm 644 {AUTHORS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # rename sfinfo https://bugs.archlinux.org/task/60787
  mv -v "${pkgdir}/usr/bin/sfinfo" "${pkgdir}/usr/bin/${pkgname}-sfinfo"
}
