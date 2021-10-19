# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=rbdl
_pkgname=rbdl-orb
pkgrel=2
pkgver=3.1.3
pkgdesc="RBDL - Rigid Body Dynamics Library"
url="https://github.com/ORB-HD/rbdl-orb"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
depends=('lua51' 'unittestpp' 'eigen')
provides=('rbdl')
conflicts=('rbdl-hg')
_giturl='https://github.com/ORB-HD/rbdl-orb.git'

build() {
	# We require the repository including submodules.
	# The git-release-tooling unfortunately does not include them, and as a
	# consequence GitHub-releases do not either. So we manually checkout the
	# version we want.
    git clone --recursive $_giturl $pkgname-$pkgver
    cd $pkgname-$pkgver
	git checkout v$pkgver

    mkdir -p build
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
                      -DCMAKE_BUILD_TYPE=Release \
                      -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
                      ${_lua_param} ${_unittestpp_param} ${_rosurdf_param} \
                      -DRBDL_BUILD_ADDON_LUAMODEL=ON \
                      -DRBDL_BUILD_ADDON_URDFREADER=ON \
                      -DRBDL_BUILD_PYTHON_WRAPPER=ON

    make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd build
	make DESTDIR="${pkgdir}" install

	cd python
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

