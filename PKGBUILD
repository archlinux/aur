###
 # @Date: 2026-10-18 15:57:46
 # @LastEditors: Wang Xiaomei XianYuPigeon@outlook.com
 # @LastEditTime: 2026-10-18 16:09:00
 # @FilePath: /tempest-desktop/PKGBUILD
### 
# Maintainer: Ganyu_Genshin XianYuPigeon@outlook.com
pkgname=tempest-desktop-bin
pkgver=3.17.2
pkgrel=1
pkgdesc="The all-platform terminal emulator for the modern age (official binary release)"
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
#   fyjXx4g0T//rUclVJKQwPM3xFv5n0ho8NN2b887sYdVmbBzn+TJX15iYici8Bk6fn8qNU/x1C46C5eTDsDnVNQ==
sha512sums_x86_64=('7f28d7c788344fffeb51c95524a4303ccdf116fe67d21a3c34dd9bf3ceec61d5666c1ce7f93257d7989889c8bc064e9f9fca8d53fc750b8e82e5e4c3b039d535')

source_aarch64=("tempest-desktop_${pkgver}_arm64.deb::https://download.gotempest.app/tempest-desktop_${pkgver}_arm64.deb")
# 上游公布值（Base64 格式的 SHA-512）:
#   qpFgkpmdJ9OOcm1NZTzWV5k3wQ5JtJkQqSsVzu9XjWmLAlgpfqQAP7kMcMK2C5gtxIhAoi0VAeDLnctT+XA8Qw==
sha512sums_aarch64=('aa916092999d27d38e726d4d653cd6579937c10e49b49910a92b15ceef578d698b0258297ea4003fb90c70c2b60b982dc48840a22d1501e0cb9dcb53f9703c43')

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