# Maintainer: Mark K. <markus@sovereign-society.org>
# Maintainer note: this package is updated automatically from annotated tags
# in graf's Forgejo repository via CI.

pkgname=graf
pkgver=0.5.48.alpha.2
pkgrel=1
pkgdesc='Sovereign-native Janus-native version control for operators and agents'
arch=('x86_64')
url='https://git.sovereign-society.org/markus/graf'
license=('custom:LCL-1.0')
depends=('glibc')
makedepends=('bash' 'git' 'janus')
checkdepends=('bash')
provides=('graf')
conflicts=('graf-git')

_upstream_repo='https://git.sovereign-society.org/markus/graf'
_upstream_tag='v0.5.48-alpha.2'

source=("graf-0.5.48.alpha.2.tar.gz::https://git.sovereign-society.org/markus/graf/archive/v0.5.48-alpha.2.tar.gz")
sha256sums=('20d87fc1c878b25b8384f3ba39ca7f11ade06014d4dcd60cd51eed9986c28148')

pkg_source_root() {
    local marker

    marker="$(find "$srcdir" -maxdepth 4 -type f -path '*/src/main.jan' -print -quit 2>/dev/null)"
    if [[ -z "$marker" ]]; then
        return 1
    fi

    printf '%s' "$(dirname "$marker")"
}

build() {
    local graf_root

    graf_root="$(pkg_source_root)"
    if [[ -z "$graf_root" ]]; then
        error 'Unable to locate graf source tree in PKGBUILD source extraction path'
        return 1
    fi

    if ! command -v janus >/dev/null; then
        error 'janus compiler not found in build environment'
        error 'Set build dependency to include janus and ensure it is executable'
        return 1
    fi

    cd "$graf_root"
    JANUS="${JANUS:-$(command -v janus)}" \
        ./scripts/zb build
}

check() {
    local graf_root

    graf_root="$(pkg_source_root)"
    if [[ -z "$graf_root" ]]; then
        error 'Unable to locate graf source tree for check()'
        return 1
    fi

    if [[ -x "$graf_root/zig-out/bin/graf" ]]; then
        "$graf_root/zig-out/bin/graf" help >/dev/null 2>&1 || true
    fi
}

package() {
    local graf_root

    graf_root="$(pkg_source_root)"
    if [[ -z "$graf_root" ]]; then
        error 'Unable to locate graf source tree for package()'
        return 1
    fi

    cd "$graf_root"
    install -Dm755 zig-out/bin/graf "$pkgdir/usr/bin/graf"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    if [[ -f "CLAUDE.md" ]]; then
        install -Dm644 CLAUDE.md "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
    fi

    install -Dm644 docs/agent-native-workflow.md "$pkgdir/usr/share/doc/$pkgname/agent-native-workflow.md"
}
