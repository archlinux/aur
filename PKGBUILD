# AUR 维护目录：~/aur-packages/micdn
# 打包说明见上游 docs/build_aur.md

pkgname=micdn
pkgver=0.4.0
pkgrel=1
pkgdesc="Beangle minimal CDN (static, Maven, npm, blob, www)"
arch=('x86_64')
url='https://github.com/beangle/micdn'
license=('GPL-3.0-or-later')
# 默认配置（executable）用宿主 curl(1) 回源下载（src/micdn/web/curl.d），
# 所以 curl 是硬依赖；namcap 的 "may not be needed" 是误报。
depends=('curl')
makedepends=('ldc' 'dub' 'git' 'zlib' 'openssl')
optdepends=(
  'systemd: service unit micdn.service'
)
# 不设 backup：/etc/micdn/micdn.xml 由 micdn.install 首次安装时从
# micdn.xml.default 生成，不在包里，pacman 跟踪不到（写进 backup 只会得到
# namcap 的 "File in backup array not found in package"）。上游 rpm/deb 同样
# 不跟踪该文件，升级与卸载都保留。
install=micdn.install
source=(
  "git+https://github.com/beangle/micdn.git#tag=v${pkgver}"
  "micdn.install"
  "micdn.sysusers"
  "micdn.tmpfiles"
)
sha256sums=('SKIP'
            'c9af15c01fe7b5f0ee42ccc00e41c056c88525b06e90160716d0fd905fc4cfad'
            'abbeb4d5fc1c271a950d1bd9f8e316e0d696931a9cebbb56651186cc8ef148c6'
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
  dub test --config=unittest --compiler=ldc2
}

package() {
  cd micdn

  install -Dm755 target/micdn "$pkgdir/usr/bin/micdn"
  # v0.3.1 的 xi:include 展开会把注释示例行（<!-- <xi:include href="blob.xml"/> -->）当真实指令，
  # 导致默认配置启动即 exit 2；上游保留此 bug，打包时剔除该行，保证全新安装默认配置可启动。
  install -Dm644 scripts/package/micdn.xml "$pkgdir/usr/share/micdn/micdn.xml.default"
  sed -i '/<xi:include href="blob.xml"/d' "$pkgdir/usr/share/micdn/micdn.xml.default"
  install -Dm644 scripts/package/micdn.service "$pkgdir/usr/lib/systemd/system/micdn.service"
  install -Dm644 "$srcdir/micdn.sysusers" "$pkgdir/usr/lib/sysusers.d/micdn.conf"
  install -Dm644 "$srcdir/micdn.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/micdn.conf"
}
