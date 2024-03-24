# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: quang (https://aur.archlinux.org/account/quang)
# Contributor: Samega7Cattac (https://aur.archlinux.org/account/Samega7Cattac)
# Contributor: max_meyer
# Contributor: Stefan Husmann

pkgname=svg2tikz-git
_gitname="svg2tikz"
pkgver=3.0.1+4.r481.20240321.2b8b19c
pkgrel=1
pkgdesc="Set of tools for converting SVG graphics to TikZ/PGF code."
arch=('any')
url="https://github.com/kjellmf/svg2tikz"
license=('GPL2')
depends=(
  'python>=3'
  'python-inkex'
)
optdepends=(
  'inkscape: for using the inksape extension files.'
  'python-lxml'
  'xclip'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-poetry'
  'python-sphinx'          # For building the documentation.
  'python-sphinx-argparse' # For building the documentation.
  'texlive-bin'            # For building the documentation.
)
checkdepends=(
  'python-pytest'
)
provides=(
  "inkscape-tikz=${pkgver}"
  "svg2tikz=${pkgver}"
  "svg2tikz-doc=${pkgver}"
  "python-svg2tikz=${pkgver}"
)
conflicts=(
  'inkscape-tikz'
  'svg2tikz'
  'svg2tikz-doc'
  'python-svg2tikz'
)
replaces=(
  'inkscape-tikz-hg'
)
source=(
  "${_gitname}::git+https://github.com/kjellmf/${_gitname}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "$srcdir"/"$_gitname"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "$srcdir"/"$_gitname"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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

build() {
  cd "$srcdir"/"$_gitname"

  python -m build --wheel --no-isolation

  cd docs
  make latex
}

check() {
  cd "$srcdir"/"$_gitname"

  python -m pytest
}

package() {
  cd "$srcdir/$_gitname"

  python -m installer --destdir="$pkgdir" dist/*.whl
  _inkscape_ext="$pkgdir/usr/share/inkscape/extensions"
  install -dvm755 "$_inkscape_ext"
  cp -v ./svg2tikz/tikz_export* "$_inkscape_ext/"

  for _docfile in "${srcdir}/git.log" CHANGELOG.md README.md; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/svg2tikz/$(basename "${_docfile}")"
  done
  cp -rv docs "${pkgdir}/usr/share/doc/svg2tikz/docs"

  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/svg2tikz/LICENSE"
}
