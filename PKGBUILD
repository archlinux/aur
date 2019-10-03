# Maintainer: Bogdan Burlacu <bogdan.burlacu@pm.me>
pkgname=gaol-git
pkgver=r6.6e6cd9a
pkgrel=1
pkgdesc="GAOL (not Just Another Interval Arithmetic Library) is a C++ Interval Arithmetic Library that offers all operators required by interval constraint solvers."
arch=('x86_64')
url="https://gitlab.univ-nantes.fr/goualard-f/gaol"
license=('GPL')
depends=(crlibm-git)
makedepends=(git cppunit) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.univ-nantes.fr/goualard-f/gaol.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    sed 's/throw\s*(.*)/throw()/g' -i gaol/gaol_allocator.h
    sed 's/throw\s*(.*)/throw()/g' -i gaol/gaol_interval.h
    sed 's/throw\s*(.*)/throw()/g' -i gaol/gaol_interval2f.h
    sed 's/throw\s*(.*)/throw()/g' -i gaol/gaol_interval2f.cpp
    sed 's/throw\s*(.*)/throw()/g' -i gaol/gaol_interval.cpp
    sed 's/throw\s*(.*)/throw()/g' -i gaol/gaol_interval_sse.cpp
}

build() {
	cd "$srcdir/${pkgname%-git}"
    ./configure --prefix=/usr  --with-mathlib=crlibm
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
    make prefix=$pkgdir/usr install
}

