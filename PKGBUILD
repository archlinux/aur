# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='simple_form'
pkgname="ruby-${_gemname}"
pkgver=5.3.0
pkgrel=1
pkgdesc="Forms made easy"
arch=('any')
url='https://github.com/heartcombo/simple_form'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activemodel')
makedepends=('ruby-bundler' 'ruby-rake')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('02d4fb4caf824810d4437efc72c6d386f80e181a1b4d430480bf1def56749598a77e129e4634bd10bb7bd548adf83fc99449e304147c3df13a6d2e857361024a')

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
