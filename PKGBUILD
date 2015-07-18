# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_srcname=l-smash
pkgname=${_srcname}-git_p
pkgver=2.3.0.r147.gad4d50a
pkgrel=1
pkgdesc="MP4 muxer and other tools (GIT Version)"
arch=('i686' 'x86_64')
license=('custom:l-smash')
depends=('glibc')
makedepends=('git')
provides=('liblsmash.so' 'lsmash' 'lsmash-git')
conflicts=('liblsmash.so' 'lsmash' 'lsmash-git')
url="http://l-smash.github.io/l-smash/"
source=("${_srcname}::git+https://github.com/l-smash/l-smash")
sha512sums=('SKIP')

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
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
