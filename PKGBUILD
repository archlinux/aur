# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=gita
pkgver=0.16.7.2
pkgrel=3
pkgdesc="Command-line tool to manage multiple git repos"
arch=('any')
url="https://github.com/nosarthur/gita"
license=('MIT')
depends=('git' 'python' 'python-setuptools' 'python-argcomplete')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "0001-warning.patch")
sha256sums=('9ae73a3fda7cc242017f496ccc7494d18e2ccc1f1d82eed137a1f7d6c2b7de03'
            '7ec48fdb6bfbb9849db124de46d09bcd50e9dc1a8dcdef1c6e53317793facf4c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 auto-completion/bash/.gita-completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/gita"

  install -Dm644 auto-completion/fish/gita.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/gita.fish"

  install -Dm644 auto-completion/zsh/_gita \
    "$pkgdir/usr/share/zsh/site-functions/_gita"

  # silence the warning, not much we can do about it anyway
  # it gets really annoying when using bash completion
  patch "$pkgdir/usr/bin/gita" "$srcdir/0001-warning.patch"
}
