# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bootsnap'
pkgname="ruby-${_gemname}"
pkgver=1.9.1
pkgrel=1
pkgdesc="Boot large ruby/rails apps faster"
arch=('any')
url='https://github.com/Shopify/bootsnap'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-msgpack')
makedepends=('ruby-bundler' 'ruby-rake-compiler' 'ruby-rake')
checkdepends=('ruby-minitest' 'ruby-mocha')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c1efd824cb7437295355435a964c1f24f3f77f065d21a5c749e562f2758579933ff0e9aee8b30f98f30fbcaaf5ae25dffe73167ce5d82ebf6ab03b9370637c67')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files -z ext lib/find ext lib -type f -print0/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # ignore code style checks
  sed --in-place '/rubocop/d' Gemfile

  # ignore debugger
  sed --in-place '/byebug/d' Gemfile
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake compile
  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
