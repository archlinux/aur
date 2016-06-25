# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

pkgname=storcli
_pkgname=StorCLI
pkgver=1.19.04
pkgrel=3
_pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards, also works with some Dell PERC RAID cards (successor to megaraid-cli)"
arch=('i686' 'x86_64')
url="https://www.thomas-krenn.com/en/wiki/StorCLI"
license=('custom')
makedepends=('rpmextract')
install=${pkgname}.install
conflicts=('megaraid-cli')

if [[ "${CARCH}" == 'x86_64' ]];
then
  _arch='amd64'
  _bits='64'
elif [[ "${CARCH}" == 'i686' ]];
then
  _arch='i386'
  _bits=''
fi

#source_x86_64=("http://archive.thomas-krenn.com/packages/pool/optional/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
#		"${pkgname}_${pkgver}_amd64.deb.sig")
#source_i686=("http://archive.thomas-krenn.com/packages/pool/optional/s/${pkgname}/${pkgname}_${pkgver}_i386.deb"
#		"${pkgname}_${pkgver}_i386.deb.sig")

# got from http://www.avagotech.com/products/server-storage/raid-controllers/megaraid-sas-9361-8i#downloads but they don't allow direct downloading. welp.
source=("https://square-r00t.net/files/arch/${pkgname}/${pkgver}_${_pkgname}.zip"
	"${pkgver}_${_pkgname}.zip.sig")
sha512sums=('3086360a4c40755cdcaa8faa7192adccae5555cf3aaa741be583fa3559a7dedc14652489d8248a69465040871710917d09461644df3d1d2d31fe6d6e0957196b'
            'SKIP')

build() {
	cd ${srcdir}/${pkgname}_all_os/Linux
	# Ugh. Avago doesn't distribute binaries, only RPMs. Lame.
        rpmextract.sh ${pkgname}-${pkgver}-${_pkgrel}.noarch.rpm
}

package() {
	#ar x ${pkgname}_${pkgver}_${_arch}.deb
	#tar -zxf data.tar.gz
	#install -D -m755 "${srcdir}/usr/sbin/storcli${_bits}" "${pkgdir}/usr/bin/storcli"

	install -d -m 0755 ${pkgdir}/usr/bin
	install -d -m 0755 ${pkgdir}/usr/share/${pkgname}
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	install -m 0755 "${srcdir}/${pkgname}_all_os/Linux/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m 0755 "${srcdir}/${pkgname}_all_os/Linux/opt/MegaRAID/${pkgname}/${pkgname}${_bits}" "${pkgdir}/usr/bin/${pkgname}"
	install -m 0644 "${srcdir}/${pkgname}_all_os/EFI/UDK/storcli.efi" "${pkgdir}/usr/share/${pkgname}/${pkgname}.efi"
}

