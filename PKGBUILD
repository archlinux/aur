# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgbase=xxenv-latest
pkgname=('goenv-latest' 'nodenv-latest' 'pyenv-latest' 'rbenv-latest')
pkgver=0.2.1
pkgrel=1
pkgdesc="Enhances **env with a \`latest\` subcommand, which prints the latest version of the target platform"
arch=('any')
url='https://github.com/momo-lab/xxenv-latest'
license=('MIT')
makedepends=('goenv' 'nodenv')
options=('!strip')

source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/momo-lab/xxenv-latest/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'c1e0d3c0c95ab9486f0b37b1078d3c8ea81df9639c41b85dabae2742ba91962bb18fa2682e1cdbe67ef559a5e3e14cac9fb5a5f8e33a7cedabec520f97e2b102'
)

_pkgdesc() {
  printf "Enhances %s with a \`latest\` subcommand, which prints the latest %s version" \
    "${pkgname%-latest}" "${1?}"
}

# shellcheck disable=SC2128
_package() {
  local target_bindir
  target_bindir="${1:-/usr/lib/${pkgname%-latest}/libexec}"

  echo >&2 "Packaging the ${pkgname} executable"
  cd "${srcdir}/${pkgbase}-${pkgver}"
  # We can pick just the one symlink we need and ignore the rest,
  # because `install` will copy the content of the symlink source.
  install -D -m 755 -t "${pkgdir}${target_bindir}" "bin/${pkgname}"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
}

package_goenv-latest() {
  pkgdesc="$(_pkgdesc 'Go')"
  depends=('goenv')
  _package
}

package_nodenv-latest() {
  pkgdesc="$(_pkgdesc 'Node.js')"
  depends=('nodenv')
  _package
}

package_pyenv-latest() {
  pkgdesc="$(_pkgdesc 'Python')"
  depends=('pyenv')
  _package "/usr/share/pyenv/plugins/${pkgbase}/bin"
}

package_rbenv-latest() {
  pkgdesc="$(_pkgdesc 'Ruby')"
  depends=('rbenv')
  _package
}
