# Maintainer: LinRs <LinRs at users.noreply.github.com>
# Contribtor: Paul Burton <paulburton89@gmail.com>
# Contributor: Zebulon <zeb@zebulon.org.uk>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=aacskeys
pkgver="0.4.0f"
_origpkgver="0.4.0e"
_dmover="dmo7"
pkgrel=10
pkgdesc="A library and program to retrieve decryption keys for HD discs"
arch=("i686" "x86_64")
url="http://cyberside.net.ee/ripping/BD_DeviceKeys"
license=('custom:Public Domain')
depends=("openssl")
makedepends=("java-environment" "premake3")
source=("https://archive.deb-multimedia.org/pool/main/a/${pkgname}/${pkgname}_${_origpkgver}.orig.tar.gz"
	      "https://archive.deb-multimedia.org/pool/main/a/${pkgname}/${pkgname}_${_origpkgver}-${_dmover}.diff.gz"
        "aacskeys-0.4.0f.patch"
        "001-aacskeys-OpenSSL-build-fixes.patch"
        "002-BN_bn2bin-fix.patch")
sha1sums=('8790f0d4098d6bc83304ad2136cc9681374df83a'
          '481c737983332a4a38aab0b292ba0cd958bb629c'
          'dca9a9cb6bdd4cf6c4f7cbef1be3556728166117'
          '1b55ac6b6c31b603c0cf4970dcff6833fa77c86f'
          '7329ef386c87a4de02d00510b64d0844997becb2')

prepare() {
  zcat ${pkgname}_${_origpkgver}-${_dmover}.diff.gz > ${srcdir}/${pkgname}_${_origpkgver}-${_dmover}.diff
  cd "${srcdir}/${pkgname}-${_origpkgver}"
  patch -Np1 -i "${srcdir}/${pkgname}_${_origpkgver}-${_dmover}.diff"
  patch -Np1 -i ../aacskeys-0.4.0f.patch
  patch -Np1 -i ../001-aacskeys-OpenSSL-build-fixes.patch
  patch -Np1 -i ../002-BN_bn2bin-fix.patch

  # Make sure use resent premake
  sed -i 's|/usr/local/ssl/include|/usr/include|' premake.lua
  sed -i 's|/usr/local/ssl/lib|/usr/lib|' premake.lua
  sed -i "s|/usr/lib/jvm/java-6-sun/include|/usr/lib/jvm/$(archlinux-java get)/include|" premake.lua
}

build() {
  cd "${srcdir}/${pkgname}-${_origpkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_origpkgver}"

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
