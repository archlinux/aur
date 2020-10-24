# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_name=pEpJNIAdapter
_pkgname=pep-jni-adapter
pkgname=$_pkgname-hg
pkgver=2.1.4
pkgrel=1
pkgdesc="p≡p JNI adapter"
arch=('x86_64' 'i686')
url='https://pep.foundation/dev/repos/pEpJNIAdapter'
license=('GPL3')
makedepends=('mercurial' 'make' 'yml2' 'pep-engine' 'libpep-adapter' 'java-environment')
depends=('pep-engine' 'libpep-adapter' 'java-runtime')
provides=('pep-jni-adapter')
source=("hg+https://pep.foundation/dev/repos/pEpJNIAdapter")
md5sums=('SKIP')

prepare() {	
	cd "$srcdir/$_name"

	hg up "Release_2.1.0"
	
	echo "YML2_PATH=/usr/bin" > 'local.conf'
	echo "ENGINE_INC_PATH=/usr/include" >> 'local.conf'
	echo "ENGINE_LIB_PATH=/usr/lib" >> 'local.conf'
	echo "AD_INC_PATH=$JAVA_HOME/include/linux" >> 'local.conf'
	echo "AD_LIB_PATH=$JAVA_HOME/lib" >> 'local.conf'
}

pkgver() {
	cd "$srcdir/$_name"

	hg tags | grep Release | grep -v RC | sort -r | head -1 | awk '{print $1}' | cut -c9-
}

build() {
	cd "$srcdir/$_name"

	make src
}

package() {
	cd "$srcdir/$_name"

	install -Dm644 "src/libpEpJNI.a" "$pkgdir/usr/lib/libpEpJNI.a"
	install -Dm755 "src/libpEpJNI.so" "$pkgdir/usr/lib/libpEpJNI.so"
	install -Dm644 "src/pEp.jar" "$pkgdir/usr/share/java/pEp.jar"

	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/libpEpJNI/license.txt"
}

