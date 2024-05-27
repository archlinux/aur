# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=soap4r-ng
_gemname2=soap4r
pkgname=ruby-$_gemname
pkgver=2.0.4 #no git tag
_commit=96aa5490a74fb9e2b7d06e3f16ee61fc1d755234
pkgrel=1
pkgdesc='Soap4R-ng is Soap4R for Ruby 1.8 thru 2.4 and Beyond'
arch=(any)
url='https://github.com/rubyjedi/soap4r'
license=(RUBY)
depends=(ruby)
options=(!emptydirs)
source=("https://github.com/rubyjedi/soap4r/archive/$_commit.zip")
sha256sums=('22c1aa1e4a7aa53363c783958fbca388325425d91ac07e6d2b677c002d99f73e')

prepare() {
  cd ${_gemname2}-${_commit}
  sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname2}-${_commit}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname2}-${_commit}
  rake test
}

package() {
  cd ${_gemname2}-${_commit}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}
