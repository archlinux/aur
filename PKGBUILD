# Maintainer: Manuel Thalmann <m@nuth.ch>
# Contributor: LinuxSquare <linuxscripting.sh@gmail.com>
_year=2022
pkgname=efisc$_year-bin
pkgver=1.1.1_27
pkgrel=1
pkgdesc="Software des Kantons Thurgau für die Steuererklärung 2022"
arch=('x86_64')
url="https://steuerverwaltung.tg.ch/hilfsmittel/efisc-steuererklaerungssoftware/download-efisc2022.html/14104"
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
	'68788d8e633962c87538d586e8db4b611b91278fa3ff14e7d3b1b98d478836b9'
  '0c1b44b7def9ae9fd542fde64074437076c149f26d5d4298d6270de86eab16fa'
  '5b2b4978da80ac1ef53c71f98569b93759ecfe84f4e48d3df8735192ba4140a5'
  '0fcaad4f1ae57e33d4067b806773c1f4184964ba3897ac8b4454674439a00442'
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
