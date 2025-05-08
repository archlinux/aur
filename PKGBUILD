# Maintainer: LinuxSquare <linuxscripting.sh@gmail.com>
pkgname=efisc-bin
pkgver=2024_1.0.9_63
pkgrel=1
pkgdesc="Steuererklärungssoftware des Kantons Thurgau"
arch=('x86_64')
url="https://steuerverwaltung.tg.ch/hilfsmittel/efisc-steuererklaerungssoftware.html/2958"
license=('unknown')
install=${pkgname%%-*}.install
options=(!debug)
depends=(
	"hicolor-icon-theme"
	"sh"
)
source=(
	"https://efisc.kttg.ch/update/eFisc/${pkgver%%_*}/${pkgname%%-*}${pkgver//_/-}.x86_64.rpm"
	"${pkgname%%-*}${pkgver%%_*}.sh.patch"
	"${pkgname%%-*}_desktop.patch"
)
sha256sums=(
	'aaf1fa6b562d28441064cdbceb84513e4b3e3c1dcdb270cf0732f47f1b93d1a9'
  '550f1b121d4846b0c40e592d1b17e30930fd97890dadc68c691dae7d810ab4a8'
  'a5d26c833df228f3a1609ae40623abd2e29fb2696aeb31122c9ec26f7186230e'
)

package() {
	install -D -m644 "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}/jre/legal/jdk.xml.dom/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%%-*}/LICENSE"

	install -d "${pkgdir}/usr/share/java"
	cp -rp "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}" "${pkgdir}/usr/share/java"
	patch "${pkgdir}/usr/share/java/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.sh" < "${srcdir}/${pkgname%%-*}${pkgver%%_*}.sh.patch"
	#patch "${pkgdir}/usr/share/java/${pkgname%%-*}${pkgver%%_*}/sanitycheck.sh" < "${srcdir}/sanitycheck.patch"

	cp -rp "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.sharedmimeinfo" "${pkgdir}/usr/share/java/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.xml"

	install -d "${pkgdir}/usr/bin"
	ln -sf "/usr/share/java/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.sh" "${pkgdir}/usr/bin/${pkgname%%-*}"

	install -Dp "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname%%-*}.png"

	install -Dp "${srcdir}/usr/share/applications/${pkgname%%-*}${pkgver%%_*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%%-*}.desktop"
	patch "${pkgdir}/usr/share/applications/${pkgname%%-*}.desktop" <"${srcdir}/${pkgname%%-*}_desktop.patch"
}
