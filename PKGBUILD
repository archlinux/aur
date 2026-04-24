# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3 Flash.
# Upstream: WinterSnowfall <https://github.com/WinterSnowfall/d7vk>

pkgname=d7vk-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Vulkan-based D3D7/6/5/3 implementation for Wine (prebuilt ddraw.dll)"
arch=('x86_64')
url="https://github.com/WinterSnowfall/d7vk"
license=('Zlib')
depends=('wine' 'vulkan-icd-loader')
options=('!debug')
source=("d7vk-v${pkgver}.zip::https://github.com/WinterSnowfall/d7vk/releases/download/v${pkgver}/d7vk-v${pkgver}.zip")
sha256sums=('7081b41eb6d02d76a93781ee8c7b8008a28cec42628f236aa8ed810685f1cb60')

package() {
    cd "${srcdir}/d7vk-v${pkgver}"

    # Кладём ddraw.dll в системную папку пакета
    install -Dm755 "x32/ddraw.dll" "${pkgdir}/usr/share/d7vk/ddraw.dll"

    # Скрипт установки dll в Wine-префикс
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/d7vk-install" << 'EOF'
#!/bin/bash
# Устанавливает d7vk в Wine-префикс
# Использование: d7vk-install [путь к префиксу]
# По умолчанию: ~/.wine

PREFIX="${1:-$HOME/.wine}"
DLL_DIR="${PREFIX}/drive_c/windows/system32"
REG_FILE=$(mktemp /tmp/d7vk-XXXXXX.reg)

echo "Устанавливаем d7vk в префикс: ${PREFIX}"

mkdir -p "${DLL_DIR}"
cp /usr/share/d7vk/ddraw.dll "${DLL_DIR}/ddraw.dll"
echo "  ✓ ddraw.dll скопирована"

cat > "${REG_FILE}" << 'ENDREG'
REGEDIT4

[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"ddraw"="native,builtin"
ENDREG

WINEPREFIX="${PREFIX}" regedit "${REG_FILE}"
rm -f "${REG_FILE}"
echo "  ✓ DllOverride ddraw=native,builtin прописан в реестре"
echo ""
echo "Готово! Запускай игры через Wine как обычно — флаги не нужны."
EOF

    # Скрипт удаления dll из Wine-префикса
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/d7vk-uninstall" << 'EOF'
#!/bin/bash
# Удаляет d7vk из Wine-префикса
# Использование: d7vk-uninstall [путь к префиксу]
# По умолчанию: ~/.wine

PREFIX="${1:-$HOME/.wine}"
DLL_DIR="${PREFIX}/drive_c/windows/system32"
REG_FILE=$(mktemp /tmp/d7vk-XXXXXX.reg)

echo "Удаляем d7vk из префикса: ${PREFIX}"

rm -f "${DLL_DIR}/ddraw.dll"
echo "  ✓ ddraw.dll удалена"

cat > "${REG_FILE}" << 'ENDREG'
REGEDIT4

[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"ddraw"=-
ENDREG

WINEPREFIX="${PREFIX}" regedit "${REG_FILE}"
rm -f "${REG_FILE}"
echo "  ✓ DllOverride ddraw сброшен"
echo ""
echo "d7vk удалён из префикса: ${PREFIX}"
EOF
}
