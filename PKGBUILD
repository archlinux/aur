pkgname=ti-evo-tools
pkgver=0.1.0
pkgrel=2

pkgdesc='Native Qt/Kirigami tools for working with TI-84 Evo calculators over USB'
arch=('x86_64')
url='https://github.com/The-Real-NomadTax/TI-84-Evo-tools'
license=('MIT')

depends=(
    'gcc-libs'
    'glibc'
    'kirigami'
    'libusb'
    'qt6-base'
    'qt6-declarative'
)

makedepends=(
    'cargo'
    'cmake'
    'lld'
    'pkgconf'
)

options=('!lto')

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/The-Real-NomadTax/TI-84-Evo-tools/b660dc16bf001c412506168b29e2296e080e595b/LICENSE"
)

sha256sums=(
    'SKIP'
    'SKIP'
)

prepare() {
    cd "TI-84-Evo-tools-${pkgver}"

    cargo fetch --locked
}

build() {
    cd "TI-84-Evo-tools-${pkgver}"

    export QMAKE=/usr/bin/qmake6
    export CARGO_TARGET_DIR="${srcdir}/target"

    cargo build \
        --release \
        --frozen
}

package() {
    cd "TI-84-Evo-tools-${pkgver}"

    # Main application
    install -Dm755 \
        "${srcdir}/target/release/ti-evo-tools" \
        "${pkgdir}/usr/bin/ti-evo-tools"

    # MIT license
    install -Dm644 \
        "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Desktop entry
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/ti-evo-tools.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=TI-84 Evo Tools
GenericName=TI Calculator Utility
Comment=Manage and interact with a TI-84 Evo over USB
Exec=ti-evo-tools
Icon=accessories-calculator
Terminal=false
StartupNotify=true
Categories=Utility;Education;
Keywords=TI;TI-84;TI-84 Evo;Evo;Calculator;USB;
EOF

    # TI-84 Evo USB permissions
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/lib/udev/rules.d/70-ti-84-evo-tools.rules" <<'EOF'
# Texas Instruments TI-84 Evo
SUBSYSTEM=="usb", ATTR{idVendor}=="0451", ATTR{idProduct}=="e018", TAG+="uaccess"
EOF
}
