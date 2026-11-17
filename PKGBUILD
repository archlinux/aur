# Maintainer: yougg <joe2qq@gmail.com>

_pkgname=kate
pkgname=kate-bin
_branch=26.12
_build=12935
pkgver=${_branch}.${_build}
pkgrel=1
pkgdesc="Advanced text editor (KDE CI AppImage binary release)"
arch=('x86_64')
url="https://apps.kde.org/kate/"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=(
    'bash'
    'dbus'
    'fontconfig'
    'freetype2'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'libglvnd'
    'libx11'
    'libxcb'
    'zlib'
)
optdepends=(
    'bash-language-server: Bash LSP support'
    'clang: C and C++ LSP support'
    'git: git-blame plugin'
    'gopls: GO LSP support'
    'konsole: open a terminal in Kate'
    'lua-language-server: LUA LSP support'
    'marksman: Markdown LSP support'
    'python-lsp-server: Python LSP support'
    'rust-analyzer: Rust LSP support'
    'typescript-language-server: JavaScript LSP support'
    'yaml-language-server: YAML LSP support'
    'zls: Zig LSP support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_appimage="kate-release_${_branch}-${_build}-linux-gcc-x86_64.AppImage"
source=("https://cdn.kde.org/ci-builds/utilities/kate/release-${_branch}/linux/${_appimage}")
noextract=("${_appimage}")
sha256sums=('89181469328a09ff77fb97c2439e834b414cb5ad0f872af16d2bd59d2018689b')

prepare() {
    cd "${srcdir}"
    rm -rf squashfs-root
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract >/dev/null
}

package() {
    cd "${srcdir}/squashfs-root"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a . "${pkgdir}/opt/${pkgname}/"

    chmod -R a+rX "${pkgdir}/opt/${pkgname}"

    # 创建启动包装脚本到 /usr/bin/kate（AppRun 使用 dirname "$0"，直接软链接会导致路径解析到 /usr/bin）
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/sh
exec "/opt/${pkgname}/AppRun" "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "org.kde.kate.desktop" \
        "${pkgdir}/usr/share/applications/org.kde.kate.desktop"

    local icon_path
    while IFS= read -r -d '' icon_path; do
        local rel_path="${icon_path#./usr/share/icons/hicolor/}"
        install -Dm644 "${icon_path}" \
            "${pkgdir}/usr/share/icons/hicolor/${rel_path}"
    done < <(find ./usr/share/icons/hicolor -type f -name "kate.*" -print0)
}
