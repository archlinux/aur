# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Hartmann <thomas@th-ht.de>
pkgname=htcondor
pkgver=8.8.10
pkgrel=1
epoch=
pkgdesc="Distributed workload management system"
arch=("x86_64")
url="https://research.cs.wisc.edu/htcondor/"
license=('apache')
groups=()
depends=("boost" "munge" "libxss" "curl" "gawk" "java-runtime" "libcgroup" "pcre" "sqlite" "python")
makedepends=("cmake")
checkdepends=()
optdepends=()
provides=("htcondor")
conflicts=("htcondor")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/htcondor/htcondor/archive/V${pkgver//./_}.tar.gz")
noextract=()
md5sums=('8d7c3c62cab5931973cb9e95523e0103')
validpgpkeys=()

build() {
	cd "htcondor-${pkgver//./_}"
	mkdir -p build_folder
	cd build_folder
	cmake -DSYSTEM_NAME=arch -DWITH_VOMS=False -DWITH_GLOBUS=False -DWITH_PYTHON_BINDINGS=False -DCMAKE_INSTALL_PREFIX=/opt/htcondor ../
	make
}

package() {
	cd "htcondor-${pkgver//./_}/build_folder"
	make DESTDIR="$pkgdir/" install

	echo "export PATH=$PATH:/opt/htcondor/bin" > $srcdir/htcondor.sh
	install -Dm644 $srcdir/htcondor.sh $pkgdir/etc/profile.d/htcondor.sh
}
