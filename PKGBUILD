# Maintainer: arakmar
# Contributor: Tim Meusel <tim@bastelfreak.de>
pkgname=r10k
pkgver=3.6.0
pkgrel=1
pkgdesc='Provides a general purpose toolset for deploying Puppet environments and modules.'
arch=('any')
url='https://github.com/puppetlabs/r10k'
license=('Apache')
depends=('ruby' 'ruby-colored2' 'ruby-cri' 'ruby-gettext-setup' 'ruby-log4r' 'ruby-multi_json' 'ruby-semantic_puppet' 'ruby-puppet_forge' 'ruby-rugged')
makedepends=('ruby-minitar')
checkdepends=('ruby-rspec' 'git')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz" 'disable-sha256-test.patch' 'disable-insync-module-test.patch')
sha512sums=('c5220881705129c6c183556936e4d7b5dd42379499e854151c60cd8122e544db8353404068105d22e173b67448baf69af4e44e5c70194bdbf70118308f754913'
            '2c88172bda8110e5ab527992ae48c45f98643b2df68b0bf701f76900f0cfdbd8c915707128feac56014c9ddb1fcc81adab88b871d0746d5bbc2c2d097252ea18'
            '0e9e8b5ef2911a97ec8db151f7955652d82245a5f51a59f783d4c5df525106562409b6f1427312154ffb3146c0825f8f388e3b4c67136a304c85ae9eade33356')
options=('!emptydirs')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # update the gemspec to allow newer versions
  sed --in-place 's|~>|>=|g' "${pkgname}.gemspec"
  # don't use git to detect files for the package
  sed --in-place 's|git ls-files|find|g' "${pkgname}.gemspec"
  # allow newer gettext versions
  sed --in-place 's|< 3.3.0|< 4.0.0|' "${pkgname}.gemspec"

  # disable broken tests
  patch --verbose -p1 -N -i "${srcdir}/disable-sha256-test.patch"
  patch --verbose -p1 -N -i "${srcdir}/disable-insync-module-test.patch"
  echo 'applied patch'
}

build() {
  cd "${pkgname}-${pkgver}"
  gem build "${pkgname}.gemspec"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # two tests currently fail https://github.com/puppetlabs/r10k/issues/1095
  rspec --color --format documentation spec/unit
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${pkgname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 CHANGELOG.mkd README.mkd CONTRIBUTING.mkd -t "${pkgdir}/usr/share/doc/${pkgname}"
  mv doc "${pkgdir}/usr/share/doc/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/gems/${pkgname}-${pkgver}/ext"
  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
