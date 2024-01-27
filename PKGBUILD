# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_py="python2"
_pkg="setuptools"
pkgname="${_py}-${_pkg}"
pkgver=44.1.1
pkgrel=2
epoch=2
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=(
  'any')
license=(
  'PSF')
url="https://pypi.org/project/${_pkg}"
_url="https://github.com/pypa/${_pkg}"
depends=(
  "${_py}")
makedepends=(
  'git'
)
provides=(
  "${_py}-distribute")
replaces=(
  "${_py}-distribute")
source=(
  "${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha512sums=(
  'aabddfbd62b95ce7d8e68d582362361d32b91e65e6d00c393593521a2c1c383552e324ae64974049ae9880072c8741e2393e6482cd07ff7dd30615e91e9e1450')

export \
  SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0

prepare() {
  # Remove post-release tag since we are using stable tags
  sed \
    -e '/tag_build = .post/d' \
    -e '/tag_date = 1/d' \
    -i "${_pkg}-${pkgver}/setup.cfg"

  cd \
    "${srcdir}/${_pkg}-${pkgver}"
  sed \
    -i \
    -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env ${_py}|" \
    "${_pkg}/command/easy_install.py"
}

build() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    bootstrap.py
  "${_py}" \
    setup.py \
      build
}

package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
      --prefix=/usr \
      --root="${pkgdir}" \
      --optimize=1 \
      --skip-build
  rm \
    -f \
    "${pkgdir}/usr/bin/easy_install"
}

# vim:set sw=2 sts=-1 et:
