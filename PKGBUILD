# 上游模板：micdn/scripts/package/PKGBUILD.proto
# 维护目录：~/aur-packages/micdn

pkgname=micdn
pkgver=0.2.3
pkgrel=1
pkgdesc="Beangle minimal CDN (static, Maven, npm, blob, www)"
arch=('x86_64')
url='https://github.com/beangle/micdn'
license=('GPL-3.0-or-later')
depends=('curl')
makedepends=('ldc' 'dub' 'git' 'zlib' 'openssl')
optdepends=(
  'systemd: service unit micdn.service'
)
backup=('etc/micdn/micdn.xml')
install=micdn.install
source=(
  "git+https://github.com/beangle/micdn.git#tag=v${pkgver}"
  "micdn.install"
  "micdn.sysusers"
  "micdn.tmpfiles"
)
sha256sums=('8187f3381a9efcfca603977feced1efec623ea87e9453f9be3915ff395dda870'
            'f5feb564ee3d732263ef4b1b52e573f918b05b75b4063be6e85fbdc882830888'
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
