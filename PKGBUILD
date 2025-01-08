# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Godeps <godeps@protonmail.com>
# Contributor: Faaris Ansari <faaris.ansari@pm.me>
# Contributor: Chris Severance <aur.severach@spamgourmet.com>
# Contributor: Det <nimetonmaili@gmail.com>

_majorver=8
_jvmdir=/usr/lib/jvm/java-${_majorver}-graalvm-ee/
pkgname="jdk${_majorver}-graalvm-ee-bin"
pkgver=21.3.11
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_majorver} version"
arch=('x86_64')
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
install="$pkgname.install"
# tarball must be manually downloaded from https://www.oracle.com/downloads/graalvm-downloads.html
source=("local://graalvm-ee-java${_majorver}-linux-amd64-${pkgver}.tar.gz"
        'graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('d6543e19616752ffe8338e8531d7bada8da249fa944f8a16e94f03636e717b8b'
            'SKIP')

package() {
	# Grab all contents of tarball and extract to correct places
	install -dm 755 "${pkgdir}${_jvmdir}"
	cp -ar "${srcdir}/graalvm-ee-java${_majorver}-${pkgver}/." "${pkgdir}${_jvmdir}"

	# License
	cd "${srcdir}/graalvm-ee-java${_majorver}-${pkgver}"
	install -DTm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Man pages
	cd "${pkgdir}${_jvmdir}"
	for f in man/man1/* man/ja/man1/* man/ja_JP.UTF-8/man1/*; do
		install -DTm644 "${f}" "${pkgdir}/usr/share/${f/\.1/-graalvm-ee-java${_majorver}.1}"
	done

	# Polyglot hook
	cd "${srcdir}"
	sed "s/JAVA/${_majorver}/g" < "graalvm-ee-rebuild-libpolyglot.hook" > "graalvm-ee-jdk${_majorver}-rebuild-libpolyglot.hook"
	install -DTm644 "graalvm-ee-jdk${_majorver}-rebuild-libpolyglot.hook" "${pkgdir}/usr/share/libalpm/hooks/graalvm-ee-jdk${_majorver}-rebuild-libpolyglot.hook"
}
