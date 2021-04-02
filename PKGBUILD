# Maintainer: lmartinez-mirror
pkgname=sdrplusplus-git
pkgver=0.2.5.r96.gb16c6f5
pkgrel=1
pkgdesc="Cross-platform SDR software"
arch=('x86_64')
url="https://github.com/alexandrerouma/sdrplusplus"
license=('GPL3')
depends=('libglvnd' 'fftw>=3' 'glfw' 'glew' 'libvolk')
optdepends=('soapysdr: SoapySDR module support'
            'airspy: Airspy module(s) support'
            'bladerf: BladeRF module support'
            'libsdrplay: SDRplay module support'
            'hackrf: HackRF module support'
            'rtaudio: Audio sink module support')
makedepends=('git' 'gcc>=8' 'cmake>=3.13')
provides=('sdrplusplus' 'libsdrpp_core.so')
conflicts=('sdrplusplus')
install=
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\(\_[[:alnum:]]\+\)\+//;s/-/.r/;s/-/./'
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} -std=c++17" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -std=c++17" \
    -DOPT_BUILD_RTL_TCP_SOURCE=OFF \
    -DOPT_BUILD_SPYSERVER_SOURCE=OFF \
    -DOPT_BUILD_SOAPY_SOURCE=OFF \
    -DOPT_BUILD_AIRSPYHF_SOURCE=OFF \
    -DOPT_BUILD_AIRSPY_SOURCE=OFF \
    -DOPT_BUILD_BLADERF_SOURCE=OFF \
    -DOPT_BUILD_SDRPLAY_SOURCE=OFF \
    -DOPT_BUILD_PLUTOSDR_SOURCE=OFF \
    -DOPT_BUILD_HACKRF_SOURCE=OFF \
    -DOPT_BUILD_RTL_SDR_SOURCE=OFF \
    -DOPT_BUILD_AUDIO_SINK=OFF \
    -DOPT_BUILD_FALCON9_DECODER=OFF
  make -C build
}

package() {
  DESTDIR="$pkgdir/" make install -C build
  install -Dm 444 "$pkgname/readme.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
