# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=hipcub
pkgver=3.1.0
pkgrel=1
pkgdesc="Reusable software components for the rocm developers."
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/hipCUB"
license=('custom:NCSAOSL')
depends=('hcc' 'hip')
makedepends=('cmake' 'python2' 'rocminfo')
source=("https://github.com/ROCmSoftwarePlatform/hipCUB/archive/$pkgver.tar.gz")
sha256sums=('9fa41d9b25d5347ea6446ef32777dbe447257ccb494d82cb134529f4b45064a0')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # Tensile library needs python to be python2
  export PATH="$srcdir:$PATH"
  [[ -e "$srcdir/python" ]] || ln -s /usr/bin/python2 "$srcdir/python"

  # fix broken build with stack protection
  export CFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CFLAGS")"
  export CXXFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CXXFLAGS")"
  export CPPFLAGS="$(sed -e 's/-fstack-protector-strong//' <<< "$CPPFLAGS")"

  # compile with HCC
  export CXX="/opt/rocm/hcc/bin/hcc"

  # TODO: fix libhipcub.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hipcub \
        "$srcdir/hipCUB-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/hipcub.conf"
/opt/rocm/hipcub/lib
EOF
}
