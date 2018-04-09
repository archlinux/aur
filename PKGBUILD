# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_gemname=sexp_processor
pkgname="ruby-${_gemname}"
pkgver=4.11.0
pkgrel=1
pkgdesc="A branch of ParseTree that brings several sexp processing tools."
arch=(any)
url="https://github.com/seattlerb/sexp_processor"
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('4c90ff17c492789fdd248369fa16ce65ef05576b3d9f593a49c6a0961dbcd5ee')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"

  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${_gemname}-${pkgver}.gem"

  # install license. Using `install` lets us ensure dest directory exists and
  # permissions are OK. Unfortunately, it only works with files, not stdin.
  local _license="$(mktemp)"
  sed -n '/LICENSE:/,$ p' \
    "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/README.rdoc" > "${_license}"
  install -Dm 644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${_license}"
}

# vim:set ts=2 sw=2 et:
