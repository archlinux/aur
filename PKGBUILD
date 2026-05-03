# Maintainer: PureFallen <archlinux.snoring858@passmail.net>
# Contributor: Godeps <Godeps@protonmail.com>
# Previously based on nns's jdk17-graalvm-ee-bin AUR package

_majorver=11
_jvmdir=/usr/lib/jvm/java-${_majorver}-graalvm-ee/
pkgname="jdk${_majorver}-graalvm-ee-bin"
pkgver=21.3.18
pkgrel=1
epoch=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_majorver} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom:OTN')
depends=('java-runtime-common'
	 'java-environment-common'
         'ca-certificates-utils')
makedepends=()
optdepends=("graal-nodejs-jdk${_majorver}-bin: Node.js component (used to be bundled with this package before the 21.1.0 release)")
provides=("java-runtime=${_majorver}"
	  "java-runtime-headless=${_majorver}"
	  "java-environment=${_majorver}")
options=('staticlibs'
	 '!debug')
install="$pkgname.install"
source=('graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('7dc37bd3703ebebcd6efa39534e6bb6e3ec9c8ee0d97e46d6df5349739c7d2ca')
# tarball must be manually downloaded from https://www.oracle.com/downloads/graalvm-downloads.html
source_x86_64=("local://graalvm-ee-java${_majorver}-linux-amd64-${pkgver}.tar.gz")
sha256sums_x86_64=('b5b543e407453742a0aafed715c9fe1d5dc55ab359a3ecb9e770401253fe5a01')
source_aarch64=("local://graalvm-ee-java${_majorver}-linux-aarch64-${pkgver}.tar.gz")
sha256sums_aarch64=('719bd2aa57fd13c85396769d53f9c34b506682e00a1e86c5c40bfe9e712f4670')

package() {
	# Grab all contents of tarball and extract to correct places
	install -dm 755 "${pkgdir}${_jvmdir}"
	cp -ar "${srcdir}/graalvm-ee-java${_majorver}-${pkgver}/." "${pkgdir}${_jvmdir}"

	# License
	cd "${srcdir}/graalvm-ee-java${_majorver}-${pkgver}"
	install -DTm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Man pages
	cd "${pkgdir}${_jvmdir}"
	for f in man/man1/*; do
		install -DTm644 "${f}" "${pkgdir}/usr/share/${f/\.1/-graalvm-ee-java${_majorver}.1}"
	done

	# Polyglot hook
	cd "${srcdir}"
	sed "s/JAVA/${_majorver}/g" < "graalvm-ee-rebuild-libpolyglot.hook" > "graalvm-ee-jdk${_majorver}-rebuild-libpolyglot.hook"
	install -DTm644 "graalvm-ee-jdk${_majorver}-rebuild-libpolyglot.hook" "${pkgdir}/usr/share/libalpm/hooks/graalvm-ee-jdk${_majorver}-rebuild-libpolyglot.hook"
}
