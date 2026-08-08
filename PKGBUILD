# Maintainer: John Peter Sa <johnpetersa19@proton.me>
pkgname=pkgbuild-manager
_pkgname=PKGBUILD_Manager
pkgver=2.5.4
pkgrel=1
_builddir="build-${pkgver}"
pkgdesc="Rust CLI + GTK4 settings panel and multi-file-manager context-menu integration for PKGBUILD management"
arch=('x86_64')
url="https://github.com/johnpetersa19/PKGBUILD_Manager"
license=('GPL-3.0-or-later')
depends=(
  'pacman-contrib'
  'libnotify'
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'git'
  'gettext'
)
makedepends=('meson' 'ninja' 'rust' 'cargo' 'gettext' 'blueprint-compiler')
optdepends=(
  'namcap: for auditing package metadata and structure'
  'shellcheck: for linting PKGBUILD bash code'
  'python-nautilus: for Nautilus (GNOME) right-click menu support'
  'nemo-python: for Nemo (Cinnamon) right-click menu support'
  'python-caja: for Caja (MATE) right-click menu support'
  'dolphin: for Dolphin (KDE) right-click menu support'
  'openssh: for accessing Git and AUR remotes over SSH'
)
provides=("pkgbuild-manager")
conflicts=("pkgbuild-manager-git")
install=pkgbuild-manager.install
# FIX: sha256sums must not be 'SKIP' in releases published to the AUR.
# Replace with the real hash before publishing:
#   sha256sums=('PUT_REAL_SHA256_HASH_HERE')
# To generate: makepkg -g
source=("$_pkgname-$pkgver.tar.gz::https://github.com/johnpetersa19/PKGBUILD_Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74855ed6cf37750cf5cbfc8774074ca23c647bbadbab49ee628e929fc9713d0b')

build() {
  # Never reuse a Meson configuration created for another source tree or an
  # interrupted build. A stale generic build/ directory can silently package
  # files from the previous release.
  rm -rf -- "$_builddir"
  arch-meson "$_pkgname-$pkgver" "$_builddir" --buildtype=release
  meson compile -C "$_builddir"
}

package() {
  meson install -C "$_builddir" --destdir="$pkgdir"
}
