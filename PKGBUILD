# Maintainer: reimunyancat <reimunyancat@gmail.com>
pkgname=badapple-ascii-git
pkgver=r27.68bfda6
pkgrel=1
pkgdesc="Bad Apple!! ASCII art player for terminal with synchronized audio playback"
arch=('x86_64')
url="https://github.com/reimunyancat/badapple-with-ascii"
license=('MIT')
depends=('sfml' 'bash')
makedepends=('git')
provides=('badapple')
conflicts=('badapple')
source=("git+https://github.com/reimunyancat/badapple-with-ascii.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/badapple-with-ascii"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/badapple-with-ascii"
    g++ -std=c++17 -O2 main.cpp -o badapple-ascii -lsfml-audio -lsfml-system
}

package() {
    cd "${srcdir}/badapple-with-ascii"
    local _share="${pkgdir}/usr/share/badapple-with-ascii"

    install -Dm755 badapple-ascii "${_share}/badapple-ascii"
    install -Dm644 bad_apple.mp3 "${_share}/bad_apple.mp3"
    cp -r BA_frame "${_share}/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/badapple" <<'EOF'
#!/bin/bash
cd /usr/share/badapple-with-ascii
exec ./badapple-ascii "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/badapple"
}
