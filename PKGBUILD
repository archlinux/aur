# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Wieland Hoffmann <the_mineo@web.de>

_srcname=chromaprint
pkgname=${_srcname}-git_p
pkgver=1.2.r10.gfedf202
pkgrel=1
pkgdesc="Client library, written in C++, for extracting audio fingerprints. "
arch=('i686' 'x86_64')
url="http://wiki.acoustid.org/wiki/Chromaprint"
license=('LGPL')
provides=('chromaprint' 'chromaprint-git')
conflicts=('chromaprint-bzr' 'chromaprint' 'chromaprint-git')
depends=('ffmpeg-full-git_p')
makedepends=('git' 'cmake')
source=("${_srcname}::git+https://bitbucket.org/acoustid/chromaprint.git")
sha256sums=('SKIP')

pkgver() {
  cur_prefix='v'
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${srcdir}/${_srcname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXAMPLES=ON .
}

package() {
    cd "${srcdir}/${_srcname}"
    make DESTDIR="$pkgdir/" install
} 
