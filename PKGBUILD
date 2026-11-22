###
 # @Date: 2026-10-18 15:57:46
 # @LastEditors: Wang Xiaomei XianYuPigeon@outlook.com
 # @LastEditTime: 2026-10-18 17:17:42
 # @FilePath: /tempest-desktop-bin/PKGBUILD
### 
# Maintainer: Ganyu_Genshin XianYuPigeon@outlook.com
pkgname=tempest-desktop-bin
pkgver=3.18.1
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
#   QUEf3MxWvAT+Muct+jDLfz8no0m/t2k5iD8NVL0zjBKkSOAlmIkcwNqTPoe3BrOFh2c1yfRJbCP4zkl3WtYuTQ==
sha512sums_x86_64=('41411fdccc56bc04fe32e72dfa30cb7f3f27a349bfb76939883f0d54bd338c12a448e02598891cc0da933e87b706b385876735c9f4496c23f8ce49775ad62e4d')

source_aarch64=("tempest-desktop_${pkgver}_arm64.deb::https://download.gotempest.app/tempest-desktop_${pkgver}_arm64.deb")
# 上游公布值（Base64 格式的 SHA-512）:
#   bp6XYXeY0tl4bj2FMbX/ohZK0BWqK9nHmVLndvxrmWPuIHwkCMpNUJiATOZslKJmh7R+JETGfwQjrrk4viTF8Q==
sha512sums_aarch64=('6e9e97617798d2d9786e3d8531b5ffa2164ad015aa2bd9c79952e776fc6b9963ee207c2408ca4d5098804ce66c94a26687b47e2444c67f0423aeb938be24c5f1')

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