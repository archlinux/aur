# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3 Flash.
# Upstream: WinterSnowfall <https://github.com/WinterSnowfall/d7vk>

pkgname=d7vk-bin
pkgver=1.11
pkgrel=1
pkgdesc="Vulkan-based D3D7/6/5/3 implementation for Wine (prebuilt ddraw.dll)"
arch=('x86_64')
url="https://github.com/WinterSnowfall/d7vk"
license=('Zlib')
depends=('wine' 'vulkan-icd-loader')
conflicts=('d7vk' 'd7vk-git')
options=('!debug')
source=("d7vk-v${pkgver}.zip::https://github.com/WinterSnowfall/d7vk/releases/download/v${pkgver}/d7vk-v${pkgver}.zip")
sha256sums=('158283fd299ab73bcb38733d31f49c5f7a9187d22ab81f48db881fbd96c969fb')

package() {
    cd "${srcdir}/d7vk-v${pkgver}"

    # Install ddraw.dll to package directory
    install -Dm755 "x32/ddraw.dll" "${pkgdir}/usr/share/d7vk/ddraw.dll"

    # DLL installation script for Wine prefix
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/d7vk-install" << 'EOF'
#!/bin/bash
# Installs d7vk into Wine prefix
# Usage: d7vk-install [prefix path]
# Default: ~/.wine

PREFIX="${1:-$HOME/.wine}"
DLL_DIR="${PREFIX}/drive_c/windows/system32"
REG_FILE=$(mktemp /tmp/d7vk-XXXXXX.reg)

echo "Installing d7vk to prefix: ${PREFIX}"

mkdir -p "${DLL_DIR}"
cp /usr/share/d7vk/ddraw.dll "${DLL_DIR}/ddraw.dll"
echo "  + ddraw.dll copied"

cat > "${REG_FILE}" << 'ENDREG'
REGEDIT4

[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"ddraw"="native,builtin"
ENDREG

WINEPREFIX="${PREFIX}" regedit "${REG_FILE}"
rm -f "${REG_FILE}"
echo "  + DllOverride ddraw=native,builtin registered in registry"
echo ""
echo "Done! Run games through Wine as usual — no extra flags needed."
EOF

    # DLL removal script from Wine prefix
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/d7vk-uninstall" << 'EOF'
#!/bin/bash
# Removes d7vk from Wine prefix
# Usage: d7vk-uninstall [prefix path]
# Default: ~/.wine

PREFIX="${1:-$HOME/.wine}"
DLL_DIR="${PREFIX}/drive_c/windows/system32"
REG_FILE=$(mktemp /tmp/d7vk-XXXXXX.reg)

echo "Removing d7vk from prefix: ${PREFIX}"

rm -f "${DLL_DIR}/ddraw.dll"
echo "  + ddraw.dll removed"

cat > "${REG_FILE}" << 'ENDREG'
REGEDIT4

[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"ddraw"=-
ENDREG

WINEPREFIX="${PREFIX}" regedit "${REG_FILE}"
rm -f "${REG_FILE}"
echo "  + DllOverride ddraw reset"
echo ""
echo "d7vk removed from prefix: ${PREFIX}"
EOF
}
