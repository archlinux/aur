# Submitter: Chris Kitching
# Maintainer: Jakub Okoński <jakub@okonski.org>
pkgname=hip
pkgver=3.3.0
pkgrel=1
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/HIP"
license=('MIT')
makedepends=("hcc>=$pkgver" 'cmake' 'python2')
source=("https://github.com/ROCm-Developer-Tools/HIP/archive/rocm-$pkgver.tar.gz")
sha256sums=('8ae7cf4134975c7a36e0c72a5e041694935f38c2d7df58f4ad55e9a23b7b875c')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # A python2 script is invoked during cmake configuration that generates some headers
  sed -i "1s/python/python2/" "$srcdir/HIP-rocm-$pkgver/hip_prof_gen.py"

  # TODO: fix libhip_hcc.so and libhip_hcc_static.a
  #       they contain references to $srcdir, I tried a bunch of things but nothing helps

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip \
        "$srcdir/HIP-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/hip.conf"
/opt/rocm/hip/lib
EOF

  # Remove one source of references to $srcdir
  sed -i "s+$pkgdir/opt+/opt+g" \
    "$pkgdir/opt/rocm/hip/lib/cmake/hip/hip-targets-release.cmake" \
    "$pkgdir/opt/rocm/hip/lib/cmake/hip/hip-targets.cmake"

  # Nobody wants your source code, AMD..
  rm -rf "$pkgdir/opt/rocm/hip/src"

  # Jakub: these two things below don't seem useful anymore, rest of the ecosystem
  #        looks in /opt/rocm for CMake finders, libraries etc.

  # Put the finder script somewhere even vaguely convenient.
  # mkdir -p "${pkgdir}/usr/share/cmake-3.9"
  # cp -R "${pkgdir}/opt/rocm/hip/cmake" "${pkgdir}/usr/share/cmake-3.9"
  # rm -R "${pkgdir}/opt/rocm/hip/cmake"

  # Synthesise an entry for /etc/profile.d to sort out the /bin stuff.
  # mkdir -p "${pkgdir}/etc/profile.d"
  # echo "export PATH=\$PATH:/opt/rocm/hip/bin" > "${pkgdir}/etc/profile.d/hip.sh"
  # chmod a+x "${pkgdir}/etc/profile.d/hip.sh"
}
