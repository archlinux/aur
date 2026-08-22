# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
# Contributor: mehalter <micah at mehalter.com>
# Contributor: OpenPrivacy <maildrop AT comedia DOT com>
# Contributor: Cyrinux <pkgbuilds AT levis DOT name>
# Contributor: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>
pkgname=openscap
pkgver=1.4.4
pkgrel=3
pkgdesc='Open Source Security Compliance Solution'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://www.open-scap.org/'
license=('LGPL-2.1-or-later')
depends=(
	'acl'
	'bash'
	'bzip2'
	'curl'
	'dbus'
	'glibc'
	'libcap'
	'libgcrypt'
	'libgcc'
	'libxml2'
	'libxslt'
	'libyaml'
	'pcre2'
	'perl'
	'python'
	'util-linux-libs'
	'xmlsec'
)
makedepends=(
	'cmake'
	'openssl'
	'swig'
)
checkdepends=(
	'perl-xml-parser'
	'perl-xml-xpath'
)
optdepends=(
	'libguestfs: oscap-vm utility for scanning virtual machines'
	'openssh: oscap-ssh utility for scanning remote hosts'
	'podman: oscap-podman utility for scanning containers'
	'python-docker: oscap-docker utility for scanning containers'
	'python-requests: oscap-docker utility for scanning containers'
	'rpm-tools: scap-as-rpm utility for creating RPM packages'
)
provides=('libopenscap.so' 'libopenscap_sce.so')
source=("https://github.com/OpenSCAP/openscap/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c69736bee997e50a04aff8e4f22da880f342190e1289c5df0fb73b7af34833d3bd9f4e5055b227a18d571167671f821701a09f8c9a3e4568c7da68cc4be51133')

prepare() {
	sed -i 's|:/usr/local/bin$|:/usr/local/bin:/usr/bin/vendor_perl|' \
		"$pkgname-$pkgver/tests/test_common.sh.in"
	sed -i -e 's/PyInt_Check/PyLong_Check/g' \
		-e 's/PyInt_AsLong/PyLong_AsLong/g' \
		-e 's/PyString_AsString/PyBytes_AsString/g' \
		"$pkgname-$pkgver/swig/openscap.i"
}

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_DISABLE_FIND_PACKAGE_RPM=ON \
		-DCMAKE_DISABLE_FIND_PACKAGE_SELinux=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure \
		-R '^API/OVAL/unittests/(test_count_function|test_int_comparison|test_ipv4_comparison|test_variable_conversion)\.sh$'
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
