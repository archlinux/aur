# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: PelPix <kylebloss@pelpix.info>

_srcname=fdkaac
pkgname=${_srcname}-git_p
pkgver=0.6.2.r4.g4080ab2
pkgrel=1
pkgdesc='Command line encoder frontend for libfdk-aac'
arch=('i686' 'x86_64')
url="https://github.com/nu774/${_srcname}"
license=('custom')
depends=('libfdk-aac-git_p')
makedepends=('git')
conflicts=('fdkaac' 'fdkaac-git')
provides=('fdkaac' 'fdkaac-git')
replaces=()
license=('GPL' 'custom:UNREDISTRIBUTABLE')
source=("${_srcname}::git+https://github.com/nu774/fdkaac.git")
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

prepare() {
  cd "${srcdir}/${_srcname}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_srcname}"

  ./configure \
        --prefix=/usr \
        --disable-rpath
  make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
