# Maintainer: CamelliaTse <CamelliaTse33@outlook.com>

# 这是发布到 AUR 的正式 PKGBUILD：源码取自 GitHub 的 tag 压缩包。
# 发布前请先推送 tag，再用 packaging/scripts/bump-version.sh 回填 sha256sums。
# 想在推 tag 之前先验证构建，用 packaging/PKGBUILD（本地工作副本版本）。

pkgname=pretalk
pkgver=0.1.0
pkgrel=1
pkgdesc="为明天的讨论、为两年后的自己留下一封信（零依赖命令行工具）"
arch=('any')
url="https://github.com/CamelliaTse/pretalk"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9538a980860140469f933634f55702ae0c0cc914ec1ad58ae5242ecfbd4d715')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # 运行时零依赖，测试同样只用标准库 unittest。
  PYTHONPATH="$PWD/src" python -m unittest discover -s tests -t .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
