# Maintainer: Tree Davies <tdavies.aur@darkphysics.net>
# SPDX-License-Identifier: GPL-2.0-or-later

pkgname=udon
pkgver=0.04
pkgrel=1
epoch=1
pkgdesc="Minimalistic CLI based End to End Encrypted (E2EE) message passing tool/service."
arch=('any')
url="https://github.com/treedavies/udon"
license=('GPL')
groups=()
depends=('openssl' 'python-pip')
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
source=("https://github.com/treedavies/udon/archive/refs/tags/udon-v0.04.tar.gz")
noextract=()
sha256sums=("574cb92f4b98af1ff776e8e079ef4919e9650c485be99c5d4ef0ad63e6fe3ef3")
validpgpkeys=()

package() {
	cd "udon-$pkgname-v$pkgver"

	# Crate Directories and INSTALL FILES
	install -d -m 755 -o root "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root ./src/udon "$pkgdir"/usr/bin/udon.d
	ln -s /usr/bin/udon.d/udon "$pkgdir"/usr/bin/udon

	install -m 444 -o root LICENSE "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/libudon.py "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/test_libudon.py "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/udon_init.py "$pkgdir"/usr/bin/udon.d
	cp -r src/modules "$pkgdir"/usr/bin/udon.d
	install -m 755 -o root src/udon.proto "$pkgdir"/usr/bin/udon.d
	install -d -m 755 -o root "$pkgdir"/usr/bin/udon.d/udon-venv

	# Install PIP packages to python virtua environment
	python3 -m venv "$pkgdir"/usr/bin/udon.d/udon-venv

	# INSTALL PYTHON VIRTUAL ENVIRONMENT MODULES
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install beautifulsoup4
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install cffi
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install config
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install cryptography
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install google
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install grpcio-tools
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install protobuf
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install pycparser
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install setuptools
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install soupsieve
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install python-daemon
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m pip install psutil

	# BUILD PROTOBUFFERS	
	PROTO_PATH="$pkgdir/usr/bin/udon.d/"
	"$pkgdir"/usr/bin/udon.d/udon-venv/bin/python3 -m grpc_tools.protoc --proto_path=$PROTO_PATH udon.proto --python_out=$PROTO_PATH --grpc_python_out=$PROTO_PATH

}


