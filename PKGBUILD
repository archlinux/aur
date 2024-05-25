# Maintainer: Carl Kittelberger <icedream@icedream.pw>
pkgname=procertum-diagnostic
pkgver=1.3.9
pkgrel=2
epoch=
pkgdesc="Diagnostic tool for proCertum cards."
arch=(x86_64)
url="https://www.support.certum.eu/en/cert-offer-card-manager/"
license=(unknown)
provides=()
source=(
	"https://files.certum.eu/software/proCertumDiagnostic/Linux-Ubuntu/${pkgver}/proCertumDiagnostic-${pkgver}-${CARCH}-ubuntu.bin"
)
md5sums=('2b8ea61ebe05fe4fa268f568cbbff465')

prepare() {
	sh "./proCertumDiagnostic-${pkgver}-${CARCH}-ubuntu.bin" --noexec --keep --nox11 --nochown --target "${srcdir}/${pkgname}-${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	#./zz_install

	INSTALL_DIR="$pkgdir/opt/proCertumDiagnostic"

	USER_DESKTOP_FILE=proCertumDiagnostic.desktop

	mkdir -p "$INSTALL_DIR"
	cp -R -a * "$INSTALL_DIR"
	chown -R root:root "$INSTALL_DIR"
	chmod 755 "$INSTALL_DIR"

	# remove installer scripts
	rm "$INSTALL_DIR"/zz_* "$INSTALL_DIR"/proCertumDiagnostic_uninstall

	# install link to binary
	mkdir -p "$pkgdir/usr/bin"
	ln -rs "$pkgdir/opt/proCertumdiagnostic/proCertumDiagnostic" "$pkgdir/usr/bin/"

	# install desktop file
	mkdir -p "$pkgdir/usr/share/applications"
	cp -R -a "$USER_DESKTOP_FILE" "$pkgdir/usr/share/applications/"

	# install license
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$INSTALL_DIR"/licenses/*
}
