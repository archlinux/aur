# Maintainer: JBetchGH <JBetchGH@users.noreply.github.com>
#
# Build-from-source AUR package. Mirrors the `make all && make manpages
# && make completions` flow exactly; produces both mtroamd and mtroam
# in a single pkg.
#
# Pre-1.0: pkgver tracks the upstream git tag. Bump pkgrel when only
# this PKGBUILD changes (packaging fix, layout tweak); bump pkgver for
# upstream releases.

pkgname=mtroamd
pkgver=1.7.6
pkgrel=1
pkgdesc="Persistent terminal daemon over QUIC - like mosh+tmux in one daemon, with multi-client handoff"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AG-Studio-Apps/mtroamd"
license=('AGPL-3.0-or-later')
makedepends=('go>=1.26' 'git' 'pandoc')
conflicts=('mtroamd-bin')
provides=("mtroamd=${pkgver}" "mtroam=${pkgver}")
source=("git+https://github.com/AG-Studio-Apps/mtroamd.git#tag=v${pkgver}")
sha256sums=('SKIP')  # git tag; integrity rests on the tag's signature when present

build() {
    cd "${srcdir}/${pkgname}"
    make build build-mtroam manpages completions
}

check() {
    cd "${srcdir}/${pkgname}"
    # Plain test run, NOT `make test` (which adds -race): the race
    # detector is upstream CI's gate; on the user's machine it needs
    # cgo and roughly doubles test runtime without adding install-
    # validation value.
    #
    # Container note: through v1.4.11, one transport test asserts
    # that unprivileged low-port binds fail, which is untrue inside
    # Docker (ip_unprivileged_port_start=0) — building this package
    # in a container needs `--sysctl net.ipv4.ip_unprivileged_port_start=1024`
    # (or `makepkg --nocheck`). Fixed upstream after v1.4.11; real
    # Arch hosts are unaffected.
    go test ./... -count=1
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 mtroamd "${pkgdir}/usr/bin/mtroamd"
    install -Dm755 mtroam     "${pkgdir}/usr/bin/mtroam"

    # systemd-user unit. Generated from the daemon binary itself so
    # the file always matches what `mtroamd unit print` emits —
    # avoids drift between this PKGBUILD and the in-tree template.
    # Lands under /usr/lib/systemd/user/ where systemd-user finds
    # vendor-shipped units; an `ExecStart=%h/.local/bin/mtroamd` is
    # rewritten to `/usr/bin/mtroamd` for the distro install path.
    ./mtroamd unit print --bin=/usr/bin/mtroamd > mtroamd.service
    install -Dm644 mtroamd.service "${pkgdir}/usr/lib/systemd/user/mtroamd.service"

    # Man pages.
    install -Dm644 dist/man/mtroamd.8 "${pkgdir}/usr/share/man/man8/mtroamd.8"
    install -Dm644 dist/man/mtroam.1     "${pkgdir}/usr/share/man/man1/mtroam.1"

    # Shell completions.
    install -Dm644 dist/completions/mtroamd.bash "${pkgdir}/usr/share/bash-completion/completions/mtroamd"
    install -Dm644 dist/completions/mtroam.bash     "${pkgdir}/usr/share/bash-completion/completions/mtroam"
    install -Dm644 dist/completions/mtroamd.zsh  "${pkgdir}/usr/share/zsh/site-functions/_mtroamd"
    install -Dm644 dist/completions/mtroam.zsh      "${pkgdir}/usr/share/zsh/site-functions/_mtroam"
    install -Dm644 dist/completions/mtroamd.fish "${pkgdir}/usr/share/fish/vendor_completions.d/mtroamd.fish"
    install -Dm644 dist/completions/mtroam.fish     "${pkgdir}/usr/share/fish/vendor_completions.d/mtroam.fish"

    # Documentation.
    install -Dm644 README.md           "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/SECURITY.md    "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 docs/mtroam.md       "${pkgdir}/usr/share/doc/${pkgname}/mtroam.md"
    install -Dm644 docs/mtroam-protocol.md "${pkgdir}/usr/share/doc/${pkgname}/mtroam-protocol.md"

    # License.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
