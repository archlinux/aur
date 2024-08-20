# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="itex2mml"
pkgname="ruby-${_name}"
pkgver=1.6.1
pkgrel=1
pkgdesc="Ruby bindings for ${_name}"
arch=('x86_64')
url="https://golem.ph.utexas.edu/~distler/blog/itex2MML.html"
license=('custom:GPL-unknown-version' 'custom:LGPL-unknown-version' 'custom:MPL-unknown-version')
makedepends=('swig')
depends=('glibc' 'ruby')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::http://golem.ph.utexas.edu/~distler/blog/files/itexToMML.tar.gz"
        "${_name}_fix_makefile.patch")
noextract=("${_pkgsrc}.tar.gz")
sha256sums=('3ef2572aa3421cf4d12321905c9c3f6b68911c3c9283483b7a554007010be55f'
            '51f400e16b20f0e14df6f2f5c265f2e9ce686e646374545ee953773193e326d1')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}"
  bsdtar -xzf "${_pkgsrc}.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}"
  
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
