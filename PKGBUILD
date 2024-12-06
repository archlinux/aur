# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: David Pedersen (https://aur.archlinux.org/account/Limero)
_pkgname="scli"
pkgname="${_pkgname}-git"
pkgver=0.7.5+1.r515.20241129.f277564
pkgrel=1
pkgdesc="A simple terminal user interface for Signal, wrapping around 'signal-cli'."
arch=("any")
url="https://github.com/isamert/scli"
license=("GPL3")
depends=(
  "python>=3.7"
  "python-pyqrcode"
  "python-urwid"
  "signal-cli"
)
makedepends=("git")
optdepends=(
  "python-urwid_readline: For emacs-like readline-like keybindings on the input line."
  "qrencode: Generate QR codes for linking device."
  "xclip: For X11 clipboard interaction."
  "wl-clipboard: For Waylands clipboard interaction."
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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

  install -Dvm755 "scli" "$pkgdir/usr/bin/scli"

  for _docfile in git.log CONTRIBUTING.md README.md screenshots/*; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  
  for _licensefile in LICENSE; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
