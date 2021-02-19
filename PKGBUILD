# Maintainer: Milk Brewster <milk on freenode>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname="samplecat"
pkgname="${_pkgname}-git"
pkgver=0.3.1.r15.g5e26576
pkgrel=1
pkgdesc="A program for cataloguing and auditioning audio samples."
arch=(x86_64)
url="http://ayyi.github.io/samplecat"
license=('GPL')
depends=(
    'dbus-glib'
    'ffmpeg'
    'fftw'
    'graphene'
    'gtk2'
    'jack'
    'libsndfile'
    'libyaml'
    'mariadb-libs'
    'sqlite'
)
makedepends=(
    'git'
    'ladspa'
    'python'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/ayyi/samplecat.git'
        'git+https://github.com/ayyi/libwaveform.git'
        "libwaveform-peak-tempfiles.diff")
md5sums=('SKIP'
         'SKIP'
         '824d2703d40b2256253b14185171f6f6')


pkgver() {
  cd "$srcdir/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${_pkgname}"
  git submodule init
  git config submodule.waveform.url "${srcdir}/libwaveform"
  git submodule update

  # https://github.com/ayyi/libwaveform/pull/7
  cd lib/waveform
  patch -p1 -N -r - -i "${srcdir}"/libwaveform-peak-tempfiles.diff || :
}

build() {
  cd "$srcdir/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install
  # Layout files not used (yet)?
  rm -rf "$pkgdir"/usr/etc
}
