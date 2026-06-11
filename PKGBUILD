# Maintainer: Makar986 <wmakar986@gmail.com>
pkgname=prismlauncher-fixes-additions-bin
_pkgname=PrismLauncher
pkgver=1.0.0
pkgrel=3
options=('!strip' '!debug')
pkgdesc="Prism Launcher with custom fixes and offline-mode bypass (Precompiled-bin)"
arch=('x86_64')
url="https://github.com/Makar986/PrismLauncher-Fixes-Additions"
license=('GPL-3.0-only')

depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-5compat'
    'qt6-imageformats'
    'cmark'
    'libarchive'
    'qrencode'
    'tomlplusplus'
    'zlib'
    'hicolor-icon-theme'
)

optdepends=(
    'java-runtime>=17: Для запуска самого Minecraft (рекомендуется jre17-openjdk или jre21-openjdk)'
)

provides=('prismlauncher')
conflicts=('prismlauncher' 'prismlauncher-git' 'prismlauncher-qt5-bin')

source=("https://github.com/Makar986/PrismLauncher-Fixes-Additions/releases/download/v${pkgver}/PrismLauncher-Linux-Qt6-Portable-v${pkgver}.tar.gz")
sha256sums=('79ca4b959de82228f0b8a9f272f297edcb8c3ac4a0b38a33255cccc06f265cec')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/prismlauncher"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor"

    # 1. Ищем и копируем реальный бинарник во внутреннюю директорию либ
    local bin_path=$(find "${srcdir}" -type f -name "prismlauncher" ! -path "*/pkg/*" | head -n 1)
    if [ -n "$bin_path" ]; then
        install -Dm755 "$bin_path" "${pkgdir}/usr/lib/prismlauncher/prismlauncher"
    else
        echo "ERROR: prismlauncher binary not found!" && exit 1
    fi

    # 2. Ищем родную libcmark.so.0.30.2 в архиве и копируем её рядом с бинарником
    local bundled_cmark=$(find "${srcdir}" -type f -name "libcmark.so.0.30.2" ! -path "*/pkg/*" | head -n 1)
    if [ -n "$bundled_cmark" ]; then
        install -Dm755 "$bundled_cmark" "${pkgdir}/usr/lib/prismlauncher/libcmark.so.0.30.2"
    else
        echo "WARNING: Bundled libcmark.so.0.30.2 not found, attempting fallback symlink..."
        local system_cmark=$(find /usr/lib -name "libcmark.so.*" | head -n 1)
        if [ -n "$system_cmark" ]; then
            ln -sf "$system_cmark" "${pkgdir}/usr/lib/prismlauncher/libcmark.so.0.30.2"
        fi
    fi

    # 3. Создаем bash-скрипт запуска в /usr/bin, который подменяет пути к либам перед стартом
    cat <<EOF > "${pkgdir}/usr/bin/prismlauncher"
#!/bin/sh
export LD_LIBRARY_PATH="/usr/lib/prismlauncher:\$LD_LIBRARY_PATH"
exec /usr/lib/prismlauncher/prismlauncher "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/prismlauncher"

    # 4. Ищем и копируем .desktop файл
    local desktop_file=$(find "${srcdir}" -type f -name "*.desktop" ! -path "*/pkg/*" | head -n 1)
    if [ -n "$desktop_file" ]; then
        install -Dm644 "$desktop_file" "${pkgdir}/usr/share/applications/"
    fi

    # 5. Копируем иконки
    local icons_dir=$(find "${srcdir}" -type d -path "*/icons/hicolor" ! -path "*/pkg/*" | head -n 1)
    if [ -n "$icons_dir" ]; then
        cp -r "$icons_dir/"* "${pkgdir}/usr/share/icons/hicolor/"
    fi
}
