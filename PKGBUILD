# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=budgetcalendar
pkgver=1.9.979
pkgrel=1
pkgdesc='Calendar-based budgeting software written in Java'
arch=('i686' 'x86_64')
depends=('java-runtime-headless>=8')
url='http://mishell.ca'
license=('custom')
install="${pkgname}.install"
source=(
	'http://mishell.ca/files/BudgetCalendar.sh'
	'budgetcalendar'
)
sha256sums=(
	'd1a3f7e79da0790db63a2d1a7534de521d174741ff039f1ad8f2165b2f562b46'
	'df39c154a1d1815a688e76235eb6823afcaeb03848959b94927d29b646da8124'
)

build() {
	cd "${srcdir}"

	msg "Extracting package..."
	mkdir "${srcdir}/${pkgname}-${pkgver}"
	echo "y" | sh ./BudgetCalendar.sh -i -u "${srcdir}/${pkgname}-${pkgver}" >/dev/null 2>&1
}

package() {
	cd "${srcdir}"

	install -Dm 755 budgetcalendar "${pkgdir}/usr/share/${pkgname}/budgetcalendar"

	cp -R "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}"

	cd "${pkgdir}"

	msg "Relocating..."
	mv "${pkgdir}"/usr/local/share/Budget/* "${pkgdir}/usr/share/${pkgname}"
	rm -rf "${pkgdir}"/usr/share/${pkgname}/{Budget,uninstall.sh{,.env}} "${pkgdir}/usr/local/bin/"

	rm -rf "${pkgdir}/usr/local"
	myarch=$(uname -m)
	if [ "${myarch}" = "x86_64" ]; then
		swtarch="64"
	else
		swtarch="32"
	fi
	mv "${pkgdir}/usr/share/${pkgname}/swt/${swtarch}/swt.jar" "${pkgdir}/usr/share/${pkgname}/swt/swt.jar"
	rm -rf "${pkgdir}/usr/share/${pkgname}/swt/"{32,64}

	msg "Installing license..."
	install -Dm 644 "${pkgdir}/usr/share/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mv "${pkgdir}/usr/share/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg "Installing documentation..."
	mkdir -p "${pkgdir}/usr/share/doc"
	mv "${pkgdir}/usr/share/${pkgname}/doc" "${pkgdir}/usr/share/doc/${pkgname}"

	msg "Fixing desktop file paths..."
	install -Dm 644 "${pkgdir}/usr/share/${pkgname}/icons/Budget.ico" "${pkgdir}/usr/share/icons/hicolor/32x32/${pkgname}.ico"
	sed -i 's/^Icon=.*/Icon=budgetcalendar.ico/' "${pkgdir}/usr/share/applications/budget-calendar.desktop"
	sed -i 's/^Exec=.*/Exec=\/usr\/bin\/budgetcalendar/' "${pkgdir}/usr/share/applications/budget-calendar.desktop"
}
