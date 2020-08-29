# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=rbdl
_pkgname=rbdl-orb
pkgrel=1
pkgver=3.0.0
pkgdesc="RBDL - Rigid Body Dynamics Library. Mercurial version."
url="http://rbdl.bitbucket.org"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
depends=('lua51' 'unittestpp' 'eigen')
provides=('rbdl')
conflicts=('rbdl-hg')
source=("https://github.com/ORB-HD/rbdl-orb/archive/v3.0.0.tar.gz")
sha256sums=('5da3c5b66fbc46cae37e651768ffe0bc2c3fb2ae8fc3ec52c4a09798de328028')


build() {
    cd $_pkgname-$pkgver
    mkdir -p build
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
                      -DCMAKE_BUILD_TYPE=Release \
                      -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
                      ${_lua_param} ${_unittestpp_param} ${_rosurdf_param} \
                      -DRBDL_BUILD_ADDON_LUAMODEL=ON \
                      -DRBDL_BUILD_PYTHON_WRAPPER=ON

    make
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd build
	make DESTDIR="${pkgdir}" install

	cd python
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

