# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: quang (https://aur.archlinux.org/account/quang)
# Contributor: Samega7Cattac (https://aur.archlinux.org/account/Samega7Cattac)
# Contributor: max_meyer
# Contributor: Stefan Husmann

pkgname=svg2tikz-git
_gitname="svg2tikz"
pkgver=3.3.3+3.r604.20251101.a71236b
pkgrel=1
pkgdesc="Set of tools for converting SVG graphics to TikZ/PGF code."
arch=('any')
url="http://xyz2tex.github.io/svg2tikz/"
license=('GPL-2.0-or-later')
depends=(
  'python>=3.8'
  'python-inkex>=1.2.2'
)
optdepends=(
  'inkscape: for using the inksape extension files.'
  'python-lxml>=4.9.2'
  'xclip'
)
makedepends=(
  'git' # To retrieve upstream sources.
  'python-build'      # For building/ packaging the software.
  'python-installer'  # For building/ packaging the software.
  'python-setuptools' # For building/ packaging the software.
  'python-wheel'      # For building/ packaging the software.
  'python-poetry'     # For building/ packaging the software.
  'python-sphinx>=6.0.0'              # For building the documentation.
  'python-sphinx-argparse>=0.4.0'     # For building the documentation.
  'python-sphinx-click>=4.4.0'        # For building the documentation.
  'python-sphinx-copybutton>=0.5.1'   # For building the documentation.
  'python-sphinx-furo>=2023.9.10'     # For building the documentation.
  'python-sphinxext-opengraph>=0.7.5' # For building the documentation.
  'texlive-bin'                       # For building the documentation.
  'texlive-binextra'                  # For building the documentation (`latexmk`).
  'texlive-latexrecommended'          # For building the documentation (`cmap.sty`).
  'texlive-fontsrecommended'          # For building the documentation (`tgtermes.sty`).
  'texlive-latexextra'                # For building the documentation (`fncychap.sty`).
)
checkdepends=(
  'python-inkex>=1.2.2'
  'python-lxml>=4.9.2'
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
  make -C _build/latex all-pdf
  make htmlhelp
}

check() {
  cd "$srcdir"/"$_gitname"

  # See http://xyz2tex.github.io/svg2tikz/contribute.html#tools on how to run tests.
  python -m unittest
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
  install -Dvm644 -t "${pkgdir}/usr/share/doc/svg2tikz" "docs/_build/latex/svg2tikz.pdf"
  cp -rv docs/_build/htmlhelp "${pkgdir}/usr/share/doc/svg2tikz"/

  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/svg2tikz/LICENSE"
}
