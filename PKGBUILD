# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium built from a release tag, as two packages, the console and its
# terminfo entry (ADR-1500 D3). The maintainer signs the tag with the PGP
# key in validpgpkeys, and makepkg checks the tag's signature before it
# builds. Import the key once: gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
# VTIUM_FEATURES in makepkg's environment names the console's features.
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).

pkgbase=vtium
pkgname=('vtium' 'vtium-terminfo')
_tag=v0.1.0-alpha.2
pkgver=0.1.0alpha.2
pkgrel=1
pkgdesc='Terminal for the Linux console, drawn through KMS/DRM'
arch=('x86_64')
url='https://github.com/vtium/vtium'
license=('MIT')
makedepends=('cargo' 'git' 'ncurses' 'libxkbcommon' 'systemd-libs')
options=('!debug')
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

package_vtium() {
  depends=('glibc' 'libgcc' 'libxkbcommon' 'systemd-libs' 'vtium-terminfo')
  optdepends=('kbd: console fonts, which vtium draws when no frit is set'
              'kmscon-terminfo: the terminfo entry kmscon, for sessions run with term=kmscon')
  conflicts=('vtium-git')
  install=vtium.install
  _package_console
}

package_vtium-terminfo() {
  arch=('any')
  pkgdesc='The terminfo entry xterm-vtium, for sessions in vtium'
  _package_terminfo
}

# Everything below is the same in vtium-git/PKGBUILD and vtium/PKGBUILD;
# aur-publish refuses a package whose copy differs from the other's.

prepare() {
  cd vtium
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

# vtium's Makefile builds and stages every file the packages ship, so which
# file goes where lives in vtium's tree (ADR-1500 D1, D3). Each call names
# the same build: PREFIX=/usr, so the console starts its glyph helper at
# /usr/bin/vtium-config, the features that VTIUM_FEATURES in makepkg's
# environment names, such as VTIUM_FEATURES='images logind', and --frozen,
# because prepare() fetched the crates. So make install in package() finds
# the build that build() made, and builds nothing again.
_make() {
  CARGO_TARGET_DIR=target make -C "$srcdir/vtium" PREFIX=/usr \
    FEATURES="${VTIUM_FEATURES:-}" CARGO_BUILD_FLAGS=--frozen "$@"
}

# The console, built with vtium's minspec profile, and its glyph helper.
build() {
  _make install-build
}

# The console, its helper, its units vtium@.service and vtium-getty@.service,
# the example configuration /etc/vtium/vtium.conf.example, the example udev
# rules and hwdb fragment, and the license.
_package_console() {
  _make install DESTDIR="$pkgdir" PKGNAME="$pkgname"
}

# vtium's terminfo entry, compiled under its name xterm-vtium, and the
# license (ADR-1500 D3). No package ships an entry named kmscon: the
# kmscon-terminfo package keeps that name.
_package_terminfo() {
  _make install-terminfo DESTDIR="$pkgdir" PKGNAME="$pkgname"
}
