# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Ashish Kushwaha <ashish.kus2408@gmail.com>

_pkgname=batfetch
pkgname="${_pkgname}-git"
pkgver=r30.20240808.7f3c797
pkgrel=1
pkgdesc="A command-line tool that displays detailed information about the battery of your device in a clean and organized way."
arch=('any')
url="https://github.com/ashish-kus/batfetch"
license=('GPL-3.0-or-later')
depends=("bash")
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}<=r30.7f3c797")
source=("${_pkgname}::git+https://github.com/ashish-kus/batfetch")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}
pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 -t "${pkgdir}/usr/bin"  src/batfetch

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"          git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/preview"  preview/preview-batfetch.png
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"      LICENSE
}
