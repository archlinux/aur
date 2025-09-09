pkgname="gr-elster-git"
pkgver=r98.bd33fcd
pkgrel=1
pkgdesc="A GNU Radio block that decodes packets transmitted by Elster R2S smart meters"
arch=('any')
url='https://github.com/argilo/gr-elster.git'
license=('GPL-3.0-or-later')
depends=(
  gnuradio
  python-gnuradio
  python-numpy
  python-pygraphviz
  python-paho-mqtt
)
makedepends=(
  git
  cmake
  doxygen
  ninja
  boost
)
optdepends=(
  gnuradio-companion
  gnuradio-osmosdr
)
provides=('gr-elster')
source=(
	'git+https://github.com/argilo/gr-elster.git'
	doxup.patch
	new_meter.patch      # https://patch-diff.githubusercontent.com/raw/argilo/gr-elster/pull/12.patch
	dev_args.patch       # https://patch-diff.githubusercontent.com/raw/argilo/gr-elster/pull/13.patch
	add_mqtt.patch       # https://github.com/greyltc/gr-elster/compare/my-meter...greyltc:gr-elster:add-mqtt.patch
	pcap_analysis.patch  # https://github.com/argilo/gr-elster/compare/master...greyltc:gr-elster:pcap.patch
)
sha256sums=('SKIP'
            '4df5f8f4011aec787459b1a9bd0d15725ef82f7390590bbb9d76ba37481dca3a'
            '4d2a4b7c5b10ebd2ee74963b2f549ef8478f26d63536d86c10792e423d7d40de'
            '60c2a44c6cb59e3f71b2b1afa147ca1396a896a9fc46fa8ba79faafeb3b83bcf'
            '775a0fd015431d7851e84dbcb0ac27f275458c6e0bb29c286b261e958ab17226'
            '68e340fa78c326216fe7026ff726fa0992d56f00c8e5c1a6579535668a4b7375')

pkgver() {
  cd gr-elster
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd gr-elster
  cat ../doxup.patch | patch -p1  # doxygen -u docs/doxygen/Doxyfile.in
  cat ../new_meter.patch | patch -p1
  cat ../dev_args.patch | patch -p1
  cat ../add_mqtt.patch | patch -p1
  cat ../pcap_analysis.patch | patch -p1
}

build() {
  cmake \
    -W no-dev \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -B build_dir \
    -S gr-elster

  cmake --build build_dir
}

package() {
  DESTDIR="${pkgdir}" cmake --install build_dir
  mkdir -p "${pkgdir}/usr/share/gnuradio/examples/gr-elster"
  cp -va -t "${pkgdir}/usr/share/gnuradio/examples/gr-elster" gr-elster/apps/*
  rm "${pkgdir}/usr/share/gnuradio/examples/gr-elster/CMakeLists.txt"
}

