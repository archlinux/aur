# Maintainer: etcusrvar <e t c u s r v a r at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=xdgize-git
_pkgname="${pkgname%-git}"
pkgdesc='Generates wrapper/shim shell scripts around external commands to "XDG"-ize them'
pkgver=0.2
pkgrel=1
url="https://github.com/etcusrvar/${_pkgname}"
arch=('any')
license=('Unlicense')
makedepends=('git')
depends=('bash')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
_="${pkgdir:-}"

package() {

  cd "$pkgname" || exit

  install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"

  for f in rules.d/*; do
    install -Dm644 "$f" "${pkgdir}/etc/${_pkgname}/$f"
    [[ -L "$f" ]] && cp -df "$f" "${pkgdir}/etc/${_pkgname}/$f"
  done

  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"

}

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
