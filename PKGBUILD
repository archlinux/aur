# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bootsnap'
pkgname="ruby-${_gemname}"
pkgver=1.18.4
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
sha512sums=('8f0b9a72cb6a8339c0e91d7b0a58ab31fd9f5c416494cfe42e1f3107625d1743653f039f257722dd040d16dc80372edfa6d707bd76aa7430246532263e1151e6')

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
