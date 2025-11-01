pkgname=arrpc-bun
pkgver=1.2.9.r68.gca0852c
pkgrel=1
pkgdesc="TypeScript/Bun port of arRPC - Open Discord RPC server"
arch=('any')
url="https://github.com/Creationsss/arrpc-bun"
license=('MIT')
depends=('bun-bin')
makedepends=('git')
conflicts=('arrpc-bun-bin')
source=("git+https://github.com/Creationsss/arrpc-bun.git"
        "arrpc-bun.service")
sha256sums=('SKIP'
            'f1e20a82f8cb2fa8d5f007511ca78eed8eda44dbe1cef596afb2ec3bf03c66e9')

pkgver() {
    cd "${srcdir}/arrpc-bun"
    printf "%s.r%s.g%s" \
        "$(grep -oP '(?<="version": ")[^"]*' package.json)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/arrpc-bun"

    install -dm755 "${pkgdir}/usr/lib/arrpc-bun"

    cp -r src "${pkgdir}/usr/lib/arrpc-bun/"
    cp -r scripts "${pkgdir}/usr/lib/arrpc-bun/"
    install -Dm644 detectable.json "${pkgdir}/usr/lib/arrpc-bun/detectable.json"
    install -Dm644 detectable_fixes.json "${pkgdir}/usr/lib/arrpc-bun/detectable_fixes.json"
    install -Dm644 package.json "${pkgdir}/usr/lib/arrpc-bun/package.json"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/arrpc-bun" << 'EOF'
#!/bin/bash
exec bun run /usr/lib/arrpc-bun/src/index.ts "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/arrpc-bun"

    install -Dm644 "${srcdir}/arrpc-bun.service" "${pkgdir}/usr/lib/systemd/user/arrpc-bun.service"
}
