# Maintainer: Specter119 <specter119 [AT] gmail [DOT] com>

pkgname=libsolv-conda-forge
_name=${pkgname%%-*}
pkgver=0.7.19
pkgrel=1
pkgdesc='Library for solving packages and reading repositories'
arch=(i686 x86_64)
url=https://github.com/openSUSE/$_name
license=(custom:BSD)
depends=(bzip2 expat rpm-tools xz zchunk zlib zstd)
makedepends=('cmake>=3.13' perl python ruby swig)
optdepends=('perl: for perl bindings'
						'python: for python bindings'
						'ruby: for ruby bindings')
provides=($_name)
conflicts=($_name)
_url_patch=https://raw.githubusercontent.com/conda-forge/libsolv-feedstock/master/recipe
source=(
	$_name-$pkgver.tar.gz::$url/archive/$pkgver/$_name-$pkgver.tar.gz
	$_url_patch/conda_variant_priorization.patch
	$_url_patch/add_strict_repo_prio_rule.patch
	$_url_patch/memcpy_to_memmove.patch
)
sha256sums=('67e6a46e9e03410d3d27c963c0382881b064c50d2e7ca25860c515df3ca4dae1'
            '9864c23404c0ab75880b8784b1b34fdb61416de7319371702e4ef0f886ea6c3c'
            '040a9cd68a59ed30cf637d57fa579eaf809a8bf7c3eb685544a42442898bfaf9'
            'ab1ccbb61b9239d98ee7848d84d2533d50c7d30f2d856c93ad504846981a894d')

prepare() {
  cd $srcdir/$_name-$pkgver
  patch -p1 -i ../conda_variant_priorization.patch
  patch -p1 -i ../add_strict_repo_prio_rule.patch
  patch -p1 -i ../memcpy_to_memmove.patch
}


build() {
	cd $srcdir/$_name-$pkgver

	cmake -B build \
		-DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG \
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
	  -DENABLE_ZCHUNK_COMPRESSION=ON \
	  -DWITH_SYSTEM_ZCHUNK=ON \
	  -DENABLE_ZSTD_COMPRESSION=ON \
	  -DMULTI_SEMANTICS=ON \
	  -DWITH_LIBXML2=OFF \

	make -C build
}

check() {
	cd $srcdir/$_name-$pkgver
	make -C build ARGS=-V test
}

package() {
	cd $srcdir/$_name-$pkgver
	make -C build DESTDIR=$pkgdir/ install
	install -Dp -m644 LICENSE.BSD $pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD
	install -Dp -m644 README  $pkgdir/usr/share/doc/$pkgname/README
}

# vim: set ft=sh ts=2 sw=2 noet:
