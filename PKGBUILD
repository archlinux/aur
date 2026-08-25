# Maintainer: Your Name <your.email@example.com>
# Adapted for LTspice 17 (Legacy) to run alongside newer LTspice versions

pkgname=ltspice-17
pkgver=17.1.15
pkgrel=1
pkgdesc="SPICE simulator, schematic capture and waveform viewer (Legacy Version 17)."
arch=('x86_64')
url="https://www.analog.com/en/resources/design-tools-and-calculators/ltspice-simulator.html"
license=('LicenseRef-LTspice')
depends=('wine')
optdepends=('xdg-utils: for launching HTML help files')
makedepends=('gawk' 'curl' 'icoutils' 'imagemagick' 'wine')

source=("${pkgname}.sh"
        "${pkgname}-help.sh"
        "conv.sh"
        "${pkgname}.desktop"
        "LTspice64-${pkgver}.exe::https://ltspice.analog.com/software/LTspice64.exe"
       )

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

options=(!strip)

prepare() {
    cd "${srcdir}"
    # Clean up any leftover temporary prefixes from failed builds
    rm -rf "wine-tmp" "extracted"
}

build() {
    cd "${srcdir}"

    echo "==> Creating temporary Wine prefix to extract files..."
    export WINEPREFIX="${srcdir}/wine-tmp"
    export WINEARCH=win64
    export WINEDEBUG=-all
    export WINEDLLOVERRIDES="winemenubuilder.exe=d"

    mkdir -p "$WINEPREFIX"

    echo "==> Running LTspice installer (this may pop up a window briefly)..."
    # Using /S to attempt a silent install. If a window pops up, simply click 'Accept/Install'.
    wine "LTspice64-${pkgver}.exe" /S

    # Wait for the installer and all background Wine processes to fully close
    wineserver -w

    echo "==> Locating extracted files..."
    # The installer puts files dynamically. We find XVIIx64.exe to know exactly where it went.
    local _exepath=$(find "$WINEPREFIX" -name "XVIIx64.exe" 2>/dev/null | head -n 1)
    if [ -z "$_exepath" ]; then
        echo "Error: XVIIx64.exe was not found. The installation failed."
        exit 1
    fi

    local _installdir=$(dirname "$_exepath")
    echo "==> Found program files in $_installdir"

    # Copy them to a staging folder
    mkdir -p "${srcdir}/extracted"
    cp -r "$_installdir"/* "${srcdir}/extracted/"

    echo "==> Extracting icon..."
    local _exename="${srcdir}/extracted/XVIIx64.exe"
    if [ -f "$_exename" ]; then
        wrestool -x -t 14 "$_exename" > "${pkgname}.ico"
        magick "${pkgname}.ico" "${pkgname}.png"
    fi

    # Tweak mixed-case hyperlinks in help docs if the folder exists
    if [ -d "${srcdir}/extracted/LTspiceHelp" ]; then
        cd "${srcdir}/extracted/LTspiceHelp"
        echo "==> Adjusting help files..."
        sh "${srcdir}/conv.sh"
    fi
}

package(){
    # 1. Install Desktop file and generated icon (from srcdir)
    cd "${srcdir}"
    if [ -f "${pkgname}.png" ]; then
        install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    fi
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install wrapper scripts
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${pkgname}-help.sh" "${pkgdir}/usr/bin/${pkgname}-help"

    # 2. Install application files (from our extracted staging folder)
    cd "${srcdir}/extracted"

    if [ -f "License.txt" ]; then
        install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi

    bin_destdir="${pkgdir}/usr/share/${pkgname}"
    install -m755 -d "${bin_destdir}"

    install -m755 *.exe "${bin_destdir}" 2>/dev/null || true
    install -m644 *.dll "${bin_destdir}" 2>/dev/null || true
    install -m644 *.zip "${bin_destdir}" 2>/dev/null || true

    if [ -d "LTspiceHelp" ]; then
        install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
        cp -r LTspiceHelp/* "${pkgdir}/usr/share/doc/${pkgname}"
        ln -sv "/usr/share/doc/${pkgname}" "${bin_destdir}/LTspiceHelp"
    fi
}
