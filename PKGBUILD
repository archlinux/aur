# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=nkf
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=4
pkgdesc='Ruby extension for Network Kanji Filter'
arch=(x86_64)
url='https://github.com/ruby/nkf'
license=(Ruby BSD-2-Clause)
depends=('glibc' 'ruby' 'bash')
checkdepends=('ruby-rake-compiler')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('0b35c038b40c73ecd17cd3443dae59a2b70119a044369b0bcf09bc2080589d84')

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
