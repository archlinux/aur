# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="adb-wifi"
pkgname="${_pkgname}-git"
pkgver=0.1.2.r1.afa4bb3
_commit="63d54c0bcbcbaac9be9d9afd78a9390103318915" # 0.1.2
pkgrel=2
pkgdesc="A CLI tool which shows QR code and makes seamless connection to the ADB bridge"
arch=('any')
url="https://github.com/saleehk/${_pkgname}"
license=('ISC')
depends=('adb' 'nodejs')
makedepends=('git' 'npm')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/.*"version": "\([0-9.]*\)".*/\1/p' package.json)
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" .

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "${pkgdir}"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -vd "${pkgdir}/usr/share/doc/${_pkgname}"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -vs "/usr/lib/node_modules/${_pkgname}/readme.md" "README.md"
}
