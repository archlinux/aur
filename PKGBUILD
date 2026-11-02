# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium built from the tip of a git branch: GitHub's main by default.
# VTIUM_GIT_URL and VTIUM_GIT_BRANCH point the build at another repository
# and branch, such as a local checkout (README.md):
#
#   VTIUM_GIT_URL=file:///path/to/vtium VTIUM_GIT_BRANCH=my-branch makepkg -f
#
# .SRCINFO is made with neither set, so it always names GitHub's main.

pkgname=vtium-git
pkgver=r1547.725c369
pkgrel=1
pkgdesc='Terminal for the Linux console, drawn through KMS/DRM (git main)'
arch=('x86_64')
url='https://github.com/vtium/vtium'
license=('MIT')
depends=('glibc' 'libgcc' 'libxkbcommon' 'systemd-libs' 'kmscon-terminfo')
makedepends=('cargo' 'git')
optdepends=('kbd: console fonts, which vtium draws when no frit is set'
            'systemd: the VT units vtium@.service and vtium-getty@.service')
provides=('vtium')
conflicts=('vtium')
options=('!debug')
install=vtium-git.install
source=("vtium::git+${VTIUM_GIT_URL:-https://github.com/vtium/vtium.git}#branch=${VTIUM_GIT_BRANCH:-main}")
sha256sums=('SKIP')

pkgver() {
  cd vtium
  # r<commits>.<hash> until vtium has a version tag, then the tag's version.
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd vtium
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd vtium
  make install-build PREFIX=/usr CARGO_BUILD_FLAGS=--frozen
}

package() {
  cd vtium
  make install DESTDIR="$pkgdir" PREFIX=/usr CARGO_BUILD_FLAGS=--frozen
  # Arch keeps a package's license under its package's name.
  mv "$pkgdir/usr/share/licenses/vtium" "$pkgdir/usr/share/licenses/$pkgname"
}
