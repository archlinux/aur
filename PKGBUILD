# Maintainer: LinRs <LinRs at users.noreply.github.com>
# Contribtor: Paul Burton <paulburton89@gmail.com>
# Contributor: Zebulon <zeb@zebulon.org.uk>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=aacskeys
pkgver="0.4.0e"
_dmover="dmo7"
pkgrel=7.4
pkgdesc="A library and program to retrieve decryption keys for HD discs"
arch=("i686" "x86_64")
url="http://cyberside.net.ee/ripping/BD_DeviceKeys"
license=('custom:Public Domain')
depends=("openssl-1.0")
makedepends=("java-environment" "premake")
source=("https://deb-multimedia.org/pool/main/a/aacskeys/${pkgname}_${pkgver}.orig.tar.gz"
	"https://deb-multimedia.org/pool/main/a/aacskeys/${pkgname}_${pkgver}-${_dmover}.diff.gz")
sha1sums=('8790f0d4098d6bc83304ad2136cc9681374df83a'
	  '481c737983332a4a38aab0b292ba0cd958bb629c')

prepare() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/${pkgname}_${pkgver}-${_dmover}.diff"

  # Make sure use resent premake
  sed -i 's|/usr/local/ssl/include|/usr/include|' premake.lua
  sed -i 's|/usr/local/ssl/lib|/usr/lib|' premake.lua
  sed -i 's|/usr/lib/jvm/java-6-sun/include|$JAVA_HOME/include|' premake.lua

  # Can't build with openssl 1.1 so use openssl-1.0 instead... a patch's welcome
  sed -i 's|OPENSSL_INCLUDE = "/usr/include"|OPENSSL_INCLUDE = "/usr/include/openssl-1.0"|' premake.lua
  sed -i 's|OPENSSL_LIB = "/usr/lib"|OPENSSL_LIB = "/usr/lib/openssl-1.0"|' premake.lua
  sed -i 's|/usr/local/ssl/include|/usr/include/openssl-1.0|' *.make
  sed -i 's|/usr/local/ssl/lib|/usr/lib/openssl-1.0|' *.make

  # Can run with modern premake
  sed -i 's|@premake|@premake4|' Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Ensure that openssl-1.0 is really used
  CPPFLAGS+=" -I/usr/include/openssl-1.0" \
  LDFLAGS+=" -L/usr/lib/openssl-1.0" \

  make OPENSSL_INCLUDE="/usr/include/openssl-1.0/" OPENSSL_LIB="/usr/lib/openssl-1.0/"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install lib
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/share/dumphd/"
  cp -v "lib/linux/"*.so "${pkgdir}/usr/lib/"
  cp -v "${pkgdir}/usr/lib/libaacskeys.so" "${pkgdir}/usr/share/dumphd/libaacskeys.so"


  # Install program
  mkdir -p "${pkgdir}/usr/bin"
  cp -v "bin/linux/aacskeys" "${pkgdir}/usr/bin"

  # Install resources
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -v ./debian/HostKeyCertificate_PS3.txt "${pkgdir}/usr/share/${pkgname}/HostKeyCertificate.txt"
  cp -v ./debian/ProcessingDeviceKeysSimple.txt "${pkgdir}/usr/share/${pkgname}/"

  # Author just say is public domain on upstream user forum thread once but later 
  # 	it went MiA so no full license or ammend exist for the next maintainer
  #	who update it more and neither for the last one responsible of this version.
  #install -D -m644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgbase}/license"
}
