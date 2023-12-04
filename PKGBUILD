# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-pycxx
_name=${pkgname#python-}
pkgver=7.1.8
pkgrel=1
pkgdesc="Write Python extensions in C++"
arch=('any')
url="http://cxx.sourceforge.net"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://downloads.sourceforge.net/cxx/$_name-$pkgver.tar.gz")
sha256sums=('4b91e1e1141c23fbd5039df635c4bb6e75632168548f56b83ce177193c0c98c6')

prepare() {
  cd "$_name-$pkgver"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  # Remove unnecessary 'Src/' directory from include path in sources
  sed -e "/^#include/s:Src/::" -i Src/*.{c,cxx}

# Write pkg-config PyCXX.pc file
cat > "$srcdir/PyCXX.pc" <<EOF
prefix=/usr
exec_prefix=/usr
includedir=/usr/include
srcdir=/usr/share/python${python_version}/CXX

Name: PyCXX
Description: Write Python extensions in C++
Version: ${pkgver}
Cflags: -I\${includedir}
EOF
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  export PKG_CONFIG_PATH="$srcdir":/usr/lib/pkgconfig
  test "$(pkg-config --modversion PyCXX)" = "$pkgver"
}

package() {
  cd "$_name-$pkgver"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/python${python_version}"
  mv "$pkgdir/usr/CXX" "$pkgdir/usr/share/python${python_version}"

  install -Dm644 "$srcdir/PyCXX.pc" -t "$pkgdir/usr/share/pkgconfig/"
  install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
