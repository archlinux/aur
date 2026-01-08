# Maintainer: delthas <arch@delthas.fr>
pkgname=procertum-smartsign
pkgver=9.3.4.0
_fullver=2.9.12-${pkgver}
pkgrel=1
pkgdesc="Creation and verification of secure electronic signatures."
arch=(x86_64)
url="https://support.certum.eu/en/software/${pkgname}/"
license=("LicenseRef-${pkgname}-software-license")
depends=("gcc-libs" "java-runtime>=23" "pcsclite")
source=(
	"https://files.certum.eu/software/SimplySignDesktop/Linux-Ubuntu/${_fullver}/SimplySignDesktop-${_fullver}-x86_64-prod-ubuntu.bin"
)
md5sums=('e1e2d2d2e28404b939b54f4d3e376495')

prepare() {
	# Avoid trusting the installer; extract manually from the first gzip header.

	# This is the "naive" command that calls the installer, to extract itself.
	# sh "./SimplySignDesktop-${_fullver}-${CARCH}-prod-ubuntu.bin" --noexec --keep --nox11 --nochown --target "${srcdir}/${pkgname}-${pkgver}"

	# This tells grep not to try to parse Unicode codepoints from the file, since we are doing binary operations.
	export LANG=C
	OFFSET=$(grep -obUaP -m 1 "\x1F\x8B" SimplySignDesktop-${_fullver}-x86_64-prod-ubuntu.bin | cut -d ':' -f 1)
	mkdir -p "${srcdir}/${pkgname}-${pkgver}"
	tail -c +$(($OFFSET+1)) SimplySignDesktop-${_fullver}-x86_64-prod-ubuntu.bin | tar -C "${srcdir}/${pkgname}-${pkgver}" -xzf -
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/SS-$pkgver-dist"

	install -Dm644 -t "$pkgdir/usr/lib/$pkgname" *.jar *.so
	install -Dm755 -t "$pkgdir/usr/lib/$pkgname" *.sh
	install -Dm644 -t "$pkgdir/usr/lib/$pkgname/lib" lib/*

	install -m755 -d "$pkgdir/usr/bin"
	ln -s "/usr/lib/$pkgname/proCertumSmartSign.sh" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 proCertumSmartSign.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

	sed -i -E 's|(Exec=).*|\1'"/usr/bin/$pkgname"'|gm' proCertumSmartSign.desktop
	sed -i -E 's|(Icon=).*|\1'"$pkgname"'|gm' proCertumSmartSign.desktop
	install -Dm644 proCertumSmartSign.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" licenses/proCertumSmartSign_*_licence.rtf
}
