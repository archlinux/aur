# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matěj Týč <matej.tyc@gmail.com>
pkgname=osquery-git
pkgver=1.8.0.r3.gb9a5313
pkgrel=1
epoch=
pkgdesc="SQL powered operating system instrumentation, monitoring, and analytics."
arch=(any)
url="https://osquery.io"
license=('BSD')
groups=()
depends=('asio' 'audit' 'aws-sdk-cpp-git' 'boost' 'boost-libs' 'clang' 'cmake'
		 'doxygen' 'gflags' 'git' 'google-glog' 'lsb-release' 'make' 'python'
		 'python-jinja' 'python-pip' 'sleuthkit' 'snappy' 'thrift' 'yara')
makedepends=('rocksdb' 'rocksdb-static' 'cpp-netlib' 'magic' 'unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+https://github.com/facebook/osquery"
		"osqueryd.service"
		"arch-linux.patch")
noextract=()
sha256sums=('SKIP'
            '6f1d7950f547ba6e39a67a267c0a8a46424dd9707cec9041a95fb75fc35a3dcf'
            '1d01edee89b505f0cc9d42fcc7a16e580503f444780767c95f17274ff44024b3')
validpgpkeys=()

_gitname=${pkgname}-${pkgver}

pkgver() {
	cd $_gitname

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_gitname

	git submodule update --init
	patch -p1 -i "${srcdir}/arch-linux.patch"
}


build() {
	cd $_gitname

	make deps
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make -j $(nproc) -C osquery DESTDIR="${pkgdir}"
}

package() {
	cd $_gitname

	make DESTDIR="${pkgdir}" install

	install -dm755 "${pkgdir}/var/osquery/"
	install -dm755 "${pkgdir}/var/log/osquery/"

	install -Dm755 "${pkgdir}/usr/share/osquery/osquery.example.conf" \
		"${pkgdir}/etc/osquery/osquery.conf"

	install -Dm755 "${srcdir}/osqueryd.service" \
		"${pkgdir}/usr/lib/systemd/system/osqueryd.service"
}
sha256sums=('SKIP'
            '6f1d7950f547ba6e39a67a267c0a8a46424dd9707cec9041a95fb75fc35a3dcf'
            '5adaeaf699980ef880a2487fab25fa732b3847c780dafb97f2eb9612fbe93328')
sha256sums=('SKIP'
            '6f1d7950f547ba6e39a67a267c0a8a46424dd9707cec9041a95fb75fc35a3dcf'
            '8da0d77bd189f4bb778a6be719322ea8c0cd624d2ad3e76bee584bd1d1259542')
