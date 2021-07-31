# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Hartmann <thomas@th-ht.de>
pkgname=htcondor
pkgver=9.0.4
pkgrel=1
epoch=
pkgdesc="Distributed workload management system"
arch=("x86_64")
url="https://research.cs.wisc.edu/htcondor/"
license=('apache')
groups=()
depends=("boost" "munge" "libxss" "curl" "gawk" "java-runtime" "libcgroup" "pcre" "sqlite" "python" "boost-python2" "python2-setuptools" "python-setuptools")
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
#source=("$pkgname-$pkgver.tar.gz::https://github.com/htcondor/htcondor/archive/V${pkgver//./_}.tar.gz")
source=("condor-$pkgver-src.tar.gz::https://research.cs.wisc.edu/htcondor/tarball/${pkgver::-2}/$pkgver/release/condor-$pkgver-src.tar.gz")
noextract=()
md5sums=('542bdfe1646f544818eaa99f3bfa5d66')
validpgpkeys=()

build() {
	cd "condor-$pkgver"
	mkdir -p build_folder
	cd build_folder
	cmake -DSYSTEM_NAME=arch -DWITH_VOMS=False -DWITH_GLOBUS=False -DWITH_PYTHON_BINDINGS=True -DCMAKE_INSTALL_PREFIX=/opt/htcondor -DWITH_SCITOKENS=False ../
	make
}

check() {
	cd "condor-$pkgver/build_folder"
	make tests
}

package() {
	cd "condor-$pkgver/build_folder"
	make DESTDIR="$pkgdir/" install

	echo "export PATH=\$PATH:/opt/htcondor/bin" > $srcdir/htcondor.sh
	echo "export PYTHONPATH=\$PYTHONPATH:/opt/htcondor/lib/python" >> $srcdir/htcondor.sh
	install -Dm644 $srcdir/htcondor.sh $pkgdir/etc/profile.d/htcondor.sh
}
