# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='cancancan'
pkgname="ruby-${_gemname}"
pkgver=3.4.0
pkgrel=1
pkgdesc="Simple authorization solution for Rails. All permissions are stored in a single location"
arch=('any')
url='https://github.com/CanCanCommunity/cancancan'
license=('MIT')
options=(!emptydirs)
depends=('ruby' )
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rspec')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6f00a56a9b96599d6e4aedcfaf531e478b1427f521a70b90adeec6ecbf5dad5670e8fc395164ba9fefc88a93409e4f1c8a17902269d45be1d5b9d7f428931d12')

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
