# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='activeresource-response'
pkgname="ruby-${_gemname}"
pkgver=1.4.0
pkgrel=1
pkgdesc='This gem adds possibility to access http response object from result of ActiveResource::Base find method'
arch=('any')
url='https://github.com/Fivell/activeresource-response'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activeresource')
makedepends=('ruby-bundler' 'ruby-rake')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0eb5976a819cfb59b0809820ce48c9ec9ce796a64ecfb63e62b1bc8f5242c0e024b4145fe8c5e1812a6d0009631fe777c695043548c805361c39cdb8017c43c6')

prepare() {
  cd "${_gemname}-${pkgver}"

  # remove unused variables
  sed --in-place '/s\.test_files/d' "${_gemname}.gemspec"
  sed --in-place '/s\.executables/d' "${_gemname}.gemspec"

  # we built based on a tar archive, not a git repo
  sed --in-place --regexp-extended 's|git ls-files|find . -type f -not -path "*/.git*"|' "${_gemname}.gemspec"

  # update gemspec to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
