# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>

pkgname=libne10-git
pkgver=v1.1.2.r98.ga778f6d
pkgrel=1
pkgdesc="An open optimized software library project for the ARM® Architecture"
arch=('armv7h' 'aarch64')
url="https://github.com/projectNe10/Ne10"
makedepends=('git' 'doxygen' 'cmake')
license=('BSD')
source=(${pkgname%-git}::git+https://github.com/projectNe10/Ne10
        "linux-install-rules.patch")
sha256sums=('SKIP'
            '8e958fb35b71b46e53966ade8add96f81c5390ce4d2dc8028e4634802929b88c')
provides=('libne10')
conflicts=('libne10')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname%-git}
    rm -rf build
    git clean -f
    patch -p1 < ../linux-install-rules.patch
}

build() {
    cd ${pkgname%-git}

    if [ "$CARCH" == "armv7h" ] ; then
        export NE10_LINUX_TARGET_ARCH=armv7
    else
        export NE10_LINUX_TARGET_ARCH="$CARCH"
    fi

    cd doc
    doxygen
    cd ..

    mkdir build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DGNULINUX_PLATFORM=ON \
        -DNE10_BUILD_SHARED=ON \
        ..

    msg2 'Building...'
    make
}

package() {
    cd ${pkgname%-git}

    if [ "$CARCH" == "armv7h" ] ; then
        export NE10_LINUX_TARGET_ARCH=armv7
    else
        export NE10_LINUX_TARGET_ARCH="$CARCH"
    fi

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation'
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -a "doc/html" "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -a samples/*.c "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  cd build
  make DESTDIR="$pkgdir" install
}
