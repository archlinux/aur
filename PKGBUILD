# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=budgetcalendar
pkgver=1.9.1266
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
	'09b9fc4177ffd603b3e181c2aaf536eeb9f2f93f600094c9fa91b2cdee4a853c'
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
