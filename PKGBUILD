# Maintainer: Sighthesia <sighthesia@qq.com>
pkgname=mididash-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="MIDI router with Lua scripting and a node based interface"
arch=('x86_64')
url="https://github.com/tiagolr/mididash"
license=('GPL-3.0-only')
provides=('mididash')
conflicts=('mididash')
options=('!debug')
depends=(
  'alsa-lib'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
)
source=(
  "Mididash_${pkgver}_amd64.deb::https://github.com/tiagolr/mididash/releases/download/v0.4.3/Mididash_0.4.3_amd64.deb"
  "LICENSE::https://raw.githubusercontent.com/tiagolr/mididash/master/LICENSE"
)
sha256sums=(
  'a4fed93a4dd45e248a1cfec518aa0f1c083f4a270912ed17e24b3e78260a0ba3'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
  # 解包 deb（data.tar.gz）
  bsdtar -xf "${srcdir}/Mididash_${pkgver}_amd64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"

  # 安装主程序、desktop、图标（参考上游 deb 目录结构）
  install -dm755 "${pkgdir}/usr"
  cp -a "${srcdir}/usr/bin" "${pkgdir}/usr/"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"

  # 统一小写命令入口，保留原大写二进制兼容
  ln -s Mididash "${pkgdir}/usr/bin/mididash"

  # 修复上游 desktop 空 Categories，namcap 会报警告
  sed -i 's/^Categories=$/Categories=AudioVideo;Audio;/' "${pkgdir}/usr/share/applications/Mididash.desktop"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
