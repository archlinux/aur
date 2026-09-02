# Maintainer: Mark K. <markus@sovereign-society.org>
# Maintainer note: this package is updated automatically from annotated tags
# in graf's Forgejo repository via CI.

pkgname=graf
pkgver=0.8.0.alpha
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

_upstream_repo='https://git.sovereign-society.org/graf-vcs/graf'
_upstream_tag='v0.8.0-alpha'

source=("graf-0.8.0.alpha.tar.gz::https://git.sovereign-society.org/graf-vcs/graf/archive/v0.8.0-alpha.tar.gz")
sha256sums=('e1c6d8b8b0b1bedf31ff379f4f28281b295729e6aadd6bc09c6f7b4fbffc073b')

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
