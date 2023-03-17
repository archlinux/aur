# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: jzbor (https://aur.archlinux.org/account/jzbor)

_pkgname=sdiff-gtk
pkgname="${_pkgname}-git"
pkgver=0.1.0+8.r18.20230317.4575251
pkgrel=1
pkgdesc="GTK+ frontend for Stable Diffusion. Latest git checkout."
arch=(
  'any'
)
url="https://github.com/jzbor/${_pkgname}"
license=(
  'MIT'
)
groups=()
depends=(
  gtk3
  'python>=3'
  python-gobject
  python-diffusers
  python-pillow
  python-pytorch
  python-sympy
  python-transformers
  python-accelerate
)
makedepends=(
  git
  python-poetry
  python-installer
)
checkdepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=()
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.sh.in"
  "${_pkgname}.desktop"
)
noextract=()
sha256sums=(
  'SKIP'
  'c50bb6462ac2e0258361138115b832cdd276b2104ac070a4cdad94138367b744'
  'bdcad0987423cdda32c0fe687d3689f1ae4b92fb769debc146ea1389607ef9c9'
)
validpgpkeys=()

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --long --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi

}

build() {
  cd "${srcdir}/${_pkgname}"

  poetry build

  local site_packges_escaped="$(python -c 'import site; print(site.getsitepackages()[0])' | sed 's/\//\\\//g')"
  sed "s/%%PYTHON_SITEPACKAGES%%/${site_packges_escaped}/g" "${srcdir}/${_pkgname}.sh.in" > "${srcdir}/${_pkgname}.sh"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install launcher script
  install -D -v -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Install desktop file
  install -D -v -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install actual python wheel
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install documentation
  for _docfile in README.md "${srcdir}/git.log"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
}
