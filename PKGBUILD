# Contribtor: Paul Burton <paulburton89@gmail.com>
# Contributor: Zebulon <zeb@zebulon.org.uk>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=aacskeys
pkgver="0.4.0e"
pkgrel=3
pkgdesc="A library and program to retrieve decryption keys for HD discs"
arch=("i686" "x86_64")
url="http://forum.doom9.org/showthread.php?t=123311"
license=("custom")
depends=("openssl")
makedepends=("java-environment" "premake3")
source=("http://deb-multimedia.org/pool/main/a/aacskeys/${pkgname}_${pkgver}.orig.tar.gz"
	"http://deb-multimedia.org/pool/main/a/aacskeys/${pkgname}_${pkgver}-dmo2.diff.gz")
sha1sums=('8790f0d4098d6bc83304ad2136cc9681374df83a'
	  '325504f38a5ac1e9f7be740a602faa2c8d4b812c')

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../${pkgname}_$pkgver-dmo2.diff

  # Paranoia: remove binaries, make sure they aren't used
  rm -rf bin lib

  # If java-environement is installed for the first time
  # we need to source profile script to set JAVA_HOME
  if [ -z $JAVA_HOME ]; then
	[ -e /etc/profile.d/openjdk6.sh ] && source /etc/profile.d/openjdk6.sh
	[ -e /etc/profile.d/jdk.sh ] && source /etc/profile.d/jdk.sh
	[ -e /etc/profile.d/jdk7.sh ] && source /etc/profile.d/jdk7.sh
  fi

  sed -i 's|/usr/local/ssl/include|/usr/include|' premake.lua
  sed -i 's|/usr/local/ssl/lib|/usr/lib|' premake.lua
  sed -i "s|/usr/lib/jvm/java-6-sun/include|$JAVA_HOME/include|" premake.lua

  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install lib
  mkdir -p ${pkgdir}/usr/lib
  cp lib/linux/*.so ${pkgdir}/usr/lib/

  # Install program
  mkdir -p ${pkgdir}/usr/bin
  cp bin/linux/aacskeys ${pkgdir}/usr/bin

  # Install resources
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp ./debian/HostKeyCertificate_PS3.txt ${pkgdir}/usr/share/${pkgname}/HostKeyCertificate.txt
  cp ./debian/ProcessingDeviceKeysSimple.txt ${pkgdir}/usr/share/${pkgname}/
}
