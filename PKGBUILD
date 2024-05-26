# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ali Mousavi <ali.mousavi@gmail.com>

_gemname=xmlrpc
pkgname=ruby-$_gemname
pkgver=0.3.3
pkgrel=3
pkgdesc='XMLRPC is a lightweight protocol that enables remote procedure calls over HTTP.'
arch=(any)
url='https://github.com/ruby/xmlrpc'
license=('Ruby' 'BSD-2-Clause')
depends=(ruby-webrick)
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('083d41fef7b553d8532ff1cf5a7dbe8baf1ef659e8374e1095206dc939dced19')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}-${pkgver}
  rake test
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}
