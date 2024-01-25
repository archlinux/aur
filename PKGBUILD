# Maintainer: LinuxSquare <linuxscripting.sh@gmail.com>
pkgname=efisc-bin
pkgver=2023_1.0.2_33
pkgrel=1
pkgdesc="Steuererklärungssoftware des Kantons Thurgau"
arch=('x86_64')
url="https://steuerverwaltung.tg.ch/hilfsmittel/efisc-steuererklaerungssoftware.html/2958"
license=('unknown')
install=${pkgname%%-*}.install
depends=(
	"hicolor-icon-theme"
	"sh"
)
source=(
	"https://efisc.kttg.ch/update/eFisc/${pkgver%%_*}/${pkgname%%-*}${pkgver//_/-}.x86_64.rpm"
	"${pkgname%%-*}${pkgver%%_*}.sh.patch"
	"${pkgname%%-*}_desktop.patch"
	"sanitycheck.patch"
)
sha256sums=(
	"07232d36c1e31c13ffed22218293f67195e77d92673b81a135c2a40f83463c77"
	"64f77136e77a8b211d597ceb2d67276b489139db201395fb60020e30a6b10bb5"
	"6453b8b8ac94e90951a63b72aec0a519ba260b510a11c703cf5f678fece8edd9"
	"e0d70d13f21ca2b3cc2bb83b1510b1cbf6a7040477d74b913a0a3e67d4fb305c"
)

package() {
	install -D -m644 "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}/jre/legal/jdk.xml.dom/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%%-*}/LICENSE"

	install -d "${pkgdir}/usr/share/java"
	cp -rp "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}" "${pkgdir}/usr/share/java"
	patch "${pkgdir}/usr/share/java/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.sh" < "${srcdir}/${pkgname%%-*}${pkgver%%_*}.sh.patch"
	patch "${pkgdir}/usr/share/java/${pkgname%%-*}${pkgver%%_*}/sanitycheck.sh" < "${srcdir}/sanitycheck.patch"

	cp -rp "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.sharedmimeinfo" "${pkgdir}/usr/share/java/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.xml"

	install -d "${pkgdir}/usr/bin"
	ln -sf "${pkgdir}/usr/share/java/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.sh" "${pkgdir}/usr/bin/${pkgname%%-*}"

	install -Dp "${srcdir}/usr/share/${pkgname%%-*}${pkgver%%_*}/${pkgname%%-*}${pkgver%%_*}.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname%%-*}.png"

	install -Dp "${srcdir}/usr/share/applications/${pkgname%%-*}${pkgver%%_*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%%-*}.desktop"
	patch "${pkgdir}/usr/share/applications/${pkgname%%-*}.desktop" <"${srcdir}/${pkgname%%-*}_desktop.patch"
}
