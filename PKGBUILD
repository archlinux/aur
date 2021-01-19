# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=rtjam
pkgname="${_pkgname}-git"
pkgver=0.1.r87.gbdb7e88
pkgrel=1
pkgdesc="A server and client programs and plugins for real-time,low-latency online jams (git version)"
arch=('x86_64')
url='https://github.com/mfvargo/rtjam'
license=('MIT')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
depends=('curl' 'gcc-libs' 'libgl' 'libx11')
makedepens=('git' 'jack')
optdepends=(
    'jack: stand-alone JACK client version'
    'alsa-lib: stand-alone ALSA server version (rtjam-nojack)')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/mfvargo/rtjam.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git')
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.dpf.url "${srcdir}/dpf"
  git submodule update

  # Don't let CPPFLAGS in environment override custom include paths set in Makefile
  sed -i -e 's/CPPFLAGS ?=/CPPFLAGS := $(CPPFLAGS)/' plugins/nojack/Makefile
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # install plugin LV2 bundles and VST binaries
  install -Dm755 bin/rtjam -t "${pkgdir}"/usr/bin
  install -m755 bin/broadcast "${pkgdir}"/usr/bin/rtjam-broadcast
  install -m755 bin/nojack "${pkgdir}"/usr/bin/rtjam-nojack

  # install LV2 plugin
  install -Dm755 bin/rtjam.lv2/*.so -t "${pkgdir}"/usr/lib/lv2/rtjam.lv2
  install -Dm644 bin/rtjam.lv2/*.ttl bin/rtjam.lv2/*.json \
    -t "${pkgdir}"/usr/lib/lv2/rtjam.lv2

  # install VST2 plugin
  install -Dm755 bin/rtjam-vst.so -t "${pkgdir}"/usr/lib/vst

  # install documentation
  install -Dm644 README.md *.png \
    -t "${pkgdir}"/usr/share/doc/${pkgname}
  # install license file
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
