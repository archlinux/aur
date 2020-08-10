# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=faustfilters
pkgname="${_pkgname}-git"
pkgver=0.3.0.r0.g5d74237
pkgrel=1
pkgdesc="A collection of virtual-analog filter plugins (git version)"
arch=('i686' 'x86_64')
url="https://github.com/SpotlightKid/${_pkgname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
groups=('pro-audio' 'ladspa-plugins' 'lv2-plugins' 'vst-plugins')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/SpotlightKid/${_pkgname}.git"
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
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # install license file
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
