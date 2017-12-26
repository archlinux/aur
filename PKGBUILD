# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=osquery-git
pkgver=2.11.1.r0.g489ec3fc
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
			 'gtest' 'gmock' 'lldpd' 'lld' 'zstd' 'rapidjson' 'apt' 'dpkg'
			 'rpm-org' 'python2-jinja' 'librdkafka-git' 'augeas>=1.9.0'
			 'boost>=1.65.1' 'boost-libs>=1.65.1')
conflicts=()
backup=('etc/osquery/osquery.conf')
options=(!strip)
_gitcommit='b1f2888c8f101f1941a4377635e35f0b4ad9980e'
#source=("${pkgname}::git+https://github.com/facebook/osquery"
source=("${pkgname}::git+https://github.com/facebook/osquery#commit=${_gitcommit}"
		"osqueryd.conf.d"
		"osqueryd.service"
		"arch-linux.patch")
sha256sums=('SKIP'
            'ee15a171f114f47a326d236a7d03a07cc3e711016e9a5039638e6137f63e87ec'
            '0c28be3fb234325c3279aa3c02a5b0636db833c06f89ec551b77addb86507ce4'
            '97b9f3b92f07797cc8027b4dcaef2ae9025d08367030364befe3a8895ededeb3')

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
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
		-DBUILD_GMOCK=OFF \
		-DCMAKE_VERBOSE_MAKEFILE=ON

	find . -type f -name link.txt -exec sed -i -re 's/Bstatic -lgflags/Bdynamic -lgflags/g' "{}" \;

	make ${MAKEFLAGS} all
}

package() {
	cd $_gitname

	make DESTDIR="${pkgdir}" install

	# Remove legacy init script
	rm "${pkgdir}/usr/etc/init.d/osqueryd" && rmdir "${pkgdir}/usr/etc/init.d"

	install -dm755 "${pkgdir}/var/osquery/"
	install -dm755 "${pkgdir}/var/log/osquery/"

	install -Dm644 "${srcdir}/osqueryd.conf.d" \
		"${pkgdir}/etc/conf.d/osqueryd"

	install -Dm644 "${srcdir}/osqueryd.service" \
		"${pkgdir}/usr/lib/systemd/system/osqueryd.service"

	install -Dm644 "${pkgdir}/usr/share/osquery/osquery.example.conf" \
		"${pkgdir}/etc/osquery/osquery.conf"
}
