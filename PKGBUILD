# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# This recipe used to exist only in the AUR git repository, which made the AUR
# the sole copy of it — nothing here could review it, and a change to this
# project could not travel with the packaging change it needed. arch-repo reads
# it from this branch now and publishes yay-friend-git from it.
#
# pkgrel is arch-repo's, and it overwrites it. pkgver is left to pkgver().
pkgname=yay-friend-git
_pkgname=yay-friend
pkgver=0.6.0.r0.ga3ff03f
pkgrel=1
pkgdesc="Security-focused wrapper around yay that uses Claude Code to analyze AUR PKGBUILDs for security entropy (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/yay-friend"
license=('MIT')
# Go binary is built stripped (-s -w); no debug symbols to package.
options=('!debug')
depends=(
    'git'
    'yay'
)
makedepends=(
    'go>=1.23'
)
# git is deliberately in depends() and not also in makedepends(). namcap warns
# in both directions here: absent, "VCS source PKGBUILD needs additional
# makedepends 'git'"; present in both, "Make dependency (git) already included
# as dependency". depends() alone installs it at build time and is the one that
# builds clean.
optdepends=(
    'claude-code: default AI provider for security analysis (any `claude` CLI on PATH also works)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/aaronsb/yay-friend.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # Derived from the tag rather than a hardcoded base. The 0.1.0 that used to
    # sit here was a number nobody was updating: upstream reported 0.1.0 for its
    # first 42 commits for the same reason.
    local described
    # Captured before the pipe: `git describe | sed || fallback` reads sed's exit
    # status, which is 0 even when git printed nothing, so the fallback would
    # never fire and pkgver would come back empty.
    if described="$(git describe --long --tags 2>/dev/null)" && [[ -n $described ]]; then
        printf "%s" "$described" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$_pkgname"
    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"

    # Upstream's Makefile owns the build flags. This used to keep its own copy of
    # them -- one of four, which is how VERSION stayed pinned at 0.1.0 in some of
    # them and not others. VERSION is passed explicitly because pkgver() computes
    # the -git spelling, which is not what `git describe` alone would give.
    make build \
        VERSION="${pkgver}" \
        GIT_COMMIT="$(git rev-parse --short HEAD)" \
        GOFLAGS="-trimpath -mod=readonly -modcacherw"
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
