# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=Mamba
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-git"
pkgver=2.3.r7.g1ea2494
pkgrel=1
pkgdesc="A virtual MIDI keyboard and file player/recorder for ALSA/JACK (git version)"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_reponame}"
license=('0BSD')
depends=('cairo')
makedepends=('alsa-lib' 'fluidsynth' 'git' 'jack' 'liblo' 'libsigc++' 'libsmf' 'xxd')
optdepends=('new-session-manager: for NSM support')
groups=('pro-audio')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}" "${_pkgname//-/.}")
conflicts=("${_pkgname}" "${_pkgname//-/.}")
source=("${_pkgname}::git+https://github.com/brummer10/${_reponame}.git"
        'libxputty::git+https://github.com/brummer10/libxputty.git')
md5sums=('SKIP'
         'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  (
    set -o pipefail
    git describe --long --tags --match 'v*.*' 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.libxputty.url "${srcdir}/libxputty"
  git -c protocol.file.allow=always submodule update

  sed -i '/update-desktop-database/d' src/Makefile
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  depends+=('libasound.so' 'libfluidsynth.so' 'libjack.so' 'liblo.so' 'libsigc++' 'libsmf.so')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
