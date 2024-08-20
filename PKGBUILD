# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="itex2mml"
_pkgname="ruby-${_name}"
pkgname="${_pkgname}-bzr"
pkgver=r85
pkgrel=1
pkgdesc="Ruby bindings for ${_name}"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('custom:GPL-unknown-version' 'custom:LGPL-unknown-version' 'custom:MPL-unknown-version')
makedepends=('bzr' 'swig')
depends=('glibc' 'ruby')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::bzr+https://golem.ph.utexas.edu/~distler/code/itexToMML"
        "${_name}_fix_makefile.patch")
noextract=("${_pkgsrc}.tar.gz")
sha256sums=('SKIP'
            '51f400e16b20f0e14df6f2f5c265f2e9ce686e646374545ee953773193e326d1')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${_pkgsrc}/itex-src"
  for _patch in "${srcdir}/${_name}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make ruby
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/itex-src"
#   make test_ruby
# }

package() {
  cd "${srcdir}/${_pkgsrc}/itex-src"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install_ruby
}
