# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: Nicolas F. <aur@fratti.ch>
pkgname=zopfli-git
pkgver=1.0.3.r9.gccf9f05
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64' 'powerpc' 'powerpc64' 'powerpc64le' 'riscv64')
url="https://github.com/google/zopfli"
pkgdesc="Compression algorithm library, git version"
license=('Apache')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs')
source=('git+https://github.com/google/zopfli.git')
provides=('zopfli' 'libzopfli.so' 'libzopflipng.so')
replaces=('zopflipng-git' 'libzopfli-git' 'libzopflipng-git')
conflicts=('zopfli')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/zopfli"
    git describe --tag | sed -r 's/zopfli-//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
  cd "$srcdir/zopfli"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_BUILD_TYPE=None \
        -DZOPFLI_BUILD_SHARED=ON \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "$srcdir/zopfli"
  make -C build DESTDIR="${pkgdir}" install
  install -vDm 644 README* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
