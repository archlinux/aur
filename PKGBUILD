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
	new_meter.patch  # https://github.com/argilo/gr-elster/pull/12.patch
	dev_args.patch  # https://github.com/argilo/gr-elster/pull/13.patch
	add_mqtt.patch  # https://github.com/greyltc/gr-elster/compare/my-meter...greyltc:gr-elster:add-mqtt.patch
	pcap_analysis.patch  # https://github.com/argilo/gr-elster/compare/master...greyltc:gr-elster:pcap.patch
)
sha256sums=('SKIP'
            '4df5f8f4011aec787459b1a9bd0d15725ef82f7390590bbb9d76ba37481dca3a'
            '8861d5b248b2f4c6b505e5157e1a52eb7b5f1d1598694fd1a024ade1826681d7'
            'cdff722dee502912ca183c4420482bcc18c3760fccb41d3deff676415abde059'
            'c181747826654c7dc1c6d7c1da4d8678404fffba80dea389c49e1cb78f38dd5d'
            '668f22e901f4dc79456d70f79681c3891792f8b3432746cdbc0320fa63ccfcdf')

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

