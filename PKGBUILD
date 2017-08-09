# Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>

pkgname='xcb-util-cursor-git'
_pkgname='util-cursor'
pkgver=0.1.3.r1.g947eaba
pkgrel=1
pkgdesc='XCB cursor management library'
arch=('i686' 'x86_64')
url='https://xcb.freedesktop.org/'
license=('MIT')
depends=('libxcb' 'xcb-util-renderutil' 'xcb-util-image')
makedepends=('git' 'xorg-util-macros' 'gperf')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=(
  "git+http://anongit.freedesktop.org/git/xcb/${_pkgname}.git"
  'm4::git+https://anongit.freedesktop.org/git/xcb/util-common-m4.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  local submodules=(
    'm4'
  )

  for submodule in "${submodules[@]}"; do
    git submodule init "${submodule}"
    git config "submodule.${submodule}.url" "${srcdir}/${module}"
    git submodule update "${submodule}"
  done
}

build() {
  cd "${_pkgname}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"

  make DESTDIR="${pkgdir}" install
  install -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
