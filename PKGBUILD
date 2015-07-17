# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Soukyuu <chrno-sphered at hotmail dot com>

_srcname=wavpack
pkgname=${_srcname}-git_p
pkgver=4.75.0.r16.gd9a0960
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes"
arch=('i686' 'x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('glibc')
makedepends=('git')
conflicts=('wavpack' 'wavpack-beta' 'wavpack-git')
provides=('wavpack' 'wavpack-git')
source=("${_srcname}::git+https://github.com/dbry/wavpack")
sha256sums=('SKIP')

pkgver() {
  cur_prefix=''
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_srcname}"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --disable-asm
  make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


