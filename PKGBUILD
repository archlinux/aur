# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='haml-rails'
pkgname="ruby-${_gemname}"
pkgver=2.0.1
pkgrel=1
pkgdesc="Haml-rails provides Haml generators for Rails 4"
arch=('any')
url='https://github.com/haml/haml-rails'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-haml' 'ruby-html2haml' 'ruby-railties')
makedepends=('ruby-bundler')
checkdepends=('ruby-activejob' 'ruby-rails')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d49c60584ad08a268c1109e21116cc5bbb9290c5a5732c8bfddd2fc12aa513e3e9a6ab2092ab89dde4ae8884a06f964a3c0693ea1544541cadb256183027b519')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
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
