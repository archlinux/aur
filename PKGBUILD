# Maintainer: shtrophic <aur at shtrophic dot net>

_pkgname=3dtk
pkgname="$_pkgname-git"
pkgver=r2353.0338944
pkgrel=1
pkgdesc='3D Toolkit with algorithms and methods to process 3D point clouds'
url='https://slam6d.sourceforge.io'
license=(GPL-3.0-only)
arch=(x86_64)
provides=("$_pkgname")
conflicts=("$_pkgname-svn")
replaces=("$_pkgname-svn")
makedepends=(git cmake openmp)
depends=(findutils
	 boost 
	 opencv 
	 cgal 
	 eigen 
	 gmp 
	 mpfr 
	 onetbb
	 suitesparse
	 glu
	 glut
	 libzip
	 python
	 qt5-base
	 qt6-base
	 apriltag
	 ann)
source=("$pkgname::git+https://github.com/JMUWRobotics/3DTK.git"
	apriltag.patch
	cpp14.patch
	cacheManager.patch
	3dtk.sh)
sha512sums=('SKIP'
            '064c980b6817aac39bfccb64315cfec07e290451c1fcedaee4492a50694d2a489296bcf7ded39d2fa877a10f83f7e19c4cd9e6ab15fca7be9afa34cc4be8056f'
            'b55788c7fd074980a4d4814b8a29b5f70c097cd201db59248edc2c012cc4ea0bf55af1da2165dcf20865b61f86f2d8a2888ac445381bfaaa3f4f54b5cac540be'
            'a4987e473e86c77b85b6e71bfff4149c8e8fd63574dba1a66afbe70dd849cdeff27055d17025c3487ce5fc48ee7acefa1cfd7600c0d40a3d688c06daf3bc29af'
            'e352631c55938430af765948ef73a16c855f2147b5cab9ec33cbdc438ee0f28bb32cd96f4f2ff96f773de153de72d3b8ff0f51f5076227e181db9eac653b9e36')

pkgver() {
	cd "$pkgname"
  	( set -o pipefail
    	  git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  	)
}

prepare() {
	cd "$pkgname"
	
	for f in "$srcdir"/*.patch; do
		git apply < "$f"
	done

	# set package binary paths to /opt/3dtk in every included script
	sed -i 's,\([^/]\)bin/,\1/opt/3dtk/,g' bin/*.sh
}

build() {
	cd "$srcdir"

	cmake -B build \
		-DWITH_WXWIDGETS=OFF \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		-DWITH_COMPACT_OCTREE=ON \
		-DWITH_OPENMP=ON \
		-Wno-dev \
		"$srcdir/$pkgname"

	cmake --build build
}

package() {
	cd "$pkgname"
	
	# toolkit ships many binaries with generic names. 
	# thus putting them into /opt
	rm bin/test_*
	install -Dm 755 bin/* -t "$pkgdir/opt/$_pkgname"

	install -Dm 644 README.* -t "$pkgdir/usr/share/doc/$_pkgname"
	cp -r doc/* "$pkgdir/usr/share/doc/$_pkgname"

	install -Dm 644 LICENSING -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -dm 755 "$pkgdir/usr/include/$_pkgname"
	cp -r include/* "$pkgdir/usr/include/$_pkgname"

	install -Dm 644 lib/* -t "$pkgdir/usr/lib"

	install -dm 755 "$pkgdir/usr/share/$_pkgname"
	cp -r dat "$pkgdir/usr/share/$_pkgname"

	install -Dm 755 "$srcdir/3dtk.sh" "$pkgdir/usr/bin/$_pkgname"
}

