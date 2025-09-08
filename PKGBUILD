# Maintainer: Aaron Roque Fonseca <aaronroquefonseca@gmail.com>
pkgname=orca-slicer-flatpak-bin
pkgver=0.0.1      # dummy, replaced dynamically
pkgrel=1
pkgdesc="OrcaSlicer Flatpak package tracking the latest stable release"
arch=('x86_64' 'aarch64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('custom')
depends=('flatpak' 'wget' 'jq')
makedepends=()
options=()
source=()
sha256sums=()

# Dynamically detect the latest stable release tag
pkgver() {
    curl -s https://api.github.com/repos/SoftFever/OrcaSlicer/releases/latest \
    | jq -r '.tag_name' | sed 's/^v//'
}

prepare() {
    # Detect system architecture
    case "$(uname -m)" in
        x86_64) ARCH="x86_64" ;;
        aarch64) ARCH="aarch64" ;;
        *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
    esac

    # Get the latest stable version
    VERSION=$(pkgver)

    # Construct the correct Flatpak URL
    FLATPAK_URL="https://github.com/SoftFever/OrcaSlicer/releases/download/v${VERSION}/OrcaSlicer-Linux-flatpak_V${VERSION}_${ARCH}.flatpak"

    echo "Downloading OrcaSlicer Flatpak from $FLATPAK_URL"
    wget -O "$srcdir/OrcaSlicer-Latest.flatpak" "$FLATPAK_URL"
}

package() {
    # Install/reinstall non-interactively
    flatpak install --reinstall --user --assumeyes "$srcdir/OrcaSlicer-Latest.flatpak"
}

