# Maintainer: kunkka19xx <nobita079x@gmail.com>
# SPDX-License-Identifier: Apache-2.0
#
# Builds `main`. This is the package that catches breakage early: it compiles
# from source with the pinned Zig, so a std change that a tagged binary would
# hide shows up here first.
pkgname=lgtm-git
_pkgname=lgtm
# Recomputed by pkgver() on every build, so this is only what the AUR web page
# and the search index display until someone builds it. Carrying the last
# released version rather than zeroes is the convention: a browser comparing
# this against `lgtm-bin` should see two versions, not one and a placeholder.
pkgver=0.1.3.r0.gb6b7580
pkgrel=1
pkgdesc="Read what your coding agent just wrote, and point at the lines when you reply (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/kunkka19xx/lgtm"
license=('Apache-2.0')
provides=('lgtm')
conflicts=('lgtm' 'lgtm-bin')
depends=('git')
# Pinned, the same way .zigversion and build.zig.zon's minimum_zig_version are:
# Zig is pre-1.0 and a minor bump is a breaking change.
makedepends=('git' 'zig>=0.16.0')
optdepends=('tmux: send references to an agent pane')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # <last tag>.r<commits since>.<short sha>, the AUR's convention for a VCS
  # package - and it sorts correctly against the tagged `-bin`.
  #
  # The describe is captured before it is filtered, not piped into one: in
  # `git describe | sed || fallback` the `||` sees *sed's* status, and sed
  # succeeds on empty input - so an untagged clone produced an empty pkgver
  # and makepkg refused the whole build. Which is the state this repository
  # was in until v0.1.0, and will be again in any shallow clone.
  local desc
  if desc="$(git describe --long --tags --abbrev=7 2>/dev/null)" && [[ -n "$desc" ]]; then
    printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.0.0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$srcdir/$_pkgname"
  # The same step the release workflow runs, so a source build and a downloaded
  # binary are the same binary.
  zig build dist --prefix "$srcdir/out"
}

check() {
  cd "$srcdir/$_pkgname"
  zig build test
}

package() {
  install -Dm755 "$srcdir/out/bin/lgtm" "$pkgdir/usr/bin/lgtm"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
