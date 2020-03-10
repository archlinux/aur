# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocthrust
pkgver=3.1.0
pkgrel=1
pkgdesc="Port of the Thrust parallel algorithm library atop HIP/ROCm."
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/rocThrust"
license=('custom:NCSAOSL')
depends=('hcc' 'hip')
makedepends=('cmake' 'hcc' 'python2' 'rocminfo' 'rocm-comgr')
source=("https://github.com/ROCmSoftwarePlatform/rocThrust/archive/$pkgver.tar.gz")
sha256sums=('87f6809b74422aed09f21a63eff09d4328791d6f622aa8040f104b55dbe5ae00')

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

  # TODO: fix librocthrust.so, it contains references to $srcdir
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocthrust \
        -DBUILD_TEST=OFF \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        "$srcdir/rocThrust-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rocthrust.conf"
/opt/rocm/rocthrust/lib
EOF
}
