# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=osquery-git
pkgver=2.1.2.r8.g0b62245
pkgrel=1
epoch=
pkgdesc="SQL powered operating system instrumentation, monitoring, and analytics."
arch=(any)
url="https://osquery.io"
license=('BSD')
groups=()
depends=('asio' 'audit' 'aws-sdk-cpp-git' 'boost' 'boost-libs' 'clang'
		 'cmake' 'doxygen' 'gflags' 'git' 'google-glog' 'linenoise'
		 'lsb-release' 'make' 'python' 'python-jinja' 'python-pip'
		 'sleuthkit' 'snappy' 'thrift' 'yara')
makedepends=('python-jinja' 'python-psutil' 'python-pexpect' 'rocksdb-lite'
			 'benchmark' 'cpp-netlib' 'magic' 'unzip' 'wget')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/osquery/osquery.conf')
options=()
install=
changelog=
_gitcommit="0b62245848992f2d670b794970b31352fbb15121"
source=("${pkgname}::git+https://github.com/facebook/osquery#commit=${_gitcommit}"
		"osqueryd.conf.d"
		"osqueryd.service"
		"linenoise.h"
		"arch-linux.patch")
noextract=()
validpgpkeys=()
sha256sums=('SKIP'
            '3aea1799571f6ddab8d4c9820686fb64e7989e8121a98747a65326cd9f62f7e1'
            '7b1082c9a74e11b02fa6d8410e987db64be2e097f84fcd346e7feef8c1e8a104'
            'ffbd01592bd82771e23b4a85b827df6c1f832bca516389837f4892593c55b105'
            '3331551b1cf61036d0eb5d2867cda3f3f7be3ff86666685e40595d8c63626a21')

_gitname=${pkgname}

#pkgver() {
#	cd $_gitname
#
#	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
	cd $_gitname

	git reset HEAD --hard
	git submodule update --init

	cp -fv "${srcdir}/linenoise.h" "osquery/devtools/linenoise.h"
	patch -p1 -F3 -i "${srcdir}/arch-linux.patch"

	find . -type f -name '*apt_sources*' -delete
	find . -type f -name '*deb_package*' -delete
	find . -type f -name '*rpm_package*' -delete

	make deps
}

build() {
	cd $_gitname

	#SANITIZE_THREAD=True # Add -fsanitize=thread when using "make sanitize"
	#OPTIMIZED=True # Enable specific CPU optimizations (not recommended)
	#SKIP_TESTS=True # Skip unit test building (very very not recommended!)
	#SKIP_BENCHMARKS=True # Build unit tests but skip building benchmark targets
	#SKIP_TABLES=True # Build platform without any table implementations or specs
	#SQLITE_DEBUG=True # Enable SQLite query debugging (very verbose!)
	#export SKIP_TESTS=True SKIP_BENCHMARKS=True

	export PACKAGE=1
	cmake -Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_VERBOSE_MAKEFILE=OFF \
		-DOSQUERY_BUILD_RELEASE=ON

	make -j $(nproc) all
}

package() {
	cd $_gitname

	make DESTDIR="${pkgdir}" install

	# Remove legacy init script
	rm "${pkgdir}/etc/init.d/osqueryd" && rmdir "${pkgdir}/etc/init.d"

	install -dm755 "${pkgdir}/var/osquery/"
	install -dm755 "${pkgdir}/var/log/osquery/"

	install -Dm644 "${srcdir}/osqueryd.conf.d" \
		"${pkgdir}/etc/conf.d/osqueryd"

	install -Dm644 "${srcdir}/osqueryd.service" \
		"${pkgdir}/usr/lib/systemd/system/osqueryd.service"

	install -Dm644 "${pkgdir}/usr/share/osquery/osquery.example.conf" \
		"${pkgdir}/etc/osquery/osquery.conf"
}
