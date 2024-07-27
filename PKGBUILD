# Maintainer: Milk Brewster <milk on freenode>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=samplecat
pkgname=$_pkgname-git
pkgver=0.3.3.r0.gccec9d4
pkgrel=1
pkgdesc="A program for cataloguing and auditioning audio samples."
arch=(x86_64)
url="http://ayyi.github.io/samplecat"
license=(GPL-3.0-only)
depends=(
    dbus-glib
    ffmpeg
    fftw
    graphene
    gtk2
    jack
    libsndfile
    libyaml
    mariadb-libs
    sqlite
)
makedepends=(
    git
    glib2-devel
    ladspa
    python
)
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/ayyi/samplecat.git'
        'git+https://github.com/ayyi/libwaveform.git')
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.waveform.url "${srcdir}/libwaveform"
  git -c protocol.file.allow=always submodule update
  cd lib/waveform
  git checkout master
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
  # Layout files not used (yet)?
  rm -rf "$pkgdir"/usr/etc
}
