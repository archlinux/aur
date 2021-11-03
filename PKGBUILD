# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='simple_form'
pkgname="ruby-${_gemname}"
pkgver=5.1.0
pkgrel=1
pkgdesc="Forms made easy!"
arch=('any')
url='https://github.com/heartcombo/simple_form'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activemodel')
makedepends=('ruby-bundler' 'ruby-rake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('78c15d22bd1092cf76bea1e7e82253338016c0e4d62212b8bfa9cc34734d5ee520956299abf1ffe2bccadf30b3c2e79d1028d45668918a26f932830231500fde')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md CONTRIBUTING.md ISSUE_TEMPLATE.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
