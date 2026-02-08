# Maintainer: Alessandro Bernardello
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ente-auth-bin
pkgver=4.4.15
pkgrel=1
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
sha256sums=('89fd2f93895c233f9c270dff7eff46a7f38504eee8e7829d4d48653a72d8a2fa')
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
	# add StartupWMClass to desktop file
	desktop-file-edit --set-key=StartupWMClass --set-value=io.ente.auth "$pkgdir/usr/share/applications/enteauth.desktop"
}
