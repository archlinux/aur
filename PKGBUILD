# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-pycxx
_name=${pkgname#python-}
pkgver=7.2.0
pkgrel=1
pkgdesc="Write Python extensions in C++"
arch=('any')
url="https://cxx.sourceforge.net"
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://downloads.sourceforge.net/cxx/$_name-$pkgver.tar.gz"
        'change-include-paths.patch')
sha256sums=('4140ca17c39e7f3d8c9a426d12126a037a27dc148e50d3f98f0d334513fcbbb2'
            '8ed381d9542265fcfbac2a50398edf49d44ac4fb59bf6b2455e45fa427fd7d42')

prepare() {
  cd "$_name-$pkgver"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  # Remove unnecessary 'Src/' directory from include path in sources
  patch -Np1 -i ../change-include-paths.patch

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
