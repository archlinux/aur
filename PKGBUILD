# Maintainer: shinigami1231111
# Contributor: Arch Linux User

pkgname=lumalarm
pkgver=1.0.0
pkgrel=1
pkgdesc="A glassmorphism alarm clock for Linux with rtcwake suspend support"
arch=('x86_64' 'aarch64')
url="https://github.com/shinigami1231111/lumalarm"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-multimedia'
    'qt6-declarative'
    'util-linux'
)
makedepends=(
    'cmake'
    'gcc'
    'qt6-tools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shinigami1231111/lumalarm/archive/v${pkgver}.tar.gz")
sha256sums=('0e33be0ae2f51962e11ff05ad4f465b4d2acf02cfee45135e78bbc16f2798df0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 resources/lumalarm.desktop "${pkgdir}/usr/share/applications/lumalarm.desktop"

    install -d "${pkgdir}/etc/sudoers.d"

    echo "# Lumalarm: Allow rtcwake without password" > "${pkgdir}/etc/sudoers.d/lumalarm"
    echo "%wheel ALL=(ALL) NOPASSWD: /usr/bin/rtcwake" >> "${pkgdir}/etc/sudoers.d/lumalarm"
    chmod 440 "${pkgdir}/etc/sudoers.d/lumalarm"
}

post_install() {
    echo "=== Lumalarm - Post-Install Setup ==="
    echo ""
    echo "1. Custom alarm tones go in:"
    echo "   ~/.config/lumalarm/tones/"
    echo ""
    echo "2. For rtcwake passwordless suspend, add to sudoers:"
    echo "   echo 'YOUR_USERNAME ALL=(ALL) NOPASSWD: /usr/bin/rtcwake' | sudo tee /etc/sudoers.d/lumalarm"
    echo "   sudo chmod 440 /etc/sudoers.d/lumalarm"
    echo ""
    echo "3. Run: lumalarm"
}
