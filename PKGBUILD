# 上游仓库：https://github.com/beangle/jstart
# AUR 维护目录：~/aur-packages/jstart（本目录）
#
# 发布新版本：上游打 tag（v0.0.2）-> 改下面 pkgver -> makepkg --printsrcinfo > .SRCINFO
# -> git add -A && git commit && git push（AUR 只接受 master 分支上的 PKGBUILD/.SRCINFO）。

pkgname=jstart
pkgver=0.0.1
pkgrel=1
pkgdesc="Lightweight launcher for jar/war and native (tar.gz) Java artifacts"
arch=('x86_64')
url='https://github.com/beangle/jstart'
license=('GPL-3.0-or-later')
depends=('curl')
makedepends=('ldc' 'dub' 'git')
optdepends=(
  'jre-openjdk: run jar/war targets (native tar.gz targets need no JVM)'
)
source=("git+https://github.com/beangle/jstart.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  dub build --build=release-nobounds --compiler=ldc2

  # check() 用 unittest 配置构建，产物同样是 target/jstart（会覆盖 release 二进制），
  # 先把 release 二进制留一份，package() 用这一份
  install -Dm755 target/jstart "$srcdir/jstart.bin"
}

# 纯 Phobos 无外部依赖，单测只用 127.0.0.1 上的本地 http 服务，可在 chroot 内跑；
# 若某个环境的 chroot 限制了进程/临时目录，可整段注释。
check() {
  cd "$pkgname"
  dub test --compiler=ldc2
}

package() {
  install -Dm755 "$srcdir/jstart.bin" "$pkgdir/usr/bin/jstart"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
