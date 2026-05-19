# 上游模板：micdn/scripts/package/PKGBUILD.proto
# 维护目录：~/aur-packages/micdn
#
# micdn.sysusers / micdn.tmpfiles 在 v0.2.2 未进 GitHub，故作为 AUR 侧附加文件；
# 上游打新 tag 并提交后可改回仅从 scripts/package/ 安装。

pkgname=micdn
pkgver=0.2.2
pkgrel=2
pkgdesc="Beangle minimal CDN (static, Maven, npm, blob)"
arch=('x86_64')
url='https://github.com/beangle/micdn'
license=('GPL-3.0-or-later')
depends=('curl')
makedepends=('ldc' 'dub' 'git' 'zlib' 'openssl')
optdepends=(
  'systemd: service unit micdn.service'
)
backup=()
install=micdn.install
source=(
  "git+https://github.com/beangle/micdn.git#tag=v${pkgver}"
  "micdn.install"
  "micdn.sysusers"
  "micdn.tmpfiles"
)
sha256sums=('1eb4d71933a1b7dae9001be3ea168f63481dc15f3e22b128425c6bfff335d0a1'
            '4b955005cdc45b4de6a0d8ca718e47c1f3cbdbed958fc07d408d2bebb8e8cf60'
            '346a3b0bdb0fd0737be566b1a9aba853fb9f1361b70ddc14e33719d57ce078f9'
            'd80affc81230b473551692a51165df4be18daf9b93d8d3d780711598f1c2405f')

prepare() {
  cd micdn
  dub fetch
}

build() {
  cd micdn
  dub build --build=release-nobounds --compiler=ldc2
}

# 可选：chroot 内单测失败时可整段注释
check() {
  cd micdn
  dub test --build=unittest --compiler=ldc2
}

package() {
  cd micdn

  install -Dm755 target/micdn "$pkgdir/usr/bin/micdn"
  install -Dm644 scripts/package/micdn.xml "$pkgdir/usr/share/micdn/micdn.xml.default"
  install -Dm644 scripts/package/micdn.service "$pkgdir/usr/lib/systemd/system/micdn.service"
  install -Dm644 "$srcdir/micdn.sysusers" "$pkgdir/usr/lib/sysusers.d/micdn.conf"
  install -Dm644 "$srcdir/micdn.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/micdn.conf"
}
