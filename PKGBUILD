# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Pulzer <t.pulzer at thesecretgamer dot de>
pkgname=msigna
pkgver=0.10.2
pkgrel=1
pkgdesc="An interactive desktop application for transacting on the bitcoin network."
arch=('x86_64' 'i686')
url="https://ciphrex.com"
license=('AGPL3' 'MIT')
depends=('qt5-base' 'boost-libs' 'qrencode' 'boost')
makedepends=('libodb-sqlite' 'odb' 'rsync' 'openssl-1.0')
optdepends=('bitcoin-qt')
source=("https://github.com/Faldon/mSIGNA/archive/v$pkgver-AUR.tar.gz")

prepare() {
	cd "$srcdir/mSIGNA-$pkgver-AUR"
	sed -i -e "s#PREFIX=#PREFIX=$pkgdir/usr#g" "build-all.sh"
	sed -i -e "s#VERSION=#VERSION=$pkgver#g" "mSIGNA.desktop"
	sed -i -e "s#COMMENT=#COMMENT=$pkgdesc#g" "mSIGNA.desktop"
	
	# Adding openssl-1.0 headers and libs
	OPENSSL1_0=$(pacman -Qqs ^openssl-1.0$)
	if [ -n "$OPENSSL1_0" ]; then
		OPENSSL_INCLUDES=$(grep -rl "#include <openssl/" *)
		echo $OPENSSL_INCLUDES
		for FILE in $OPENSSL_INCLUDES; do
			sed -i -e 's#<openssl/\(.*\)>#"openssl/\1"#g' $FILE
		done;

		TMPFILES=$(pacman -Qql $(pacman -Qqs ^openssl-1.0$))
		for TMPFILE in $TMPFILES; do
			if [[ $TMPFILE =~ \.h$ ]]; then
				BASEDIR=$(dirname $TMPFILE)
				OPENSSLHEADER=${BASEDIR%openssl}
				break;
			fi
		done;
		OPENSSLLIB=${OPENSSLHEADER/include/lib}
		sed -i -e "s#INCLUDEPATH +=#INCLUDEPATH += $OPENSSLHEADER#g" mSIGNA.pro
		sed -i -e "s#-lcrypto#-L$OPENSSLLIB -lssl -lcrypto#g" mSIGNA.pro
		export CXX_FLAGS="$CXX_FLAGS -I$OPENSSLHEADER"
		export CXXFLAGS="$CXXFLAGS -I$OPENSSLHEADER"
	fi
}

build() {
	cd "mSIGNA-$pkgver-AUR"
	./build-all.sh linux
}

package() {
	cd "mSIGNA-$pkgver-AUR"
	make install
}
md5sums=('9b2df38e34a7790e2961046b24d47eef')
