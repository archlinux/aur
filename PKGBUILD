# Submitter: Chris Kitching
# Maintainer: Jakub Okoński <jakub@okonski.org>
pkgname=hip
pkgver=2.5.0
pkgrel=1
pkgdesc="Heterogeneous Interface for Portability ROCm"
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/HIP"
makedepends=('hcc>=2.5.0' 'git' 'cmake' 'python2')
source=("https://github.com/ROCm-Developer-Tools/HIP/archive/roc-$pkgver.tar.gz")
sha256sums=('604aaa200ea72e7d02ec0371ea4a7e29ca31d6a49a9075c6c6cf0aa8ef04c2bd')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  # A python2 script is invoked during cmake configuration that generates some headers
  sed -i "1s/python/python2/" "$srcdir/HIP-roc-$pkgver/hip_prof_gen.py"

  # TODO: fix libhip_hcc.so and libhip_hcc_static.a
  #       they contain references to $srcdir, I tried a bunch of things but nothing helps

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip \
        "$srcdir/HIP-roc-$pkgver"
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
