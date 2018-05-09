# Maintainer: nutz <nutz[äT]noova(O)de>
# Maintainer: Anthony Danilov <grinderz@protonmail.com>

pkgname=aerospike-tools-bin
pkgrealname=aerospike-tools
pkgver=3.15.3.6
pkgrel=1
pkgdesc="Tools for Aerospike"
arch=('x86_64')
url="http://www.aerospike.com/"
license=('AGPLv3')
depends=(
	'java-runtime'
	'python2'
	'openssl'
	'readline>=7.0.0'
	'readline<8.0.0'
)
optdepends=(
	'python2-argparse: non default option parser'
	'python2-bcrypt: connect to an Aerospike Cluster with security enabled'
	'python2-pexpect: collect system statistics for remote hosts'
	'python2-toml: configuration files support'
	'python2-jsonschema: configuration files support'
	'python2-pyopenssl: connect to an Aerospike Cluster using SSL'
	'python2-pyasn1: connect to an Aerospike Cluster using SSL'
)


sha256sums=('bdc177068dcbed5320d2e26f8afb72cdf78fa479af2ccf52e9b3e9cbfff9fb08')
source=("http://www.aerospike.com/download/tools/${pkgver}/artifact/ubuntu16")

prepare() {
	cd ${srcdir}/${pkgrealname}-${pkgver}-ubuntu16.04/
	ar x ${pkgrealname}-${pkgver}.ubuntu16.04.x86_64.deb
	tar xf data.tar.xz
}

package() {
	cd "${srcdir}/${pkgrealname}-${pkgver}-ubuntu16.04"
	
	cp -ar etc "${pkgdir}/etc"
	cp -ar opt "${pkgdir}/opt"
	cp -ar usr "${pkgdir}/usr"

	for file in {add_python_path,aerospike_nagios.py,asadm,asgraphite,remove_python_path,ssl_context.py,asinfo,asloglatency}; do
		sed -i '1s/python/python2/' "${pkgdir}/opt/aerospike/bin/${file}"
	done

	sed -i '1s/python/python2/' "${pkgdir}/opt/aerospike/lib/python/citrusleaf.py"
	sed -i 's/libreadline.so.6/libreadline.so.7/g' "$pkgdir/opt/aerospike/bin/aql"
}
