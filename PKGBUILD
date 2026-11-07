# Maintainer: duantihua <duantihua@163.com>
pkgname=bashub
pkgver=0.0.8
pkgrel=1
pkgdesc="Beangle BAS console server"
arch=('x86_64')
url='https://github.com/beangle/bashub'
license=('GPL-3.0-or-later')
# curl 是运行期外部命令；libpq 由 postgresql-libs 提供。Arch 的 LDC 默认静态链接
# D 运行时，因此不需要把 liblphobos 列为运行时依赖。
depends=('curl' 'gcc-libs' 'postgresql-libs' 'zlib')
makedepends=('dub' 'git' 'ldc')
install=bashub.install
source=(
  "git+https://github.com/beangle/bashub.git#tag=v${pkgver}"
  "bashub.sysusers"
  "bashub.tmpfiles"
)
sha256sums=('SKIP'
            '5f2b07b290434ed54b959fb0dc38a2b5d240a994184bf1e7753c99c2ce4dcb5c'
            '3520a6ef1a0dd4de7d7ff4a7b586f642847a0601ce0b2d642fe16deb5d3644c3')

prepare() {
  cd "$pkgname"
  dub fetch
}

build() {
  cd "$pkgname"
  # 与 basctl 的 AUR 包一致：加载时解析完 GOT 并置为只读。
  # 只作用于这次 build；不能 export，否则会污染后面的 check()。
  DFLAGS='-L-z -Lnow' dub build --build=release-nobounds --compiler=ldc2

  # dub.json 是发行版本的唯一来源；包版本偏离时不要产出安装包。
  [[ "$(sed -n 's/^[[:space:]]*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*$/\1/p' \
    dub.json | head -n 1)" == "$pkgver" ]]
}

check() {
  cd "$pkgname"
  dub test --compiler=ldc2
}

package() {
  cd "$pkgname"

  install -Dm755 target/d/bashub "$pkgdir/usr/bin/bashub"
  install -Dm644 scripts/package/bashub.service \
    "$pkgdir/usr/lib/systemd/system/bashub.service"
  install -Dm644 "$srcdir/bashub.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/bashub.conf"
  install -Dm644 "$srcdir/bashub.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/bashub.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
