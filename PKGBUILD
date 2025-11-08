# Contributor: charlesneimog <charlesneimog@outlook.com>
# Contributor: Asuka Minato
# Contributor: elementh <hello@lucasmarino.me>
# Contributor: Ash Price <eisleggje@gmail.com>
# Contributor: Adrian Perez <aperez@igalia.com>
#
# WARNING WARNING WARNING WARNING WARNING    
# IMPORTANT: MIGRATION
#                                            If you are coming from the > 0.3.2 BETA please read the instructions:
# 
# 1. Install `anytype-legacy`
# 2. Follow the instructions HERE: https://community.anytype.io/t/anytype-legacy-to-migration-trail-guide/9274 
#    UP to the point 2., BUT NOT 3.
# 3. Now install `anytype-bin` (this package) and now you can follow point 3. and login with the recovery phrase.
# 
# Thanks.
#                                            
pkgname=anytype-electron-bin
pkgver=0.50.5
pkgrel=2
pkgdesc="Operating environment for the new internet. Anytype is a next generation software that breaks down barriers between applications, gives back privacy and data ownership to users."
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=(electron37 bash libsecret hicolor-icon-theme)
makedepends=('asar')
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy')
source=(
	"https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}/anytype_${pkgver}_amd64.deb"
)
sha256sums=('70fcb18c7ba133ca0415d036d5bb79ab46ea29446b6bd91041e8e12f958a985d')

package() {
	bsdtar -xf data.tar.* -C "$pkgdir"
	find "$pkgdir/opt" -type f -not -path '*/resources/*' -delete

	asar extract "$pkgdir/opt/Anytype/resources/app.asar" app.unpacked
	sed -e '/^module\.exports/s,.*,module.exports = isEnvSet ? getFromEnv : false;,' \
		-i app.unpacked/node_modules/electron-is-dev/index.js
	echo 'module.exports = true;' \
		> app.unpacked/node_modules/electron-util/source/is-using-asar.js
	asar pack app.unpacked "$pkgdir/opt/Anytype/resources/app.asar"

	install -Dm755 /dev/stdin "$pkgdir/opt/Anytype/anytype" <<-EOF
	#! /bin/sh
	exec electron37 --gtk-version=3 /opt/Anytype/resources/app.asar "\$@"
	EOF
}
