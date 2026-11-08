###
 # @Date: 2026-10-18 15:57:46
 # @LastEditors: Wang Xiaomei XianYuPigeon@outlook.com
 # @LastEditTime: 2026-10-18 17:17:42
 # @FilePath: /tempest-desktop-bin/PKGBUILD
### 
# Maintainer: Ganyu_Genshin XianYuPigeon@outlook.com
pkgname=tempest-desktop-bin
pkgver=3.17.6
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
#   r398J9SXNGANgT/diD+ag84GKt5aiFhCEkA3lqyoy7M1JMp7gcIO3AEXdzjdmcNPj4Ed/BhQwpLp9tEaQ5pIXQ==
sha512sums_x86_64=('af7f7c27d49734600d813fdd883f9a83ce062ade5a88584212403796aca8cbb33524ca7b81c20edc01177738dd99c34f8f811dfc1850c292e9f6d11a439a485d')

source_aarch64=("tempest-desktop_${pkgver}_arm64.deb::https://download.gotempest.app/tempest-desktop_${pkgver}_arm64.deb")
# 上游公布值（Base64 格式的 SHA-512）:
#   Eaq4zzScn3Vtt+LmJ31CTKdKq3oyt/j3vs5Fo903uoH3gxi41xfvdNEB4JRWjfJn0C3VFGz/BSwrd3Cl0bpbRg==
sha512sums_aarch64=('11aab8cf349c9f756db7e2e6277d424ca74aab7a32b7f8f7bece45a3dd37ba81f78318b8d717ef74d101e094568df267d02dd5146cff052c2b7770a5d1ba5b46')

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