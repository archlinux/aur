# Maintainer: Michał Barciś <mbarcis@mbarcis.net>
pkgname=fast-rtps-git
pkgver=v1.5.0.r215.095d657e
pkgrel=1
pkgdesc="Implementation of RTPS standard by eProsima"
arch=('x86_64')
url="http://www.eprosima.com/index.php/products-all/eprosima-fast-rtps"
license=('Apache')
groups=()
depends=('bash' 'openssl' 'java-environment')
makedepends=('git' 'cmake' 'openssl' 'gradle')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('fast-rtps::git+https://github.com/eProsima/Fast-RTPS')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build

    cmake -DTHIRDPARTY=ON -DBUILD_JAVA=ON -DSECURITY=ON ..
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    cd build

    TMP_DIR=`mktemp -d`
    export GRADLE_USER_HOME=$TMP_DIR/.gradle

	make DESTDIR="$pkgdir/" install
    rm -rf "$pkgdir/usr/local/examples"
    mv $pkgdir/usr/local/* "$pkgdir/usr/"
    rmdir "$pkgdir/usr/local"
    rm -rf $TMP_DIR
}
