# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=supercollider-git
_name="supercollider"
pkgver=3.10.3.r483.g36cbdde009
pkgrel=1
pkgdesc="Environment and programming language for real time audio synthesis and algorithmic composition"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://supercollider.github.io/"
license=('GPL3')
depends=('alsa-lib' 'avahi' 'boost-libs' 'desktop-file-utils' 'fftw' 'gcc-libs'
'glibc' 'jack' 'libsndfile' 'libx11' 'qt5-base' 'qt5-svg' 'qt5-webengine'
'qt5-websockets' 'readline' 'systemd-libs' 'yaml-cpp')
makedepends=('boost' 'cmake' 'emacs' 'git' 'link' 'qt5-tools')
checkdepends=('xorg-server-xvfb')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface'
            'sc3-plugins: additional extension plugins for scsynth')
conflicts=('supercollider')
provides=('libscsynth.so' 'supercollider')
source=("git+https://github.com/${_name}/${_name}.git#branch=develop"
        "${pkgname}-boost1.71.patch::https://github.com/supercollider/supercollider/pull/4612.patch"
        "${pkgname}-devendor-ableton-link.patch"
        "git+https://github.com/ableton/link.git"
        "git+https://github.com/${_name}/scel.git"
        "git+https://github.com/${_name}/scvim.git"
        "git+https://github.com/${_name}/hidapi.git"
        "git+https://github.com/${_name}/portaudio.git"
        "git+https://github.com/${_name}/yaml-cpp.git"
        "git+https://github.com/timblechmann/nova-simd.git"
        "git+https://github.com/timblechmann/nova-tt.git")
sha512sums=('SKIP'
            '005d241b797083dc031dda7f192013b69887c84db6b2616176605abafc1633c06a46a58b8ad1581d4cce0650fbc1f6d479b8992dbe4bdbf5ceace77fdccbdca8'
            '8aa14c7bf94b69f0ffa5b6f348544c3df72083d9f39cdf509efee3997e2e93cde2a3a8f6d6a149b3fd431843fec630d22c31c0f0332f2a1fff24c79ca4c16a00'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --match 'Version-*' --tags | sed 's/Version-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  git submodule init
  git config submodule.editors/sc-el.url "${srcdir}/scel"
  git config submodule.editors/scvim.url "${srcdir}/scvim"
  git config submodule.external_libraries/nova-simd.url "${srcdir}/nova-simd"
  git config submodule.external_libraries/nova-tt.url "${srcdir}/nova-tt"
  git config submodule.external_libraries/hidapi.url "${srcdir}/hidapi"
  git config submodule.external_libraries/portaudio_sc_org.url "${srcdir}/portaudio"
  git config submodule.external_libraries/portaudio_sc_org.branch "${_name}"
  git config submodule.external_libraries/yaml-cpp.url "${srcdir}/yaml-cpp"
  git config submodule.external_libraries/link.url "${srcdir}/link"
  git submodule update
  patch -Np1 -i ../"${pkgname}-devendor-ableton-link.patch"
  patch -Np1 -i ../"${pkgname}-boost1.71.patch"
  mkdir -p build
}

build() {
  cd "${_name}/build"
  _carch=$(uname -m)
  echo "$_carch architecture detected."
  case "$_carch" in
    "armv6l")
      export CC="gcc"
      export CXX="g++"
      cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DLIBSCSYNTH=ON \
            -DFORTIFY=ON \
            -DSC_VIM=OFF \
            -DSYSTEM_BOOST=ON \
            -DSYSTEM_YAMLCPP=ON \
            -DSSE=OFF \
            -DSSE2=OFF \
            -DSUPERNOVA=OFF \
            -DNATIVE=OFF \
            -DSC_QT=OFF \
            -DSC_ED=OFF \
            -DSC_IDE=OFF \
            -DCMAKE_C_FLAGS='-march=armv6 -mfpu=vfp -mfloat-abi=hard' \
            -DCMAKE_CXX_FLAGS='-march=armv6 -mfpu=vfp -mfloat-abi=hard' \
             ..
    ;;
    "armv7l")
      export CC="gcc"
      export CXX="g++"
      cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DLIBSCSYNTH=ON \
            -DFORTIFY=ON \
            -DSC_VIM=OFF \
            -DSYSTEM_BOOST=ON \
            -DSYSTEM_YAMLCPP=ON \
            -DSSE=OFF \
            -DSSE2=OFF \
            -DSUPERNOVA=OFF \
            -DNATIVE=OFF \
            -DSC_QT=OFF \
            -DSC_ED=OFF \
            -DSC_IDE=OFF \
            -DCMAKE_C_FLAGS='-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon' \
            -DCMAKE_CXX_FLAGS='-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon' \
            ..
    ;;
    *)
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DLIBSCSYNTH=ON \
          -DFORTIFY=ON \
          -DSC_VIM=OFF \
          -DSYSTEM_BOOST=ON \
          -DSYSTEM_YAMLCPP=ON \
          ..
    ;;
  esac
  make VERBOSE=1
}

check() {
  cd "${_name}/build"
  xvfb-run make test ARGS="-V" || warning "Known failing tests: https://github.com/supercollider/supercollider/issues/3555"
}


package() {
  cd "${_name}/build"
  make DESTDIR="${pkgdir}/" install
  install -t "${pkgdir}/usr/share/doc/${pkgname}/" \
    -vDm 644 ../{AUTHORS,{CHANGELOG,README,README_LINUX}.md}
}

