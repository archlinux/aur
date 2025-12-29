# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=inkscape-eggbot-git
_gitpkgname=EggBot
pkgver=r924.6234dff
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
depends=('python' 'inkscape' 'python-ink-extensions' 'python-plotink')
makedepends=('git')
provides=('inkscape-eggbot')
conflicts=('inkscape-eggbot')
options=('!debug' '!strip')

source=(
  "${pkgname}::git+https://github.com/evil-mad/EggBot.git"
  "axidraw-${_axidraw_srctarballver}.tar.gz::https://github.com/evil-mad/axidraw/archive/${_axidraw_srctarballver}.tar.gz"
  # On the next Axidraw release (> 3.9.5), remove the checked-in `axidraw_svg_reorder.py` from Git and vendor it from:
  # "${srcdir}/axidraw-${_axidraw_srctarballver}/inkscape driver/public_build_materials/wrappers/axidraw_svg_reorder.py"
  'axidraw_svg_reorder.py'
  # On the next Axidraw release (> 3.9.5), remove this patch.
  'github-pr-170.patch'
)

sha512sums=(
  'SKIP'
  'e9c6444813b109974f1e934de1959026c80a458f8fd1b979d41a824aebb72e97058d21dda7ea340dd466e6e09c547248cff5ef728f6ee85489901f8fd84ef398'
  'd57c176c47101469e68f74f400cb64081e906b63f83dbc304cd41dca266d25d48313a7f42a58df1ac8754eab5494da4bf775b1aea3c3a663d8f9846afbd0e55e'
  '9dd45b94d4aca410e632a330163ebd8d6b51b29605a012761f00feed5de02ff7d1d6f981458a8a8267adb82dab8b1fae656981c77762358ac275ec54903e4688'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${pkgname}" rev-list --count HEAD)" \
    "$(git -C "${pkgname}" rev-parse --short HEAD)"
}

prepare() {
  # On the next Axidraw release (> 3.9.5), remove this patch.
  # Note that this PR is named "3.9.7", but no such tag or release
  # exists.
  # See also: https://github.com/evil-mad/axidraw/pull/170
  echo >&2 'Applying patch for compatibility with ink-extensions v2.x'
  patch -p1 -d "${srcdir}/axidraw-${_axidraw_srctarballver}" \
    < "${srcdir}/github-pr-170.patch"

  echo >&2 'Removing Inkscape extensions from vendored runtime dependency'
  rm -v "${srcdir}/axidraw-${_axidraw_srctarballver}/inkscape driver"/*.inx
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
    "${pkgdir}/usr/share/inkscape/extensions/${_gitpkgname}/axidraw_deps/axidrawinternal"

  echo >&2 'Packaging inkscape extension wrapper required by eggbot_reorder.inx'
  # On the next Axidraw release (> 3.9.5), remove the checked-in `axidraw_svg_reorder.py` from Git and vendor it from:
  # "${srcdir}/axidraw-${_axidraw_srctarballver}/inkscape driver/public_build_materials/wrappers/axidraw_svg_reorder.py"
  install -D -m 644 -t "${pkgdir}/usr/share/inkscape/extensions/${_gitpkgname}" \
    "${srcdir}/axidraw_svg_reorder.py"

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
