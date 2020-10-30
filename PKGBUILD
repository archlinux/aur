# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='bcrypt_pbkdf'
pkgname="ruby-${_gemname}"
pkgver=1.0.1
pkgrel=1
pkgdesc="OpenBSD's bcrypt_pdkfd (a variant of PBKDF2 with bcrypt-based PRF)"
arch=('x86_64')
url='https://github.com/net-ssh/bcrypt_pbkdf-ruby'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rake' 'ruby-bundler' 'ruby-rdoc' 'ruby-rake-compiler')
checkdepends=('ruby-minitest')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('bc10be5c1a4d66c31a33b687e2c2147235ac6d7da84b4c6a786ee9d117688facc0fb44babd3dd4e13bce335c93368fb87dd6ccd4b303116e909f2253bd27365a')
provides=('bcrypt_pbkdf_ext.so')
prepare() {
  cd "${srcdir}/${_gemname}-ruby-${pkgver}"

  sed -E 's|~>|>=|g' --in-place "${_gemname}.gemspec"
  sed --in-place 's|git ls-files|find|' "${_gemname}.gemspec"
  sed --in-place '/bundler/d' Rakefile
  sed --in-place '/rake-compiler-dock/d' bcrypt_pbkdf.gemspec
  sed --in-place '/has_rdoc/d' bcrypt_pbkdf.gemspec
}

build() {
  cd "${srcdir}/${_gemname}-ruby-${pkgver}"
  #rake compile
  #gem build "${_gemname}.gemspec"
  rake compile
  rake gem
}

check() {
  cd "${srcdir}/${_gemname}-ruby-${pkgver}"
  rake test
}

package() {
  cd "${srcdir}/${_gemname}-ruby-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  rm -rf ${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/{ext,tmp}
  rm -rf "${pkgdir}/${_gemdir}/cache"
  rm -rf ${pkgdir}/${_gemdir}/extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
