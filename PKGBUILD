###
 # @Date: 2026-10-18 15:57:46
 # @LastEditors: Wang Xiaomei XianYuPigeon@outlook.com
 # @LastEditTime: 2026-10-18 17:17:42
 # @FilePath: /tempest-desktop-bin/PKGBUILD
### 
# Maintainer: Ganyu_Genshin XianYuPigeon@outlook.com
pkgname=tempest-desktop-bin
pkgver=3.17.4
pkgrel=1
pkgdesc="Cross-platform remote access client for SSH, RDP, VNC, SFTP and K8s (official binary)"
arch=('x86_64' 'aarch64')
url="https://gotempest.app"
license=('LicenseRef-proprietary')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret' 'alsa-lib')
optdepends=('libappindicator-gtk3: system tray icon support')
provides=('tempest-desktop')
conflicts=('tempest-desktop')
options=('!strip' '!debug')
source_x86_64=("tempest-desktop_${pkgver}_amd64.deb::https://download.gotempest.app/tempest-desktop_${pkgver}_amd64.deb")
# 上游公布值（Base64 格式的 SHA-512）:
#   +aaknGy+b2PjhWUZFN1tVcDp3SUV0FPW00kk9vqvi2KRylsD5cYBU7+XVWnmFKD9flpKRcy8fopMewDUr0cIBA==
sha512sums_x86_64=('f9a6a49c6cbe6f63e385651914dd6d55c0e9dd2515d053d6d34924f6faaf8b6291ca5b03e5c60153bf975569e614a0fd7e5a4a45ccbc7e8a4c7b00d4af470804')

source_aarch64=("tempest-desktop_${pkgver}_arm64.deb::https://download.gotempest.app/tempest-desktop_${pkgver}_arm64.deb")
# 上游公布值（Base64 格式的 SHA-512）:
#   i4c/X2foRBDZZfdTI/yq8nUn6WEQWyKLWLsk+cXJ8FOAUNriqIgbU13T7eNDXH3yP8baTUQE9ecJToKwRpC6/Q==
sha512sums_aarch64=('8b873f5f67e84410d965f75323fcaaf27527e961105b228b58bb24f9c5c9f0538050dae2a8881b535dd3ede3435c7df23fc6da4d4404f5e7094e82b04690bafd')

package() {
    # .deb 已在解包阶段由 makepkg 用 bsdtar 展开, 这里只取 data.tar.* 装入 pkgdir
    bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
    # deb 里靠 postinst 建 /usr/bin 软链，Arch 上在打包阶段直接建
    install -d "$pkgdir/usr/bin"
    ln -s /opt/Tempest/tempest-desktop "$pkgdir/usr/bin/tempest-desktop"
    # SPDX LicenseRef-* 标识要求随包附许可证文件, 把上游 bundled 文本装到标准位置
    install -Dm644 "$pkgdir/opt/Tempest/LICENSE.electron.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$pkgdir/opt/Tempest/LICENSES.chromium.html" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}