#Maintainer: nutz <nutz[äT]noova(O)de>

pkgname=aerospike-tools-bin
pkgrealname=aerospike-tools
pkgver=3.15.0.3
pkgrel=1
pkgdesc="Tools for Aerospike"
arch=('x86_64')
url="http://www.aerospike.com/"
license=('AGPLv3')
depends=(
	'python2-argparse'
	'python2-bcrypt'
	'python2-pyopenssl'
	'python2-pexpect'
	'python2-ply'
)
makedepends=('binutils')
sha256sums=('e582f5390e8853eb0faa9996e028ab7a46251626d629447bf6c8f11b95c290a7')
source=("http://www.aerospike.com/download/tools/${pkgver}/artifact/ubuntu16"
       )

prepare() {
	cd ${srcdir}/${pkgrealname}-${pkgver}-ubuntu16.04/
	ar xv ${pkgrealname}-${pkgver}.ubuntu16.04.x86_64.deb 1>/dev/null
	tar xf data.tar.xz
}

#pkgver() {}

#build() {}

#check() {}

package() {
	mkdir -p -m 755 "${pkgdir}/opt/aerospike/bin"
	mkdir -p -m 755 "${pkgdir}/usr/bin"
	cd ${srcdir}/${pkgrealname}-${pkgver}-ubuntu16.04/opt/aerospike
	for file in $(ls bin); do
		# TODO: aql bla.
		install -m 0755 bin/$file "${pkgdir}/opt/aerospike/bin/${file}"
		ln -s "/opt/aerospike/bin/${file}" "${pkgdir}/usr/bin/${file}"
		sed -i "1s/python/python2/" ${pkgdir}/opt/aerospike/bin/${file}
	done

	mkdir -p -m 755 "${pkgdir}/opt/aerospike/lib/python"
	install -m 0755 lib/python/citrusleaf.py "${pkgdir}/opt/aerospike/lib/python/citrusleaf.py"


	for path in $(find doc/ | sort); do
		if [ -d ${path} ]; then
			mkdir -p -m 755 "${pkgdir}/opt/aerospike/${path}"
		else
			install -m 0644 $path "${pkgdir}/opt/aerospike/${path}"
		fi
	done
}
