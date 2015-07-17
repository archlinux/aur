# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: PelPix <kylebloss[at]pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>

_srcname=libfdk-aac
pkgname=${_srcname}-git_p
pkgver=0.1.4.r0.g83ac4a9
pkgrel=1
pkgdesc="Fraunhofer FDK AAC codec library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('custom')
depends=('glibc')
makedepends=('git')
conflicts=('libfdk-aac')
provides=('libfdk-aac' 'libfdk-aac-git' 'libfdk-aac.so')
replaces=()
options=('!libtool')
source=("${_srcname}::git://git.code.sf.net/p/opencore-amr/fdk-aac")
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
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/${pkgname}/NOTICE"
}
