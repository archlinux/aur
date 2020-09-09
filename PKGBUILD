# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=supercollider-git
_name="supercollider"
pkgver=3.11.1.r395.gcd3b936457
pkgrel=1
pkgdesc="Environment and programming language for real time audio synthesis and algorithmic composition"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://supercollider.github.io/"
license=('GPL3')
depends=('gcc-libs' 'glibc'  'libx11' 'qt5-base' 'qt5-svg' 'qt5-webengine'
'qt5-websockets')
makedepends=('abletonlink' 'alsa-lib' 'avahi' 'boost' 'cmake' 'emacs' 'fftw'
'git' 'jack' 'libsndfile' 'qt5-tools' 'readline' 'systemd-libs' 'yaml-cpp')
checkdepends=('xorg-server-xvfb')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface'
            'sc3-plugins: additional extension plugins for scsynth')
conflicts=('supercollider')
provides=('supercollider')
source=("git+https://github.com/${_name}/${_name}.git#branch=develop"
        "git+https://github.com/ableton/link.git"
        "git+https://github.com/${_name}/scel.git"
        "git+https://github.com/${_name}/scvim.git"
        "git+https://github.com/${_name}/hidapi.git"
        "git+https://github.com/${_name}/portaudio.git"
        "git+https://github.com/${_name}/yaml-cpp.git"
        "git+https://github.com/timblechmann/nova-simd.git"
        "git+https://github.com/timblechmann/nova-tt.git")
sha512sums=('SKIP'
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
}

build() {
  cd "${_name}"
  _carch="$(uname -m)"
  _cmake_args=""
  echo "$_carch architecture detected."
  case "$_carch" in
    "armv6l")
    export CFLAGS='-march=armv6 -mfpu=vfp -mfloat-abi=hard'
    export CXXFLAGS='-march=armv6 -mfpu=vfp -mfloat-abi=hard'
    _cmake_args="-DSSE=OFF \
                 -DSSE2=OFF \
                 -DSUPERNOVA=OFF \
                 -DNATIVE=OFF \
                 -DSC_QT=OFF \
                 -DSC_ED=OFF \
                 -DSC_IDE=OFF"
    ;;
    "armv7l")
    export CFLAGS='-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon'
    export CXXFLAGS='-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon'
    _cmake_args="-DSSE=OFF \
                 -DSSE2=OFF \
                 -DSUPERNOVA=OFF \
                 -DNATIVE=OFF \
                 -DSC_QT=OFF \
                 -DSC_ED=OFF \
                 -DSC_IDE=OFF"
    ;;
    *)
    export CFLAGS+=" -DNDEBUG"
    export CXXFLAGS+=" -DNDEBUG"
    cmake -DCMAKE_INSTALL_PREFIX='/usr' \
          -DCMAKE_BUILD_TYPE='None' \
          -DFORTIFY=ON \
          -DSC_VIM=OFF \
          -DSYSTEM_ABLETON_LINK=ON \
          -DSYSTEM_BOOST=ON \
          -DSYSTEM_YAMLCPP=ON \
          ${_cmake_args} \
          -Wno-dev \
          -B build \
          -S .
    ;;
  esac
  make VERBOSE=1 -C build
}

check() {
  cd "${_name}"
  xvfb-run make test ARGS="-VV -d -j1" -C build
}


package() {
  depends+=('libasound.so' 'libavahi-common.so' 'libavahi-client.so'
  'libboost_filesystem.so' 'libboost_program_options.so' 'libboost_regex.so'
  'libboost_thread.so' 'libfftw3f.so' 'libjack.so' 'libreadline.so'
  'libsndfile.so' 'libudev.so' 'libyaml-cpp.so')
  cd "${_name}"
  make DESTDIR="${pkgdir}/" install -C build
  install -vDm 644 {AUTHORS,{CHANGELOG,README,README_LINUX}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

