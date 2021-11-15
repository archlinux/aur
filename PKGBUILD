# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='squire'
pkgname="ruby-${_gemname}"
pkgver=1.3.7
pkgrel=1
pkgdesc="Squire handles your configuration by common config DSL"
arch=('any')
url='https://github.com/smolnar/squire'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activesupport')
makedepends=('ruby-bundler' 'ruby-rake')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b3851b9936c918eea43553b4c257c7fb87885a9ae1af97561cc38833ed784de8d7226bcabea9791836b2dce3e2541fd5391e7e7f9a253164d849b479c8a2b3c5')

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

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
