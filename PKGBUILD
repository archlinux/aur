pkgname=scylla
pkg_major_minor=1.6
pkgver=${pkg_major_minor}.1
pkgrel=1
pkgdesc="NoSQL data store using the Seastar framework, compatible with Apache Cassandra"
arch=('x86_64')
url="http://www.scylladb.com/"
license=('AGPL')
depends=('antlr3' 'libantlr3c' 'libyaml' 'yaml-cpp' 'lz4' 'zlib' 'snappy'
		 'jsoncpp' 'gnutls' 'ninja' 'ragel' 'libaio' 'crypto++' 'xfsprogs' 'jre8-openjdk-headless'
		 'numactl' 'hwloc' 'libpciaccess' 'libxml2' 'python-pyparsing' 'boost-libs'
		 'lksctp-tools' 'protobuf' 'libunwind' 'systemtap-git' 'dpkg' 'xmlcutty-bin')
makedepends=('git' 'gcc')
provides=('scylla')
source=("git+https://github.com/scylladb/scylla.git#tag=scylla-${pkgver}"
'git+https://github.com/scylladb/scylla-ami.git'
'git+https://github.com/scylladb/scylla-swagger-ui.git'
'git+https://github.com/scylladb/scylla-seastar.git'
'git+https://github.com/scylladb/fmt.git'
'git+https://github.com/scylladb/dpdk.git'
'git+https://github.com/scylladb/c-ares.git'
)
md5sums=('SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

# install dependencies
prepare() {

	# extract source zip
#	unzip -o scylla-${pkgver}.zip || echo 'ignore error'
#	cd ${pkgname}-${pkgname}-${pkgver}
	cd ${pkgname}
	git checkout tags/${pkgname}-${pkgver}
	
	# init submodules
	git submodule init
#	git config submodule.scylla-seastar.url ${srcdir}/scylla-seastar
#	git config submodule.swagger-ui.url ${srcdir}/scylla-swagger-ui
#	git config submodule.dist/ami/files/scylla-ami.url ${srcdir}/scylla-ami
	git submodule update --init --recursive
	
	# init seastar
#	cp -R ${srcdir}/seastar/* seastar
#	cd seastar
#	git submodule init 
#	git config submodule.dpdk.url ${srcdir}/dpdk
#	git config submodule.fmt.url ${srcdir}/fmt
#	git config submodule.c-ares.url ${srcdir}/c-ares
#	git submodule update 
#	cd ..
	
	# downgrade thrift
	wget -c 'http://ala.seblu.net/packages/t/thrift/thrift-0.9.1-3-x86_64.pkg.tar.xz'
	sudo pacman --noconfirm -U thrift-0.9.1-3-x86_64.pkg.tar.xz

	# install antlr3++ headers
	DST=${srcdir}/antlr3
	if [ ! -d "$DST/.git" ]; then 
		rm -rf antlr3
		git clone --depth 1 https://github.com/antlr/antlr3.git
		sudo cp antlr3/runtime/Cpp/include/* /usr/include/
	fi
	
	# compile
	echo `pwd`
	python3 configure.py --mode=release --with=scylla --disable-xen --static
	CORES=`lscpu | grep 0- | tail -n 1 | cut -d '-' -f 2`
	ninja build/release/iotune -j${CORES}
	ninja build/release/scylla -j${CORES}
	
	# download deb scripts
	URL=http://downloads.scylladb.com.s3.amazonaws.com/
	if [ ! -f pkgs.xml ]; then
		wget -c ${URL} -O pkgs.xml
	fi
	xmlcutty -path /ListBucketResult/Contents/Key -rename '\n' pkgs.xml | grep .deb | grep trusty_backup/scylladb-${pkg_major_minor}/ | grep -v '~rc' | grep -v '\-dbg' > pkgs.txt
	
	mkdir -p dpkg
	cat pkgs.txt | cut -d '/' -f 8 | cut -d '_' -f 1 | uniq > pkgs-unique.txt
	cat pkgs-unique.txt | while read line; do 
		FURL="$URL"`cat pkgs.txt | grep ${line} | tail -n 1`
		wget -c "$FURL"; 
		FNAME=`echo "$FURL" | cut -d '/' -f 11`
		echo "extracting $FNAME"
		dpkg-deb -x "$FNAME" dpkg/
	done
}

# packaging
package() {
#	DIR=${pkgname}-${pkgname}-${pkgver}
	DIR=${pkgname}
	src="$srcdir/$DIR/dpkg"

	# lib
	dst="$pkgdir/lib"
	mkdir -p ${dst}
	cp -Rv --preserve=timestamps "$src/lib/"* ${dst}

	# etc
	dst="$pkgdir/etc"
	mkdir -p ${dst}
	cp -Rv --preserve=timestamps "$src/etc/"* ${dst}
	
	src="$src/usr"
	
	# usr/share
	dst="$pkgdir/usr/share"
	mkdir -p ${dst}
	cp -Rv --preserve=timestamps "$src/share/"* ${dst}

	# usr/lib
	dst="$pkgdir/usr/lib"
	mkdir -p ${dst}
	cp -Rv --preserve=timestamps "$src/lib/"* ${dst}
		
	# remove missing symlink
	rm "$dst/scylla/jmx/symlinks/scylla-jmx"
	
	# usr/bin
	dst="$pkgdir/usr/bin"
	mkdir -p ${dst}
	cp -Rv --preserve=timestamps "$src/bin/"* ${dst}
	
	# overwrite with built 
	src="$srcdir/$DIR/build/release"
	install -p -m755 "$src/scylla" ${dst}
	install -p -m755 "$src/iotune" ${dst}
}
