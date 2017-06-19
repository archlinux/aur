# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

pkgname=storcli
_pkgname=StorCLI
pkgver=1.21.16
pkgrel=1
_pkgrel=1
pkgdesc="CLI program for LSI MegaRAID cards, also works with some Dell PERC RAID cards (successor to megaraid-cli)"
arch=('i686' 'x86_64')
url="https://www.thomas-krenn.com/en/wiki/StorCLI"
license=('custom')
#makedepends=('rpmextract')  # no longer needed! see build()
install=${pkgname}.install
#conflicts=('megaraid-cli')

if [[ "${CARCH}" == 'x86_64' ]];
then
  _arch='amd64'
  _bits='64'
elif [[ "${CARCH}" == 'i686' ]];
then
  _arch='i386'
  _bits=''
fi

# Thanks to sl1pkn07 on AUR for tracking down the actual URL for me!
# ...Which of course no longer works. Thanks to grawity for providing the FreeBSD dist mirror link.
#source=("https://square-r00t.net/files/arch/${pkgname}/${pkgver}_${_pkgname}.zip"
source=("http://docs.avagotech.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_${_pkgname}.zip"
#source=("http://ftp2.za.freebsd.org/pub/FreeBSD/distfiles/${pkgver}_${_pkgname}.zip"
	"${pkgver}_${_pkgname}.zip.sig")
sha512sums=('714d8588566d2baf51cd67e958c9dfdb3f2eb0776a7fa2a9cb46ddad74b8e8a5e1515bf6e3746184b70187c83323b040bf902a2a357e928ad7d3525d3005c71e'
            'SKIP')

build() {
	# they changed their file structure layout. AGAIN.
	cd ${srcdir}/versionChangeSet/univ_viva_cli_rel
	bsdtar -p -C . -xf ./storcli_All_OS.zip
	cd storcli_All_OS/Linux
	ls
	#cd ${srcdir}/${pkgname}_All_OS/storcli_All_OS/Linux

	# Ugh. Avago doesn't distribute binaries, only RPMs. Lame.
        #rpmextract.sh ${pkgname}-${pkgver}-${_pkgrel}.noarch.rpm
	# Thanks to sl1pkn07 on AUR for letting me know bsdtar can do RPMs now. Yay!
	#bsdtar -p -o -C . -xf ./${pkgname}-${pkgver}-${_pkgrel}.noarch.rpm
	# I hate this package. People at Avago need to be fired.
	bsdtar -p -o -C . -xf ./${pkgname}-1.21.06-${_pkgrel}.noarch.rpm
}

package() {
	#ar x ${pkgname}_${pkgver}_${_arch}.deb
	#tar -zxf data.tar.gz
	#install -D -m755 "${srcdir}/usr/sbin/storcli${_bits}" "${pkgdir}/usr/bin/storcli"

	install -d -m 0755 ${pkgdir}/usr/bin
	install -d -m 0755 ${pkgdir}/usr/share/${pkgname}
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	# AVAGO. GET. IT. TOGETHER. STOP CHANGING THE FILE TREE.
	#install -m 0755 "${srcdir}/${pkgname}_All_OS/storcli_All_OS/Linux/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m 0644 "${srcdir}/versionChangeSet/univ_viva_cli_rel/${pkgname}_All_OS/Linux/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# Worst. Company. Ever.
	#install -m 0755 "${srcdir}/${pkgname}_All_OS/storcli_All_OS/Linux/opt/MegaRAID/${pkgname}/${pkgname}${_bits}" "${pkgdir}/usr/bin/${pkgname}"
	install -m 0755 "${srcdir}/versionChangeSet/univ_viva_cli_rel/${pkgname}_All_OS/Linux/opt/MegaRAID/${pkgname}/${pkgname}${_bits}" "${pkgdir}/usr/bin/${pkgname}"
	#install -m 0644 "${srcdir}/${pkgname}_All_OS/storcli_All_OS/EFI/UDK/storcli.efi" "${pkgdir}/usr/share/${pkgname}/${pkgname}.efi"
	install -m 0644 "${srcdir}/versionChangeSet/univ_viva_cli_rel/${pkgname}_All_OS/EFI/UDK/storcli.efi" "${pkgdir}/usr/share/${pkgname}/${pkgname}.efi"
}

