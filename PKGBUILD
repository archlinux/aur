###
 # @Date: 2026-10-18 15:57:46
 # @LastEditors: Wang Xiaomei XianYuPigeon@outlook.com
 # @LastEditTime: 2026-10-18 17:17:42
 # @FilePath: /tempest-desktop-bin/PKGBUILD
### 
# Maintainer: Ganyu_Genshin XianYuPigeon@outlook.com
pkgname=tempest-desktop-bin
pkgver=3.18.0
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
#   8dXF3GQj3O4dPmy/xsSqOGjqpWXyiSNHINNEWzN4Q5BdLepZ1X4JxWWJgh1Wfkv9LH0+ldDfkYwzgu3ohWAaRA==
sha512sums_x86_64=('f1d5c5dc6423dcee1d3e6cbfc6c4aa3868eaa565f289234720d3445b337843905d2dea59d57e09c56589821d567e4bfd2c7d3e95d0df918c3382ede885601a44')

source_aarch64=("tempest-desktop_${pkgver}_arm64.deb::https://download.gotempest.app/tempest-desktop_${pkgver}_arm64.deb")
# 上游公布值（Base64 格式的 SHA-512）:
#   Km2lW8wm7N+QqrN3s2zg9jMT+oYcK3+swP9Iu+7J2hQoeDXDbnGtGqRwOSIOH3N59Z+dYFQkFy/iNmT0x5aVZw==
sha512sums_aarch64=('2a6da55bcc26ecdf90aab377b36ce0f63313fa861c2b7facc0ff48bbeec9da14287835c36e71ad1aa47039220e1f7379f59f9d605424172fe23664f4c7969567')

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