# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=inkscape-eggbot-git
_gitpkgname=EggBot
pkgver=r688.ac3cf73
_axidraw_pkgver=3.9.4
pkgrel=1
pkgdesc='EggBot software as an Inkscape extension. Useful for other plotters, too.'
arch=('any')
url='https://github.com/evil-mad/EggBot'
license=(
  'GPL2' # vendored `axidrawinternal` dependency
  'GPL3' # EggBot extension proper
)
depends=('inkscape' 'python-ink-extensions-git' 'python-plotink')
makedepends=('git' 'python')
provides=('inkscape-eggbot')
conflicts=('inkscape-eggbot')
options=('!strip')

source=(
  "${pkgname}::git+https://github.com/evil-mad/EggBot.git"
  "axidraw-${_axidraw_pkgver}.tar.gz::https://github.com/evil-mad/axidraw/archive/v${_axidraw_pkgver}.tar.gz"
)

sha512sums=(
  'SKIP'
  '80c779fcdc4a3a7f14005e9085b2a8b9ee565186d7053349417fdeb19d94b6f8a5732fe72ffcc8245f205eef5099691fea2d79188cbef9d0d50a4aca2c9d4f00'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

package() {
  local _site_packages

  echo >&2 'Packaging the Inkscape extension'
  mkdir -p "${pkgdir}/usr/share/inkscape/extensions"
  cp -r --preserve=mode -T \
    "${srcdir}/${pkgname}/inkscape_driver" \
    "${pkgdir}/usr/share/inkscape/extensions/${_gitpkgname}"

  echo >&2 'Packaging vendored runtime dependency: axidrawinternal'
  mkdir -p "${pkgdir}/usr/share/inkscape/extensions/${_gitpkgname}/axidraw_deps"
  cp -r --preserve=mode -T \
    "${srcdir}/axidraw-${_axidraw_pkgver}/inkscape driver" \
    "${pkgdir}/usr/share/inkscape/extensions/${_gitpkgname}/axidrawinternal"

  echo >&2 'Symlinking other runtime dependencies'
  _site_packages="$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )"
  echo >&2 "Detected site-packages dir: ${_site_packages}"
  ln -ns \
    "${_site_packages}/plotink" \
    "${_site_packages}/ink_extensions" \
    "${_site_packages}/ink_extensions_utils" \
    "${pkgdir}/usr/share/inkscape/extensions/${_gitpkgname}/axidraw_deps"

  echo >&2 'Adding stub for runtime dependencies'
  # See also: /usr/share/inkscape/extensions/plotink/plot_utils_import.py
  echo 'from plotink.plot_utils_import import *' \
    > "${pkgdir}/usr/share/inkscape/extensions/${_gitpkgname}/plot_utils_import.py"

  echo >&2 'Packaging examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r --preserve=mode -T \
    "${srcdir}/${pkgname}/example files" \
    "${pkgdir}/usr/share/${pkgname}/examples"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}/README.md"
  cp -r --preserve=mode -T \
    "${srcdir}/${pkgname}/docs" \
    "${pkgdir}/usr/share/doc/${pkgname}/html"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}/LICENSE"
}
