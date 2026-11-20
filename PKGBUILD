# AUR 维护目录：~/aur-packages/micdn
# 打包说明见上游 docs/build_aur.md

pkgname=micdn
pkgver=0.4.2
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
sha256sums=('9abee4bb4bfe7b6f60874343c0a765f54da90ab3b768e5d20cc95b44ea19828b'
            'be0de541356462ebab3f50c26a919daf65d017e30ac32414b52c3d28de42c0ad'
            'abbeb4d5fc1c271a950d1bd9f8e316e0d696931a9cebbb56651186cc8ef148c6'
            'a2578033a2b7982d02b5b2ca016363c1859b374b573063054e5d9a9d22c040a1')

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
  install -Dm644 scripts/package/micdn.xml "$pkgdir/usr/share/micdn/micdn.xml.default"
  install -Dm644 scripts/package/micdn.service "$pkgdir/usr/lib/systemd/system/micdn.service"
  install -Dm644 "$srcdir/micdn.sysusers" "$pkgdir/usr/lib/sysusers.d/micdn.conf"
  install -Dm644 "$srcdir/micdn.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/micdn.conf"
}
