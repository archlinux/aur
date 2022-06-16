# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

# To enable linting in VS Code, run: tar -xf .vscode.untar-me.tar.xz

_gemname=batch_rename
pkgname=batch-rename
pkgver=0.1.2
pkgrel=1
pkgdesc='Command line tool to bulk-rename files interactively'
arch=('any')
url='https://github.com/claui/batch_rename'
license=('ISC')
depends=('diffmerge' 'ruby')
makedepends=('rubygems')
options=('!emptydirs' '!strip')

source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)

sha512sums=(
  'd8c41f1fa9569fe3c5f5bbd551e4fb021bd6f7c796fb467c5c72131f2b0b285400c053e483193a4f87ab1c7d05ad36fd7cf65ca8525a2d5a0856bbee8d05c778'
)

noextract=("${_gemname}-${pkgver}.gem")

package() {
  echo >&2 "Packaging the ${_gemname} gem"
  _gemdir="$(/usr/bin/ruby -e 'puts Gem.default_dir')"
  /usr/bin/gem install \
    --ignore-dependencies --no-document --no-user-install \
    --install-dir="${pkgdir}/${_gemdir}" \
    --bindir="${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  echo >&2 'Cleaning up'
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  echo >&2 'Packaging the README'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE"
}
