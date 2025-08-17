# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=mutn
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple, self-hosted, SSH-synchronized password/note manager for the CLI (based on libmutton)'
arch=('x86_64' 'i686' 'i486' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/rwinkhart/MUTN'
license=('MIT')
depends=()
makedepends=(go grep gzip)
optdepends=(
    'wl-clipboard: Wayland clipboard support'
    'xclip: X11 clipboard support'
    'bash-completion: Bash completion support'
)
source=("git+https://github.com/rwinkhart/MUTN.git#tag=v${pkgver}")
sha512sums=(SKIP)

build() {
    cd ${srcdir}/MUTN

    # compress man page
    gzip -kf ./docs/man

    # determine microarchitecture feature level
    case $CARCH in
        'x86_64')
            cpuFlags=$(grep -E 'flags\s+:\s' /proc/cpuinfo)
            if [ ! -z "$(grep 'avx512f' <<< "$cpuFlags")" ]; then
                export GOAMD64=v4
            elif [ ! -z "$(grep 'avx2' <<< "$cpuFlags")" ]; then
                export GOAMD64=v3
            elif [ ! -z "$(grep 'sse4_2' <<< "$cpuFlags")" ]; then
                export GOAMD64=v2
            else
                export GOAMD64=v1
            fi
            ;;
        # TODO check aarch64 feature level
    esac

    # compile binary
    CGO_ENABLED=1 go build -ldflags="-s -w" -trimpath -tags=stxAll ./mutn.go
}

package() {
    cd ${srcdir}/MUTN
    install -Dm755 ./mutn ${pkgdir}/usr/bin/mutn
    install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/mutn/LICENSE
    install -Dm644 ./completions/zsh/_mutn ${pkgdir}/usr/share/zsh/site-functions/_mutn
    install -Dm644 ./completions/bash/mutn ${pkgdir}/usr/share/bash-completion/completions/mutn
    install -Dm644 ./docs/man.gz ${pkgdir}/usr/share/man/man1/mutn.1.gz
}
