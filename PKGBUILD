# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=CFPropertyList
pkgname=ruby-cfpropertylist
pkgver=3.0.7
pkgrel=2
pkgdesc='Read, write and manipulate both binary and XML property lists as defined by apple.'
arch=(any)
url='https://github.com/ckruse/CFPropertyList'
license=(MIT)
depends=(ruby-base64 ruby-nkf ruby-rexml)
options=(!emptydirs)
source=("${url}/archive/cfpropertylist-${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('65062aded620058d19a2f1eb77085986d046922881fe2f5fe2b2ef7fd3124330')

prepare() {
  cd ${_gemname}-cfpropertylist-${pkgver}
  sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i cfpropertylist.gemspec
  sed -r 's|~>|>=|g' -i cfpropertylist.gemspec
}

build() {
  cd ${_gemname}-cfpropertylist-${pkgver}
  gem build cfpropertylist.gemspec
}

#check() {
#  cd ${_gemname}-cfpropertylist-${pkgver}
#  rake test
#}

package() {
  cd ${_gemname}-cfpropertylist-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" CFPropertyList-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}
