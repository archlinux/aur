###
 # @Date: 2026-10-18 15:57:46
 # @LastEditors: Wang Xiaomei XianYuPigeon@outlook.com
 # @LastEditTime: 2026-10-18 17:17:42
 # @FilePath: /tempest-desktop-bin/PKGBUILD
### 
# Maintainer: Ganyu_Genshin XianYuPigeon@outlook.com
pkgname=tempest-desktop-bin
pkgver=3.17.5
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
#   ZpdzhxbNCkgEp3fW6ivkE+ENyC1IeNVUqmQXFREtztlCaB0j58kcdwz8OecD9gSLpL1/nexOlarLm0BWpwSxOg==
sha512sums_x86_64=('6697738716cd0a4804a777d6ea2be413e10dc82d4878d554aa641715112dced942681d23e7c91c770cfc39e703f6048ba4bd7f9dec4e95aacb9b4056a704b13a')

source_aarch64=("tempest-desktop_${pkgver}_arm64.deb::https://download.gotempest.app/tempest-desktop_${pkgver}_arm64.deb")
# 上游公布值（Base64 格式的 SHA-512）:
#   qaGxYB5ZlUoYMO8VlQInJn2ui8RpMsbsXXctqXkTgnWghl00lMJRfgvsd59Uw+HMr3vCj2lM4c4LEuQgsPTilA==
sha512sums_aarch64=('a9a1b1601e59954a1830ef15950227267dae8bc46932c6ec5d772da979138275a0865d3494c2517e0bec779f54c3e1ccaf7bc28f694ce1ce0b12e420b0f4e294')

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