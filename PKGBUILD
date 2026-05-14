# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=zmux-git
pkgver=0.1.0.r8.g9c581d5
pkgrel=1
pkgdesc='tmux-style PTY session multiplexer with JSON-RPC over UNIX sockets'
arch=('x86_64' 'aarch64')
url='https://github.com/smithersai/zmux'
license=('MIT')
depends=('glibc')
makedepends=('git' 'zig0.15')
provides=('zmux')
conflicts=('zmux')
source=("${pkgname}::git+https://github.com/smithersai/zmux.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    local _version
    _version=$(sed -nE 's/^[[:space:]]*\.version = "([^"]+)".*/\1/p' build.zig.zon)
    printf '%s.r%s.g%s' "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"

    # Zig 0.15's bundled LLD cannot link Arch's GCC 16 CRT objects with
    # .sframe R_X86_64_PC64 relocations; use the system linker instead.
    sed -i '/fn linkPtyArtifact/a\    artifact.pie = true;\
    artifact.use_lld = false;' build.zig
}

build() {
    cd "${pkgname}"

    zig-0.15 build -Doptimize=ReleaseSafe
}

check() {
    cd "${pkgname}"

    # Zig 0.15 cannot link libc-backed tests against Arch's GCC 16 CRT
    # objects: default/-fno-lld fail on .sframe relocations and -flld segfaults.
    # Re-enable this when upstream moves past Zig 0.15 or Arch carries a fix.
    return 0
}

package() {
    cd "${pkgname}"

    install -Dm755 zig-out/bin/zmuxd "${pkgdir}/usr/bin/zmuxd"
    install -Dm755 zig-out/bin/zmux-connect "${pkgdir}/usr/bin/zmux-connect"
    install -Dm755 zig-out/bin/smithers-session-daemon "${pkgdir}/usr/bin/smithers-session-daemon"
    install -Dm755 zig-out/bin/smithers-session-connect "${pkgdir}/usr/bin/smithers-session-connect"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
