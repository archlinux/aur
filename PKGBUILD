# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=inkscape-eggbot-git
_gitpkgname=EggBot
pkgver=r692.ff3d7bf
_axidraw_pkgver=3.9.5
_axidraw_srctarballver="v.${_axidraw_pkgver}" # since version 3.9.5
pkgrel=1
pkgdesc='EggBot software as an Inkscape extension. Useful for other plotters, too.'
arch=('any')
url='https://github.com/evil-mad/EggBot'
license=(
  # Vendored `axidrawinternal` dependency
  'GPL-2.0-only'
  # EggBot extension proper
  'GPL-3.0-only'
)
depends=('inkscape' 'python-ink-extensions-git' 'python-plotink')
makedepends=('git' 'python')
provides=('inkscape-eggbot')
conflicts=('inkscape-eggbot')
options=('!debug' '!strip')

source=(
  "${pkgname}::git+https://github.com/evil-mad/EggBot.git"
  "axidraw-${_axidraw_srctarballver}.tar.gz::https://github.com/evil-mad/axidraw/archive/${_axidraw_srctarballver}.tar.gz"
)

sha512sums=(
  'SKIP'
  'e9c6444813b109974f1e934de1959026c80a458f8fd1b979d41a824aebb72e97058d21dda7ea340dd466e6e09c547248cff5ef728f6ee85489901f8fd84ef398'
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
    "${srcdir}/axidraw-${_axidraw_srctarballver}/inkscape driver" \
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

  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/eggbot" \
    "${srcdir}/${pkgname}/LICENSE"
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/axidraw" \
    "${srcdir}/axidraw-${_axidraw_srctarballver}/LICENSE"
}
