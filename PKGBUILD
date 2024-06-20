# Maintainer: jzbor <zborof at posteo dot de>

_pkgname="sdiff-gtk"
pkgname="$_pkgname"
pkgver=0.1.1
pkgrel=2
pkgdesc="GTK+ frontend for Stable Diffusion"
url="https://github.com/jzbor/sdiff-gtk"
license=('MIT')
arch=('any')

depends=(
  'gtk3'
  'python'
  'python-gobject'
  'python-pillow'
  'python-pytorch'

  # AUR
  'python-accelerate'
  'python-diffusers'
  'python-transformers'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext"
)
sha256sums=(
  '0646e02bb967139b686cd34a7ed026da1d93e9833219d537606d2f2c11b9aa66'
)

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packges=$(python -c 'import site; print(site.getsitepackages()[0])')

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec python "$site_packges/sdiff_gtk/__init__.py"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Stable Diffusion GTK
Comment=$pkgdesc
Exec=$_pkgname
TryExec=$_pkgname
Icon=applications-graphics
Terminal=false
Categories=Graphics;Utility;
END
}
