# Maintainer: delthas <arch@delthas.fr>
pkgname=procertum-simplysign-desktop
pkgver=2.9.14
_fullver=${pkgver}-9.4.3.0
pkgrel=1
pkgdesc="Creation of secure electronic signatures using a mobile device."
arch=(x86_64)
url="https://support.certum.eu/en/software/procertum-smartsign/"
license=("LicenseRef-${pkgname}-software-license")
install="${pkgname}.install"
depends=("gcc-libs" "libxml2-legacy" "glib2" "dbus" "sqlite" "fontconfig" "hicolor-icon-theme")
optdepends=("procertum-smartsign: create and verify signatures using the cloud certificate"
            "osslsigncode: sign Windows executables (Authenticode) with the cloud certificate"
            "pkcs11-provider: OpenSSL PKCS#11 provider backend used by osslsigncode"
            "opensc: pkcs11-tool to inspect the token and export the certificate")
source=(
	"https://files.certum.eu/software/SimplySignDesktop/Linux-Ubuntu/${_fullver}/SimplySignDesktop-${_fullver}-x86_64-prod-ubuntu.bin"
	"ccsca2021.der::https://repository.certum.pl/ccsca2021.cer"
)
md5sums=('36a19c83255d35f51d09a1f299845177'
         '8c36fe1381de5ebbbaed200e535c0548')

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
	cd "${srcdir}/${pkgname}-${pkgver}/SSD-$pkgver-dist"

	install -d "$pkgdir/usr/lib/$pkgname"
	# Use cp -a, not install: the bundled Qt5/ICU/OpenSSL libraries ship as
	# SONAME symlink chains that install(1) would dereference into many full copies.
	cp -a lib* SimplySign*.so SimplySignDesktop.xml CACerts languages plugins "$pkgdir/usr/lib/$pkgname/"
	install -Dm755 -t "$pkgdir/usr/lib/$pkgname" SimplySignDesktop

	# Certum's bundled CACerts omits the (non-EV) Certum Code Signing 2021 CA
	# intermediate, so code-signing certs cannot be verified / chained. Add it.
	install -Dm644 "$srcdir/ccsca2021.der" "$pkgdir/usr/lib/$pkgname/CACerts/ccsca2021.der"

	# Expose the cloud PKCS#11 module system-wide, like the upstream installer does.
	# SimplySign Desktop loads it via LD_LIBRARY_PATH; proCertum SmartSign finds it on
	# java.library.path (/usr/lib), enabling cloud signing when both packages are installed.
	_pkcs=$(basename SimplySignPKCS_64-MS-*.so)
	ln -rs "$pkgdir/usr/lib/$pkgname/$_pkcs" "$pkgdir/usr/lib/libSimplySignPKCS.so"

	mkdir -p "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/$pkgname
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/$pkgname/plugins
export OPENSSL_CONF=/etc/ssl/
# Seed the per-user config on first run: SimplySign Desktop crashes without a
# current \$HOME/SimplySignDesktop.xml, and a package must not write to \$HOME at
# build/install time. On upgrades a stale config may need refreshing (see .install).
[ -f "\$HOME/SimplySignDesktop.xml" ] || cp /usr/lib/$pkgname/SimplySignDesktop.xml "\$HOME/SimplySignDesktop.xml"
exec /usr/lib/$pkgname/SimplySignDesktop
EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"

	install -Dm644 icon_64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

	sed -i -E 's|(Exec=).*|\1'"/usr/bin/$pkgname"'|gm' SimplySignDesktop.desktop
	sed -i -E 's|(Icon=).*|\1'"$pkgname"'|gm' SimplySignDesktop.desktop
	install -Dm644 SimplySignDesktop.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" licenses/SimplySignDesktop_*_licence.rtf
}
