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
depends=('python-setuptools' 'git' 'python-argcomplete')
makedepends=('python-build' 'python-installer' 'python-wheel')
_comp="https://raw.githubusercontent.com/nosarthur/gita/refs/tags/v$pkgver/auto-completion"
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/$pkgname/$pkgname-$pkgver.tar.gz"
        "gita.bash::$_comp/bash/.gita-completion.bash"
        "gita.fish::$_comp/fish/gita.fish"
        "gita.zsh::$_comp/zsh/_gita"
        "0001-warning.patch")
sha256sums=('ad0c0f4c7d7f59c477dd8c1115b081b0b45ab7d4ef2e0d599403a07e87d19016'
            '1a2df0f0f1adfad7a1a388883c24676689a9fbd1f65c5f0c7c36d809af6cae34'
            '34aecf5cbec31d5a2a1b51a2f89d01982e99906d6b2cc0c53b15d51161c6aca7'
            '24376f49d4b3088af95be551f5f657208102e83e5f1ad1ccb0ee0f5ee828cfdf'
            '7ec48fdb6bfbb9849db124de46d09bcd50e9dc1a8dcdef1c6e53317793facf4c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  ln -s "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

  cd -

  # silence the warning, not much we can do about it anyway
  # it gets really annoying when using bash completion
  patch "$pkgdir/usr/bin/gita" 0001-warning.patch

  # shell completions
  install -Dm644 gita.bash "$pkgdir/usr/share/bash-completion/completions/gita"
  install -Dm644 gita.fish "$pkgdir/usr/share/fish/vendor_completions.d/gita.fish"
  install -Dm644 gita.zsh "$pkgdir/usr/share/zsh/site-functions/_gita"
}
