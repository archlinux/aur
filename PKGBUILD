# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on community/libsolv by
# Jelle van der Waa <jelle@archlinux.org>
# Contributor: larchunix

_pkgname=libsolv
pkgname="${_pkgname}-git"
pkgver=0.7.22.r0.gea114b25
pkgrel=1
pkgdesc="Library for solving packages and reading repositories"
arch=('x86_64')
url="https://github.com/openSUSE/libsolv"
license=('custom:BSD')
depends=('bzip2' 'expat' 'rpm-tools' 'xz' 'zlib' 'zstd')
makedepends=('cmake' 'perl' 'python' 'ruby' 'swig' 'git')
optdepends=('perl: for perl bindings'
            'python: for python bindings'
            'ruby: for ruby bindings')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  cmake -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DUSE_VENDORDIRS=ON \
        -DFEDORA=1 \
        -DENABLE_APPDATA=ON \
        -DENABLE_ARCHREPO=ON \
        -DENABLE_BZIP2_COMPRESSION=ON \
        -DENABLE_COMPLEX_DEPS=1 \
        -DENABLE_COMPS=ON \
        -DENABLE_CONDA=ON \
        -DENABLE_CUDFREPO=ON \
        -DENABLE_DEBIAN=ON \
        -DENABLE_HAIKU=OFF \
        -DENABLE_HELIXREPO=ON \
        -DENABLE_LZMA_COMPRESSION=ON \
        -DENABLE_MDKREPO=ON \
        -DENABLE_PERL=ON \
        -DENABLE_PUBKEY=ON \
        -DENABLE_PYTHON=ON \
        -DENABLE_RPMDB=ON \
        -DENABLE_RPMDB_BYRPMHEADER=ON \
        -DENABLE_RPMDB_LIBRPM=ON \
        -DENABLE_RPMMD=ON \
        -DENABLE_RPMPKG=ON \
        -DENABLE_RUBY=ON \
        -DENABLE_SUSEREPO=ON \
        -DENABLE_TCL=OFF \
        -DENABLE_ZSTD_COMPRESSION=ON \
        -DMULTI_SEMANTICS=ON

  make -C build
}

check() {
  cd "$_pkgname"

  make -C build ARGS="-V" test
}

package() {
  cd "$_pkgname"

  make -C build DESTDIR="$pkgdir/" install

  install -Dp -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
  install -Dp -m644 README      "$pkgdir/usr/share/doc/$pkgname/README"
}
