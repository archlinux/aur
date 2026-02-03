# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Dvd-Znf <email@dvdznf.xyz>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>
# Contributor: Julian Mac Kenzie <jukiangm@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Vladimir Panteleev (CyberShadow) <archlinux@cy.md>

# shellcheck disable=SC2034
_py="python"
pkgname="blivet-gui"
pkgver=2.6.0
pkgrel=2
pkgdesc='GUI tool for storage configuration'
arch=(
  'x86_64'
  'pentium4'
  'i686'
  'arm')
license=('GPL-2.0-or-later')
url="https://github.com/storaged-project/${pkgname}"
depends=(
  "${_py}"
  "${_py}-blivet"
  "${_py}-cairo"
  "${_py}-gobject"
  "${_py}-pid"
  'adwaita-icon-theme')
makedepends=(
  'git'
  'make'
  'gettext'
  "${_py}-setuptools")
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5fba88e535012357b10f8a62bb5dd3379a981f0e9ad1c9292ae226f6d4ff0112')

build() {
  cd \
    "${pkgname}-${pkgver}" || \
    exit
  # Build .mo files directly - skip update-po which requires translation-canary
  # submodule (not in release tarball) and xgettext_werror.sh that fails on
  # embedded URL warnings in upstream code
  for po in po/*.po; do
    lang="${po%.po}"
    lang="${lang#po/}"
    msgfmt -o "po/${lang}.mo" "$po"
  done
}

# shellcheck disable=SC2154
package() {
  cd \
    "${pkgname}-${pkgver}" || \
    exit
  make \
    DESTDIR="${pkgdir}" \
    RPM_BUILD_ROOT="${pkgdir}" \
    install
}
