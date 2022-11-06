model="6580cdw"
pkgname="brother-mfc-$model-jpn"
pkgver="20220218"
pkgrel=2
lprver="1.0.1-0"
cwver="1.0.1-0"
pkgdesc="LPR and CUPS drivers for Brother MFC-6580CDW (Japan)"
url="http://support.brother.com/g/s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
depends=('perl' 'a2ps' 'lib32-libcups' 'libcups')
optdepends=('brscan5: Scanner support')
source=("https://download.brother.com/welcome/dlf103148/mfcj${model}cupswrapper-1.0.1-0.i386.deb" "https://download.brother.com/welcome/dlf103146/mfcj${model}lpr-1.0.1-0.i386.deb")
sha256sums=("aedcecaab10ec45f9a164607aa3c3c161d519e4132608ac15411e4d48db07359" "6557d708c0518216c32712bf5665a295f287a5858e79d6e99b09ca31c0ff72e8")

package() {
    ar x mfcj${model}lpr-${lprver}.i386.deb && tar xzvf data.tar.gz
    ar x mfcj${model}cupswrapper-${cwver}.i386.deb && tar xzvf data.tar.gz

    cd opt/brother/Printers/mfcj${model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcj${model}
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}

post_install() {
	post_upgrade;
}

post_upgrade() {
		/opt/brother/Printers/mfcj${model}/cupswrapper/cupswrappermfcj${model} >/dev/null
		if [ "$?" -eq 0 ]; then
				printf "\033[1m\033[32m\x3d\x3d\x3e\033\1330m Done. The printer should be visible now via the CUPS-webinterface (http://localhost:631)\n"
		else
				printf "\033[1m\032[32m\x3d\x3d\x3e\033\1330m Something went wrong...\n"
		fi
}
