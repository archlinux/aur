# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=osquery-git
pkgver=2.4.0.r2.g31b78cb9
pkgrel=1
pkgdesc="SQL powered operating system instrumentation, monitoring, and analytics."
arch=('i686' 'x86_64')
url="https://osquery.io"
license=('BSD')
depends=('wget' 'unzip')
makedepends=('asio' 'audit' 'aws-sdk-cpp-git' 'git' 'clang' 'benchmark'
			 'make' 'cmake' 'doxygen' 'gflags' 'google-glog' 'linenoise'
			 'llvm' 'lsb-release' 'beecrypt' 'python-jinja' 'python-pip'
			 'sleuthkit' 'snappy' 'yara' 'thrift' 'magic' 'cpp-netlib'
			 'python-jinja' 'python-psutil' 'python-pexpect' 'rocksdb-lite'
			 'augeas' 'boost' 'boost-libs' 'lldpd' 'apt' 'dpkg' 'rpm-org')
backup=('etc/osquery/osquery.conf')
options=(!strip)
_gitcommit="31b78cb996c78c35a4a2ce759c99c49975e877e6"
#source=("${pkgname}::git+https://github.com/facebook/osquery"
source=("${pkgname}::git+https://github.com/facebook/osquery#commit=${_gitcommit}"
		"osqueryd.conf.d"
		"osqueryd.service"
		"arch-linux.patch")
sha256sums=('SKIP'
            '3aea1799571f6ddab8d4c9820686fb64e7989e8121a98747a65326cd9f62f7e1'
            '7b1082c9a74e11b02fa6d8410e987db64be2e097f84fcd346e7feef8c1e8a104'
            '3494a662165f4862f3bc6c575ae11f36448ade01a2f316a03f95612de2d08163')

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

	patch -p1 -F3 -i "${srcdir}/arch-linux.patch"

	find . -type f -name '*apt_sources*' -delete
	find . -type f -name '*deb_package*' -delete
	find . -type f -name '*rpm_package*' -delete

	make format_master
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

	[[ -z $DEBUG ]] || unset DEBUG
	cmake -Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_CXX_FLAGS="-I/usr/include/libxml2" \
		-DCMAKE_VERBOSE_MAKEFILE=ON

	find . -type f -name link.txt -exec sed -i -re 's/Bstatic -lgflags/Bdynamic	-lgflags/g' "{}" \;

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
