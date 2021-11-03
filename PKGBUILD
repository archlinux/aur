# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='cancancan'
pkgname="ruby-${_gemname}"
pkgver=3.3.0
pkgrel=1
pkgdesc="Simple authorization solution for Rails. All permissions are stored in a single location."
arch=('any')
url='https://github.com/CanCanCommunity/cancancan'
license=('MIT')
options=(!emptydirs)
depends=('ruby' )
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rspec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('bce29caa606ba46cc51397fe52b5b949d45dbafaeccf4e60662f17c36f2307a88be935fc1d7df2b9b72f66e5cfdcab04fae971d75333f2c0cf4d7b8e67a96f11')

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

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
