# Maintainer: emsger <earthmessenger@qq.com>
# With help of AI

pkgname=pear-desktop-michei69-bin
_app_id=com.github.th-ch.youtube-music
pkgver=3.12.4
pkgrel=1
pkgdesc="YouTube Music Desktop App - including custom plugins (michei69's fork)"
# 上游自 3.12.4 起不再提供 armv7l 的 .deb 构建产物
arch=('x86_64' 'aarch64')
url="https://github.com/michei69/pear-desktop"
license=('MIT')
# 预编译二进制无调试符号，不生成 -debug 子包（也避免与上游 pear-desktop-bin-debug 文件冲突）
options=('!debug')
makedepends=('desktop-file-utils')
depends=(
  'gtk3'
  'libsecret'
  'nss'
)
provides=('pear-desktop' 'youtube-music')
conflicts=('pear-desktop' 'youtube-music' 'pear-desktop-bin' 'pear-desktop-git')
install='youtube-music.install'
source=("license-$pkgver::https://github.com/michei69/pear-desktop/raw/v$pkgver/license"
        'youtube-music.sh')
source_x86_64=("https://github.com/michei69/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/michei69/pear-desktop/releases/download/v$pkgver/youtube-music_${pkgver}_arm64.deb")
sha256sums=('34166a5d4f182354810c18c9d568cbdd2b8ef7e95fa71d31f1d00fbe1089ac81'
            '3769e2d994ad011e8481f3ed448557cd9e5b5f1a805d84b4944639c807440d8c')
sha256sums_x86_64=('47789abb98e3d51c963be96446521730eda78aba6f19b5f49f14a108f05ce1d9')
sha256sums_aarch64=('ed03b9132a3e3e9660213d8d1ba947435a9b0e31c767cba61d4833dcbdea6e52')

package() {
  bsdtar xfv data.tar.xz -C "$pkgdir"

  desktop-file-edit --set-key=Exec --set-value="youtube-music %U" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"

  install -d "$pkgdir/etc/apparmor.d"
    ln -s "/opt/YouTube Music/resources/apparmor-profile" \
      "$pkgdir/etc/apparmor.d/youtube-music"

  install -Dm755 youtube-music.sh "$pkgdir/usr/bin/youtube-music"

  install -Dm644 "license-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/license"
}
