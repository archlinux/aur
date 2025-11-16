# Maintainer: Manuel Thalmann <m@nuth.ch>
# Contributor: LinuxSquare <linuxscripting.sh@gmail.com>
_year=2023
pkgname=efisc$_year-bin
pkgver=1.0.10_56
pkgrel=1
pkgdesc="Software des Kantons Thurgau für die Steuererklärung 2023"
arch=('x86_64')
url="https://steuerverwaltung.tg.ch/hilfsmittel/efisc-steuererklaerungssoftware/download-efisc2023.html/15271"
license=('unknown')
install=${pkgname%%-*}.install
depends=(
	"hicolor-icon-theme"
	"sh"
)
source=(
	"https://efisc.kttg.ch/update/eFisc/$_year/${pkgname%%-*}-${pkgver//_/-}.x86_64.rpm"
	"${pkgname%%-*}.sh.patch"
	"${pkgname%%-*}_desktop.patch"
	"sanitycheck.patch"
)
sha256sums=(
	'805a383fab06ba709a27f5b2cb6cadb1e7b43eee3d659b8776383dd9907438f1'
  '64f77136e77a8b211d597ceb2d67276b489139db201395fb60020e30a6b10bb5'
  '2774d29354382bc108f6189858b8e2c3a7ff22687f773fd5eb85c93798e600bd'
  'e0d70d13f21ca2b3cc2bb83b1510b1cbf6a7040477d74b913a0a3e67d4fb305c'
)

package() {
	install -D -m644 "${srcdir}/usr/share/${pkgname%%-*}/jre/legal/jdk.xml.dom/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%%-*}/LICENSE"

	install -d "${pkgdir}/usr/share/java"
	cp -rp "${srcdir}/usr/share/${pkgname%%-*}" "${pkgdir}/usr/share/java"
	patch "${pkgdir}/usr/share/java/${pkgname%%-*}/${pkgname%%-*}.sh" < "${srcdir}/${pkgname%%-*}.sh.patch"
	patch "${pkgdir}/usr/share/java/${pkgname%%-*}/sanitycheck.sh" < "${srcdir}/sanitycheck.patch"

	cp -rp "${srcdir}/usr/share/${pkgname%%-*}/${pkgname%%-*}.sharedmimeinfo" "${pkgdir}/usr/share/java/${pkgname%%-*}/${pkgname%%-*}.xml"

	install -d "${pkgdir}/usr/bin"
	ln -sf "/usr/share/java/${pkgname%%-*}/${pkgname%%-*}.sh" "${pkgdir}/usr/bin/${pkgname%%-*}"

	install -Dp "${srcdir}/usr/share/${pkgname%%-*}/${pkgname%%-*}.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname%%-*}.png"

	install -Dp "${srcdir}/usr/share/applications/${pkgname%%-*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%%-*}.desktop"
	patch "${pkgdir}/usr/share/applications/${pkgname%%-*}.desktop" <"${srcdir}/${pkgname%%-*}_desktop.patch"
}
