# Maintainer: dreieck

_pkgname=fefeblog-consoleview
pkgname="${_pkgname}-git"
epoch=0
pkgver=20221016.03.r9.20221016.35d2656
pkgrel=1
pkgdesc="Simble bash script to view 'Fefes Blog' (http://blog.fefe.de/) on the console."
url="https://gitlab.com/dreieckli/fefeblog-consoleview"
arch=('any')
license=(
  'GPL3'
  'custom: logo'
)
groups=()
depends=(
  "bash"
  "curl"
  "ncurses"
  "pandoc"
)
makedepends=(
  'git'
)
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
options=('emptydirs')
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  chmod 755 "${srcdir}/${_pkgname}/fefe.sh" # So that pkgver() can execute it.
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(./fefe.sh --version)"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -v -D -m755 "fefe.sh" "${pkgdir}/usr/bin/fefe"
  install -v -D -m644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -v -D -m644 "logo.jpg" "${pkgdir}/usr/share/doc/${_pkgname}/logo.jpg"
  install -v -D -m644 "COPYING.GPL3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL3.txt"
  install -v -D -m644 "logo.info.md" "${pkgdir}/usr/share/licenses/${pkgname}/logo.info.md"
}
