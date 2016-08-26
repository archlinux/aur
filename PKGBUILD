# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matěj Týč <matej.tyc@gmail.com>
pkgname=aws-sdk-cpp-git
pkgver=0.14.7.r0.gcfd293e
pkgrel=1
epoch=
pkgdesc="AWS SDK for C++"
arch=(any)
url="https://github.com/aws/aws-sdk-cpp"
license=('BSD')
groups=()
depends=('cmake')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+https://github.com/aws/aws-sdk-cpp")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

_gitname=${pkgname}-${pkgver}

pkgver() {
	cd $_gitname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_gitname

    CMAKE_FLAGS="-Wno-dev -DCMAKE_INSTALL_PREFIX=/usr \
               -DCMAKE_BUILD_TYPE=Release \
               -DBUILD_ONLY=kinesis;firehose;sts \
               -DSTATIC_LINKING=1 -DNO_HTTP_CLIENT=1"
    cmake $CMAKE_FLAGS .
	make -j $(nproc)
}

package() {
	cd $_gitname

	make DESTDIR="${pkgdir}" install
}
