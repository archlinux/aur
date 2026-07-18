# Maintainer: Glass Alarm Developer
# Contributor: Arch Linux User

pkgname=lumalarm
pkgver=1.0.0
pkgrel=1
pkgdesc="A professional glassmorphism alarm clock for Linux with rtcwake support"
arch=('x86_64' 'aarch64')
url="https://github.com/shinigami1231111/lumalarm"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-multimedia'
    'qt6-declarative'
    'qt6-quickcontrols2'
    'util-linux'
)
makedepends=(
    'cmake'
    'gcc'
    'qt6-tools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shinigami1231111/lumalarm/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS="-O2 -pipe -march=x86-64 -mtune=generic"
    cmake --build build -j$(nproc)
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "${pkgdir}/usr/share/${pkgname}/tones"

    install -Dm644 resources/lumalarm.desktop "${pkgdir}/usr/share/applications/lumalarm.desktop"

    install -d "${pkgdir}/etc/sudoers.d"

    echo "# Lumalarm: Allow rtcwake without password" > "${pkgdir}/etc/sudoers.d/lumalarm"
    echo "%wheel ALL=(ALL) NOPASSWD: /usr/bin/rtcwake" >> "${pkgdir}/etc/sudoers.d/lumalarm"
    chmod 440 "${pkgdir}/etc/sudoers.d/lumalarm"
}

post_install() {
    echo "=== Lumalarm - Post-Install Setup ==="
    echo ""
    echo "1. Config directory (auto-created on first run):"
    echo "   ~/.config/lumalarm/tones"
    echo ""
    echo "2. Place custom alarm tones (WAV/MP3) in:"
    echo "   ~/.config/lumalarm/tones/"
    echo ""
    echo "3. For rtcwake (system wake from suspend):"
    echo "   The PKGBUILD installs a sudoers rule allowing rtcwake without password."
    echo "   If you need to set it manually:"
    echo "   echo 'YOUR_USERNAME ALL=(ALL) NOPASSWD: /usr/bin/rtcwake' | sudo tee /etc/sudoers.d/lumalarm"
    echo "   sudo chmod 440 /etc/sudoers.d/lumalarm"
    echo ""
    echo "4. Run the application:"
    echo "   lumalarm"
}