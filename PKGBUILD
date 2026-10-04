# Maintainer: Asger Geel Weirsoe <asger at weircon dot dk>
#
# PROVENANCE OF THE BINARY
#
# Upstream JASP publishes installers for Windows and macOS only; the official
# Linux channel is Flathub. The binary this package installs is therefore NOT an
# upstream release artifact. It is compiled from the tagged JASP sources
# (v0.98.1, commit 077322e8269c1ace3bd14b6dfe7059f606fc0bc6) against an Arch Linux userland, in an
# archlinux:base-devel container, by an automated pipeline:
#
#   build recipe:  https://gitea.weircon.dk/agw/jasp-desktop-bin
#   download:      https://asger.weirsoe.dk/tarballz/jasp-desktop-0.98.1-b36ed75bbd4f-x86_64.tar.zst
#
# It bundles its own R 4.5.3 and the non-system libraries it links against
# under /opt/jasp-desktop, so it does not constrain the versions of anything on
# your system. Built against Qt 6.11.

pkgname=jasp-desktop-bin
pkgver=0.98.1
pkgrel=1
pkgdesc="JASP Desktop - a fresh way to do statistics (prebuilt binary)"
arch=('x86_64')
url="https://jasp-stats.org/"
license=('AGPL-3.0-or-later')

provides=("jasp-desktop=${pkgver}")
conflicts=('jasp-desktop')

# This package ships its own R 4.5.3 plus the non-system libraries it and
# the JASP R modules link against (ICU, jsoncpp, glpk, JAGS, readstat, librdata,
# BLAS/LAPACK ...) under /opt/jasp-desktop/lib, with rpath pointing there.
#
# That is deliberate, and it is why nothing below is version-pinned: on a rolling
# distro a pin like 'icu<79' would make pacman refuse to upgrade ICU while JASP
# is installed, blocking the user's entire system upgrade. Bundling means JASP
# never constrains the system.
#
# Qt6 is the exception and stays a system dependency: Qt guarantees binary
# compatibility across Qt 6 minor releases, and bundling QtWebEngine would add
# ~500 MB for no real gain. A Qt 7 transition will need a rebuild.
depends=(
  'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-positioning' 'qt6-webchannel'
  'qt6-webengine' 'qt6-5compat' 'qt6-httpserver'
  'fontconfig' 'freetype2' 'libxkbcommon' 'hicolor-icon-theme'
)

# The tarball is a complete, already-verified /opt + /usr install tree, so every
# one of makepkg's tidying steps is unwanted here: they would modify content
# that was tested in exactly this form. Stripping in particular would be slow
# and is a good way to break a bundled R plus several hundred compiled R
# modules, and the rpath set at build time must survive untouched.
options=('!strip' '!debug' '!libtool' '!staticlibs' '!zipman' '!purge' '!emptydirs')

# The remote name is content-addressed, so it is kept as the local name too: a
# stale download left in the build directory can never be mistaken for the
# current tarball and fail the checksum.
source=("https://asger.weirsoe.dk/tarballz/jasp-desktop-0.98.1-b36ed75bbd4f-x86_64.tar.zst")
sha256sums=('b36ed75bbd4ff5b91156362ac861fcf49df9cb30b0134009f4c8d2e187777dc8')

package() {
  cp -a "${srcdir}/opt" "${pkgdir}/opt"
  cp -a "${srcdir}/usr" "${pkgdir}/usr"

  # The application lives under /opt; give it a name on PATH.
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/jasp-desktop/bin/JASP "${pkgdir}/usr/bin/jasp"
}
