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
	new_meter.patch      # curl https://patch-diff.githubusercontent.com/raw/argilo/gr-elster/pull/12.patch > new_meter.patch
	dev_args.patch       # curl https://patch-diff.githubusercontent.com/raw/argilo/gr-elster/pull/13.patch > dev_args.patch
	add_mqtt.patch       # curl https://github.com/greyltc/gr-elster/compare/my-meter...greyltc:gr-elster:add-mqtt.patch > add_mqtt.patch
	pcap_analysis.patch  # curl https://github.com/argilo/gr-elster/compare/master...greyltc:gr-elster:pcap.patch > pcap_analysis.patch
)
sha256sums=('SKIP'
            '4df5f8f4011aec787459b1a9bd0d15725ef82f7390590bbb9d76ba37481dca3a'
            'e504e85c1b3fe34b39cf06fef63cfefe4539a08d3f6438a119af9a7ddd683792'
            '60c2a44c6cb59e3f71b2b1afa147ca1396a896a9fc46fa8ba79faafeb3b83bcf'
            '394eacf099227462187e651048352ae60867d787a94e50166fe3d594da62b366'
            'bf199fd7c40afc829bc5b5b3ca34839370e71793070c49fe7ddc1d4bdbc03548')

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
  msg2 a
  cat ../new_meter.patch | patch -p1
  msg2 b
  cat ../dev_args.patch | patch -p1
  msg2 c
  cat ../add_mqtt.patch | patch -p1
  msg2 d
  cat ../pcap_analysis.patch | patch --batch -p1
  msg2 e
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

