# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium built from the tip of a git branch: GitHub's main by default, as two
# packages, the console and its terminfo entry (ADR-1500 D3).
# VTIUM_GIT_URL and VTIUM_GIT_BRANCH point the build at another repository
# and branch, such as a local checkout, and VTIUM_FEATURES names the
# console's features:
#
#   VTIUM_GIT_URL=file:///path/to/vtium VTIUM_GIT_BRANCH=my-branch makepkg -f
#
# .SRCINFO is made with none of them set, so it always names GitHub's main.
# The source is not checked against a signature: main's tip is a merge
# commit that GitHub signs with its own key.

pkgbase=vtium-git
pkgname=('vtium-git' 'vtium-terminfo-git')
pkgver=r1866.16e66a2
pkgrel=1
pkgdesc='Terminal for the Linux console, drawn through KMS/DRM (git main)'
arch=('x86_64')
url='https://github.com/vtium/vtium'
license=('MIT')
makedepends=('cargo' 'git' 'ncurses' 'libxkbcommon' 'systemd-libs')
options=('!debug')
source=("vtium::git+${VTIUM_GIT_URL:-https://github.com/vtium/vtium.git}#branch=${VTIUM_GIT_BRANCH:-main}")
sha256sums=('SKIP')

pkgver() {
  cd vtium
  # The last version tag, with the hyphen before a pre-release dropped
  # (v0.1.0-alpha.1 is 0.1.0alpha.1, as the vtium package names it), then
  # .r<commits since>.g<hash>. Before vtium has a tag, r<commits>.<hash>.
  if git describe --long --tags --match 'v[0-9]*' --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --match 'v[0-9]*' --abbrev=7 |
      sed 's/^v//;s/^\([0-9.]*\)-\([a-z]\)/\1\2/;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

package_vtium-git() {
  depends=('glibc' 'libgcc' 'libxkbcommon' 'systemd-libs' 'vtium-terminfo-git')
  optdepends=('kbd: console fonts, which vtium draws when no frit is set'
              'kmscon-terminfo: the terminfo entry kmscon, for sessions run with term=kmscon')
  provides=('vtium')
  conflicts=('vtium')
  install=vtium-git.install
  _package_console
}

package_vtium-terminfo-git() {
  arch=('any')
  pkgdesc='The terminfo entry xterm-vtium, for sessions in vtium (git main)'
  provides=('vtium-terminfo')
  conflicts=('vtium-terminfo')
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
# /usr/bin/vtium-vitrify, the features that VTIUM_FEATURES in makepkg's
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
