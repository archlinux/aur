# Maintainer: Javier Tia <floss@jetm.me>

# tio from my fork, github.com/jetm/tio, which adds a socket client for unix:,
# inet: and inet6: targets and RFC 2217 on both ends of the socket. Upstream
# tio/tio has stopped merging, so the fork's master is the maintained line.
#
# Built from a pinned commit rather than the branch head, so a given pkgver
# always names the same source. To ship a new fork commit, set _commit to it and
# pkgver to what `git describe --long --tags` reports there (dashes folded into
# the r-count form), then regenerate .SRCINFO.
#
# Upstream releases are tracked by nvchecker, but never auto-bumped: a new tio
# release has to be merged into the fork first. CI opens an issue instead; see
# the tio-fork-jetm exemption in .github/workflows/update.yml.
#
# It conflicts with and provides `tio`, so it replaces the distro package and
# anything depending on tio stays satisfied.

pkgname=tio-fork-jetm
pkgver=3.9.r100.ga068040
pkgrel=1
_commit=a068040d39d057ec368d5d2bd71e868fc6b88c0e
pkgdesc='Serial device I/O tool - fork with socket client mode and RFC 2217'
arch=('x86_64')
url='https://github.com/jetm/tio'
license=('GPL-2.0-or-later')
depends=('glib2' 'lua')
# bash-completion is deliberately absent. tio's meson treats it as optional and
# simply skips installing the completion when the dependency is not found.
makedepends=('git' 'meson' 'pkgconf')
provides=("tio=${pkgver%%.r*}")
conflicts=('tio')

source=("tio::git+https://github.com/jetm/tio.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    arch-meson tio build
    meson compile -C build
}

check() {
    # tio ships no test suite. The binary reporting the revision it was built
    # from is what tells this package apart from a distro build.
    ./build/src/tio --version
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 tio/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
