# Maintainer: Burgess Leo <liuxiaopeng731@gmail.com>
# Contributor: Zollerboy1 <josef@walterzollerpiano.com> (zed-preview-bin reference)

pkgname=zed-bin
pkgver=1.20.1
pkgrel=1
pkgdesc='A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=('x86_64' 'aarch64')
url='https://zed.dev'
license=('GPL-3.0-or-later' 'AGPL-3.0-or-later' 'Apache-2.0')
depends=('alsa-lib'
         'glib2'
         'glibc'
         'gcc-libs'
         'libx11'
         'libxcb'
         'libxkbcommon'
         'libxkbcommon-x11'
         'vulkan-driver'
         'vulkan-icd-loader'
         'wayland'
         'zlib')
optdepends=('openbsd-netcat: SSH remote development support'
            'clang: improved C/C++ language support'
            'cmake: building C/C++ projects'
            'gopls: improved Go language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support'
            'typescript-language-server: improved TypeScript/JavaScript support'
            'org.freedesktop.secrets: to keep you logged into your Zed account')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" 'zed-git' 'zed-preview-bin')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/zed-industries/zed/releases/download/v${pkgver}/zed-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/zed-industries/zed/releases/download/v${pkgver}/zed-linux-aarch64.tar.gz")

sha256sums_x86_64=('a273674d829d7a536bfc2566967df9eb83718f191242b26d3ebe3a46f36f4de2')
sha256sums_aarch64=('7081248afe9bfd4882482e685f1ffd1bdae7596072d52c959fbee6d976aaf0ba')

package() {
    cd 'zed.app'

    # Fix desktop file: use absolute paths for Icon and Exec
    local desktop='share/applications/dev.zed.Zed.desktop'
    sed -i "s|^Icon=zed$|Icon=/usr/share/icons/zed.png|" "$desktop"
    sed -i "s|^Exec=zed |Exec=/usr/bin/zed |" "$desktop"
    sed -i "s|^TryExec=zed$|TryExec=/usr/bin/zed|" "$desktop"

    # Install CLI launcher (real binary; wrapped below so in-app auto-update
    # is disabled and updates only happen via the package manager, yay -Syu)
    install -Dm755 'bin/zed' "${pkgdir}/usr/bin/zed.real"

    # Wrapper: the editor reads ZED_UPDATE_EXPLANATION at startup and skips
    # its own update polling/installs when it is set (see auto_update crate).
    cat > "${pkgdir}/usr/bin/zed" <<'EOF'
#!/bin/sh
export ZED_UPDATE_EXPLANATION='Updates are handled by your package manager'
exec /usr/bin/zed.real "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/zed"

    # Install main editor binary (CLI looks for ../lib/zed/zed-editor)
    install -Dm755 'libexec/zed-editor' "${pkgdir}/usr/lib/zed/zed-editor"

    # Install desktop file
    install -Dm644 "$desktop" "${pkgdir}/usr/share/applications/dev.zed.Zed.desktop"

    # Install icon
    install -Dm644 'share/icons/hicolor/512x512/apps/zed.png' \
        "${pkgdir}/usr/share/icons/zed.png"

    # Install licenses
    install -Dm644 'licenses.md' \
        "${pkgdir}/usr/share/licenses/${pkgname%-bin}/licenses.md"
}
