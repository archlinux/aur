# Maintainer: Emiya173 <emiyazero173@gmail.com>
#
# AUR 包:luvtter-desktop-bin
# 直接消费 GitHub Release 上 Compose Desktop createDistributable 出的自包含 tar.gz,
# 不再走 .deb 中转,Arch 风格更纯净。
#
# tar.gz 内部结构(由 jpackage 生成):
#   letter-app/bin/letter-app          ← 启动脚本
#   letter-app/lib/runtime/...         ← 内嵌 JDK
#   letter-app/lib/app/...             ← 应用 jar
#
# 安装到 /opt/luvtter-desktop/,在 /usr/bin 下软链 luvtter-desktop。

pkgname=luvtter-desktop-bin
pkgver=0.0.1c
pkgrel=1
pkgdesc="Luvtter — slow-mail letter writing client (Compose Desktop, prebuilt self-contained)"
arch=('x86_64')
url="https://github.com/Emiya173/luvtter"
license=('MIT')
# jpackage 已经把 JDK 内嵌进 lib/runtime/,所以不需要外部 java-runtime。
# 仅声明运行时实际用到的图形栈和字体(Skiko / Compose Desktop 依赖)。
depends=(
  'fontconfig'
  'freetype2'
  'libxrender'
  'libxtst'
  'libxi'
)
provides=('luvtter-desktop')
conflicts=('luvtter-desktop' 'luvtter-desktop-git')
options=(!strip !debug)
source=("luvtter-desktop-v${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/luvtter-desktop-v${pkgver}-linux-x86_64.tar.gz"
        "luvtter-desktop.desktop")
sha256sums=('72174154229c4027678c7ec54b5e616087dc1eb32e7527a3bb80e5c419a15e37'
            'SKIP')

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/luvtter-desktop"
  cp -a letter-app/. "$pkgdir/opt/luvtter-desktop/"

  install -d "$pkgdir/usr/bin"
  ln -sf /opt/luvtter-desktop/bin/letter-app "$pkgdir/usr/bin/luvtter-desktop"

  install -Dm644 luvtter-desktop.desktop \
    "$pkgdir/usr/share/applications/luvtter-desktop.desktop"
}
