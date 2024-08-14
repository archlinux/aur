# Maintainer: libook <libook7@gmail.com>
pkgname=net-ssr
pkgver=0.3.4
pkgrel=1
pkgdesc="Network Secondary Surveillance Radar"
arch=('x86_64' 'aarch64')
url="https://github.com/libook/net-ssr"
license=('GPL3')
makedepends=('rustup')
source=("git+https://github.com/libook/net-ssr.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    # Determine the target based on the architecture
    local _target=""
    case "${CARCH}" in
        x86_64)
            _target="x86_64-unknown-linux-gnu"
            ;;
        aarch64)
            _target="aarch64-unknown-linux-gnu"
            ;;
        *)
            echo "Unsupported architecture: ${CARCH}"
            return 1
            ;;
    esac

    # Run the build script with the target
    ./scripts/build.sh ${_target}
}

package() {
    cd "${srcdir}/${pkgname}"

    # Determine the target based on the architecture
    local _target=""
    case "${CARCH}" in
        x86_64)
            _target="x86_64-unknown-linux-gnu"
            ;;
        aarch64)
            _target="aarch64-unknown-linux-gnu"
            ;;
        *)
            echo "Unsupported architecture: ${CARCH}"
            return 1
            ;;
    esac

    # Install the binaries
    install -Dm755 "target/${_target}/release/interrogator" "${pkgdir}/usr/bin/interrogator"
    install -Dm755 "target/${_target}/release/transponder" "${pkgdir}/usr/bin/transponder"

    # Install man pages
    install -Dm644 "man/interrogator.1" "${pkgdir}/usr/share/man/man1/interrogator.1"
    install -Dm644 "man/transponder.1" "${pkgdir}/usr/share/man/man1/transponder.1"

    # Install Systemd service
    install -Dm644 "systemd/transponder.service" "${pkgdir}/usr/lib/systemd/system/transponder.service"

    # Install shell completions
    install -Dm644 "completions/_interrogator" "${pkgdir}/usr/share/zsh/site-functions/_interrogator"
    install -Dm644 "completions/interrogator.bash" "${pkgdir}/usr/share/bash-completion/completions/interrogator"
    install -Dm644 "completions/interrogator.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/interrogator.fish"

    install -Dm644 "completions/_transponder" "${pkgdir}/usr/share/zsh/site-functions/_transponder"
    install -Dm644 "completions/transponder.bash" "${pkgdir}/usr/share/bash-completion/completions/transponder"
    install -Dm644 "completions/transponder.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/transponder.fish"
}
