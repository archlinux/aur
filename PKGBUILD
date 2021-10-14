# Maintainer:: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=mocha
pkgname="ruby27-${_gemname}"
pkgver=1.12.0
pkgrel=1
pkgdesc='Mocha is a mocking and stubbing library for Ruby'
arch=('any')
url='https://github.com/freerange/mocha'
license=('Custom')
depends=('ruby2.7')
checkdepends=('ruby27-rake')
makedepends=('ruby27-minitest')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/freerange/mocha/archive/v${pkgver}.tar.gz"
        'remove-unneeded-dependencies.patch')
sha512sums=('969a6cd48d925845004dffa12f8a9dad155d3bf24b974957e9921a2e13dc67985f01080017ef9e82dacfd4bf87533774f3f5d15226923bdf50f8b90e95e1730f'
            '6a3c4568b6cf8009aed70935ddcff96a75d8d92b2e87a2a332a71ec569ed28c7c83e507ad408a0f62f93fc16b066133ba184f13a3e5b9a14bf90dc6276acde60')

prepare() {
  cd "${_gemname}-${pkgver}"

  # remove unneeded dependencies
  # bundler might require them if they are still in the gemspec file
  patch --forward --verbose --strip=1 --input='../remove-unneeded-dependencies.patch'

  # replace upper version boundaries for ruby gems
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec

  # `git` doesn't work within src dir, because we downloaded an archive
  sed --in-place 's|`git ls-files -z`.split("\\x0")|`find`.split("\\n")|' "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"
  ruby27-rake test:units
}

build() {
  cd "${_gemname}-${pkgver}"
  gem-2.7 build ${_gemname}.gemspec
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --ignore-dependencies --no-user-install --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  install -Dm 644 README.md RELEASE.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING.md MIT-LICENSE.md --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/docs" "${pkgdir}/usr/share/doc/${pkgname}/"

  # delete unneeded files
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/"{test,yard-templates,gemfiles,bin,.github,.gemtest,mocha.gemspec.orig}
}

# vim: ts=2 sw=2 et:
