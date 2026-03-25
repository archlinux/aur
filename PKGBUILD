# Maintainer: Alessandro Bernardello
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ente-auth-bin
pkgver=4.4.17
pkgrel=2
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://ente.io/auth"
license=('AGPL-3.0-or-later')
depends=(
	'libayatana-appindicator'
	'libsecret'
	'org.freedesktop.secrets'
	'xdg-user-dirs'
)
optdepends=(
	# https://github.com/ente-io/ente/issues/4414
	'zenity: Required for importing files'
)
source=("https://github.com/ente-io/ente/releases/download/auth-v${pkgver}/ente-auth-v${pkgver}-${CARCH}.deb")
sha256sums=('4f3bcde329da4d1226dd4532a833b1989ad2cd49faad1123365d5438ed31c7ef')
provides=("ente-auth")
conflicts=("ente-auth")

package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}/"
	install -d "${pkgdir}/usr/bin"
	ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"

	# hopefully temporary: v4.4.15 added an invalid version field
	# that optional field should indicate a version of the desktop entry specification, not the app version. see: https://specifications.freedesktop.org/desktop-entry/latest/recognized-keys.html
	# again it's optional and previous versions didn't have it, i'll just remove it for now
	sed -i '/^Version=/d' "$pkgdir/usr/share/applications/enteauth.desktop"
}
