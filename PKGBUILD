# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=rbvmomi2
pkgname=ruby-$_gemname
pkgver=3.7.1
pkgrel=2
pkgdesc='Ruby interface to the VMware vSphere API'
arch=(any)
url='https://github.com/ManageIQ/rbvmomi2'
license=(MIT)
depends=(ruby-builder ruby-json ruby-nokogiri ruby-optimist)
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('7f52181a3a11ec18dafdd4b68907c8356204cddf4e730ff16854f7d61a9c3226')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

#check() {
#  cd ${_gemname}-${pkgver}
#  rake test
#}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}
