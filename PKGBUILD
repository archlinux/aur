# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: MeMi69 <MetalMilitia@gmx.net>

pkgname=marsyas
pkgver=0.5.0
pkgrel=6
pkgdesc="Music Analysis, Retrieval and Synthesis for Audio Signals"
arch=('x86_64')
url="http://marsyas.info"
license=('GPL2')
groups=('pro-audio')
depends=('jack' 'lame' 'libmad')
optdepends=('pd: use ibt_pd external'
            'python2: required for marmonitors.py'
            'qt5-declarative: required for marsyas-inspector'
            'vamp-plugin-sdk: use vamp plugin')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'pd' 'python2' 'qt5-declarative' 'swig' 'vamp-plugin-sdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/version-$pkgver.tar.gz")
sha512sums=('0ff8943028753c70d409e78a8c5487da2006b7599c8909c0e0050433a6e7051f32b3c5f31fe833085a479d0486e4c96c5f4a4bd63ac00ee68b89dee941aebc9a')

prepare() {
  mv -v "${pkgname}-version-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  # fixing python2 scripts shebang
  sed -e 's/ python/ python2/' \
      -i src/swig/python/{modules,scripts}/*.py src/${pkgname}_python/*.py
  # fixing broken call to env in python scripts
  sed -e 's/evn/env/' \
      -i src/swig/python/{modules,scripts}/*.py src/${pkgname}_python/*.py
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
  cd "${pkgname}-${pkgver}/build"
  _python_lib=$( echo /usr/lib/python2* )
  _python_include=$( echo /usr/include/python2* )
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=1 \
        -DWITH_MAD=1 \
        -DWITH_LAME=1 \
        -DWITH_PD=1 \
        -DPYTHON_LIBRARY=${_python_lib} \
        -DPYTHON_INCLUDE_PATH=${_python_include} \
        -DWITH_SWIG=1 \
        -DWITH_VAMP=1 \
        -DWITH_VORBIS=1 \
        ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  # pd external
  install -vDm 755 lib/ibt_pd.pd_linux \
    -vDm 644 ../src/${pkgname}_pd/ibt_pd-help.pd \
    -t "${pkgdir}/usr/lib/pd/extra/"
  # vamp plugin
  install -vDm 755 lib/mvamp.so -t "${pkgdir}/usr/lib/vamp"
  # docs
  install -vDm 644 ../{AUTHORS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # rename sfinfo https://bugs.archlinux.org/task/60787
  mv -v "${pkgdir}/usr/bin/sfinfo" "${pkgdir}/usr/bin/${pkgname}-sfinfo"
}
