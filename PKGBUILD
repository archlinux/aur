# Maintainer: Josef Zoller <josef@walterzollerpiano.com>
pkgname=zed-preview-bin
pkgver=0.141.2
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter"
arch=('x86_64' 'aarch64')
url="https://zed.dev"
license=('GPL-3.0-or-later' 'AGPL-3.0-or-later' 'Apache-2.0')
depends=('alsa-lib' 'libasound.so'
         'fontconfig'
         'gcc-libs'
         'glibc'
         'libxcb'
         'libxkbcommon'
         'libxkbcommon-x11'
         'openssl'
         'sqlite'
         'vulkan-driver'
         'vulkan-icd-loader'
         'vulkan-tools'
         'wayland'
         'zlib' 'libz.so')
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'rust-analyzer: improved Rust language support')
provides=("${pkgname%-preview-bin}=$pkgver")
conflicts=("${pkgname%-preview-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/api/releases/preview/$pkgver/zed-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/api/releases/preview/$pkgver/zed-linux-aarch64.tar.gz")
sha256sums_x86_64=('cacaf908c09ce6cdf85ee81ad32e4a7d20e97ddcc04b8d821ecdc7fc6e02e471')
sha256sums_aarch64=('d0fa4c294ae645bfc25bb91f7da3769a17e776a60e6dc8e19774e20f5a9b605f')

package() {
    cd zed-preview.app

    desktop_file_path='share/applications/zed-preview.desktop'

    sed -i "s|Icon=zed|Icon=/usr/share/icons/${pkgname%-preview-bin}.png|g" "$desktop_file_path"
    sed -i "s|Exec=zed|Exec=/usr/libexec/zed-editor|g" "$desktop_file_path"

    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/libexec" # Unfortunately, the cli expects the main binary to be in libexec
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/licenses/${pkgname%-preview-bin}"
    install -d "$pkgdir/usr/share/icons"

    install -Dm755 "bin/zed" "$pkgdir/usr/bin/zeditor"
    install -Dm755 "libexec/zed-editor" "$pkgdir/usr/libexec/zed-editor"

    install -Dm644 "$desktop_file_path" "$pkgdir/usr/share/applications/dev.zed.Zed-Preview.desktop"

    install -Dm644 "licenses.md" "$pkgdir/usr/share/licenses/${pkgname%-preview-bin}/licenses.md"

    install -Dm644 "share/icons/hicolor/512x512/apps/zed.png" "$pkgdir/usr/share/icons/${pkgname%-preview-bin}.png"
}
