# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

_gemname='hocon'
_reponame="ruby-${_gemname}"
pkgname="ruby27-${_gemname}"
pkgver=1.3.1
pkgrel=3
pkgdesc='Ruby support for the HOCON configuration file format'
arch=('any')
url="https://github.com/puppetlabs/${_reponame}"
license=('Apache')
depends=('ruby2.7')
makedepends=('ruby27-rdoc')
checkdepends=('ruby27-rspec')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('c73cfd8d6c77751d1d2a35d85cad2f2eef700a01e8b8de9449c0c9dfefe8d4a80c4a79dd3db8ee4a6d2c3649f26d6780cbe05fe9b067de05ee3711b00faf4255')

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"

  # update the gemspec to allow newer versions of rake
  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"

  # fix wrong license name in gemspec
  sed --in-place 's/Apache License, v2/Apache-2.0/' "${_gemname}.gemspec"
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  gem-2.7 build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  ruby27-rspec spec
}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 CHANGELOG.md HISTORY.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/cache"

  mv "${pkgdir}/usr/bin/hocon" "${pkgdir}/usr/bin/ruby27-hocon"

}

# vim: ts=2 sw=2 et:
