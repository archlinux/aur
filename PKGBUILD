# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=grubforge
pkgver=1.0.2
pkgrel=1
pkgdesc="A terminal UI for managing and customizing the GRUB bootloader — safely, intuitively, and beautifully"
arch=('any')
url="https://github.com/jetomev/grubforge"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('941a3f2d7f2b554bec89becd843fb5008fcbbd0270f0ec25db27e23576c4fdce')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Smoke test: import the main app module. Catches Textual API breaks
    # like the v1.0.1 F16 bug (Static.Clicked removed in Textual 8.x) at
    # build time so we never ship an unimportable package again. Added in
    # v1.0.2 alongside the events.Click migration that closed GitHub Issue #1.
    python -c "import sys; sys.path.insert(0, '.'); from grubforge.app import GrubForgeApp; print('grubforge.app imports OK')"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the Python package
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r grubforge "${pkgdir}/usr/lib/${pkgname}/"
    cp main.py "${pkgdir}/usr/lib/${pkgname}/"

    # Install the launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python /usr/lib/grubforge/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install the man page
    install -Dm644 grubforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install the license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
