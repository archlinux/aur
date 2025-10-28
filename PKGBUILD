# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_gemname='request_store'
pkgname="ruby-${_gemname}"
pkgver=1.7.0
pkgrel=1
pkgdesc="Per-request global storage for Rack."
arch=('any')
url='https://github.com/steveklabnik/request_store'
license=('MIT')
options=(!emptydirs)
depends=(
ruby-rack
)
makedepends=(
ruby-bundler
ruby-rake
)
checkdepends=(
ruby-minitest
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c644d6bb405327c04cf172a88189791db934e8359ea7f2ea186040b01774bbeeb90d7db3858be8d3cc49a3f51d19277d944370017ef92f88561812fd3d94495e')

prepare() {
  cd "request_store-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "request_store-${pkgver}"

  rake build
}
check() {
  local _gemdir="$(gem env gemdir)"
  cd request_store-$pkgver
  GEM_HOME="tmp_install/$_gemdir" rake
}
package() {
  cd "request_store-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
