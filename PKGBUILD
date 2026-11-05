# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium's terminfo entry, xterm-vtium, built from the tip of a git branch,
# GitHub's main by default (ADR-1500 D3, D8). vtium-git and the other -git
# console packages depend on it, and it installs alone on a machine that
# reaches vtium over ssh. It differs from vtium-terminfo only in its source
# and its version, and it provides vtium-terminfo at its own version and
# conflicts with it, so a machine holds one of the two.
#
# VTIUM_GIT_URL and VTIUM_GIT_BRANCH point the build at another repository
# and branch, such as a local checkout:
#
#   VTIUM_GIT_URL=file:///path/to/vtium VTIUM_GIT_BRANCH=my-branch makepkg -f
#
# .SRCINFO is made with none of them set, so it always names GitHub's main.
# The source is not checked against a signature: main's tip is a merge
# commit that GitHub signs with its own key.

pkgname=vtium-terminfo-git
pkgver=0.1.0alpha.5.r0.g2f54fa7
pkgrel=1
pkgdesc='The terminfo entry xterm-vtium, for sessions in vtium (git main)'
arch=('any')
url='https://github.com/vtium/vtium'
license=('MIT')
provides=("vtium-terminfo=$pkgver")
conflicts=('vtium-terminfo')
makedepends=('git' 'ncurses')
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

# Everything below is the same in vtium-terminfo-git/PKGBUILD and
# vtium-terminfo/PKGBUILD; aur-publish refuses a package whose copy differs
# from the other's.

# vtium's Makefile compiles the entry with tic under its name xterm-vtium
# and stages it with the license, so which file goes where lives in vtium's
# tree (ADR-1500 D1, D3). make install-terminfo builds no console, so the
# package needs no cargo.
package() {
  make -C "$srcdir/vtium" PREFIX=/usr install-terminfo \
    DESTDIR="$pkgdir" PKGNAME="$pkgname"
}
