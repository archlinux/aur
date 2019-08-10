pkgname=mariadbpp-git
pkgver=1.0.0
_pkgver=${pkgver/_/-}
pkgrel=0
arch=('i686' 'x86_64')
conflicts=('mariadbpp')
provides=('mariadbpp')

_abi=1.0.0

pkgdesc="C++ client library for MariaDB"
url="https://github.com/viaduck/mariadbpp"
license=("BSL-1.0")
depends=("mariadb-libs")
makedepends=("cmake")
source=("git+https://github.com/viaduck/mariadbpp"
	"git+https://github.com/viaduck/cmake-modules")
sha256sums=('SKIP' 'SKIP')

_giturl="https://github.com/viaduck/mariadbpp"
_gitdir="${srcdir}/${pkgname}"

_builddir="$srcdir/build"

pkgver() {
  echo "1.0.0"
}

prepare() {
    mkdir -p "build"
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config "submodule.external/cmake-modules.url" $srcdir/cmake-modules
    git submodule update --init
    cd "include/mariadb++"
    patch -p1 -d . < "${startdir}/headers.patch"
}

build() {
    cd "build"
    echo "${srcdir}/mariadbpp"
    cmake "${srcdir}/mariadbpp" \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd "build"
    make test
}

package() {
    cd "build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "${srcdir}/mariadbpp"/LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
