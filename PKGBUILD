# Maintainer: D7OM <hello@d7om.dev>

pkgname=keyvis
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple and lightweight keystroke visualisation tool"
arch=('any')
url="https://github.com/d7omdev/keyvis"
license=('MIT')
depends=('gjs' 'gtk4' 'gtk4-layer-shell' 'keyd')
makedepends=('git' 'bun')
optdepends=('ttf-nerd-fonts-symbols: icons for keys like Backspace, Enter and the arrows')
provides=('keyvis')
conflicts=('keyvis')
source=("git+https://github.com/d7omdev/keyvis.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/keyvis"
    bun install --frozen-lockfile
    bun run build:app
}

package() {
    cd "${srcdir}/keyvis"

    install -Dm644 dist/main.js "${pkgdir}/usr/lib/keyvis/main.js"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # gtk4-layer-shell must be preloaded before GTK touches Wayland
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/keyvis" <<'EOF'
#!/usr/bin/env bash

export LD_PRELOAD="/usr/lib/libgtk4-layer-shell.so${LD_PRELOAD:+:$LD_PRELOAD}"

if [ $# -eq 0 ]; then
    gjs -m /usr/lib/keyvis/main.js > /dev/null 2>&1 &
else
    exec gjs -m /usr/lib/keyvis/main.js "$@"
fi
EOF
}
