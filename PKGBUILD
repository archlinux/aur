# Maintainer: David Runge <dvzrv@archlinux.org>

_name=FoxDot
pkgname=foxdot
pkgver=0.8.12
pkgrel=3
pkgdesc="Live Coding with Python"
arch=(any)
url="https://foxdot.org"
license=(CCPL)
groups=(pro-audio)
depends=(
  python
  supercollider
  tk
)
makedepends=(
  gendesk
  imagemagick
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=('sc3-plugins: use additional UGens')
# pypi sdist doesn't contain tests: https://github.com/Qirky/FoxDot/issues/188
# source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_name}-${pkgver}.tar.gz")
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Qirky/$pkgname/archive/v$pkgver.tar.gz
  $pkgname-0.8.12-python3.11.patch
)
sha512sums=('d0b59bb117871ba5a785c2ab3ce83048a6649f02e8d07f1248432868ec49262bcd44fdf98dc5cb2694e1f8a9b38d76c2ac111c21708ef43fda7ce0d4d8471d64'
            '38ce5f0ac54c295a241998399399692793073c039c3a6e61640756908bd09819c08e5fbb656683d70e7426b05e0cc94dc3ae8e9d385df325cac36b1840ac8a0f')
b2sums=('38bd7781daabb4abe3385444fcb254d36a24c532de789fc86063f35ddaacba8092e65bbf4e8b1eb62aff02f2705b35284fcebdfdacca5b0ad5260ffff7293989'
        'efb37ea9c8febc974142bd1127e4ba1ae7a60d458f0414ac97d73c9fe4e6d4ddc25cd12ee1e693b034cd77eb0bcb1e48ad089d89e3ced197099fea623bcb1d62')

prepare() {
  # replace inspect.getargspec with inspect.getfullargspec
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.8.12-python3.11.patch
  cd $_name-$pkgver
  gendesk -n \
          --pkgname $pkgname \
          --name $_name \
          --exec $_name \
          --genericname "Live Coding Editor" \
          --categories "AudioVideo;Audio" \
          --comment "Live Coding with Python and SuperCollider"
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
  convert -verbose FoxDot/lib/Workspace/img/icon.gif +set date:create +set date:modify $pkgname.png
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 ./*.desktop -t "$pkgdir/usr/share/applications/"
  install -vDm 644 $pkgname.png -t "$pkgdir/usr/share/pixmaps/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {README.md,changelog} -t "$pkgdir/usr/share/doc/$pkgname/"
}
