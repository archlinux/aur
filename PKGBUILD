# Maintainer: Aaron Coach <aur at ezpz dot cz>
# Contributor: Nikolay Bryskin <devel.niks at gmail dot com>
# Contributor: Carlos Galindo <carlos.s.galindo (at) gmail.com>

_npmname=meshcentral
_npmver=1.1.19
pkgname=meshcentral
pkgver=1.1.19
pkgrel=1
pkgdesc="The open source, multi-platform, self-hosted, feature packed web site for remote device management"
arch=(any)
url="https://meshcentral.com/info/"
license=(Apache)
#makedepends=('npm')
depends=('npm' 'nodejs<19')
optdepends=('nodejs-acme-client: Auto trusted TLS certificate support'
	'nodejs-modern-syslog: syslog support'
	'nodejs-nodemailer: SMTP support'
	'nodejs-passport-saml: SAML authentication support')
backup=('etc/meshcentral/config.json')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz"
	"$_npmname.service"
	"$_npmname.sysusers"
	"$_npmname.tmpfiles")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('842604b4798be3d9a0b465204b417ee8b26e0a98c10fae6b19cae08a6cfbffd2'
	'd88ad4d11395bd13a4aa64829bf03977ac3511134be2dbe875b95c7243e5bf92'
	'd907415d1be94568c92d3a05e70dd855f004ebed2c4170f5c2d2f36c0dfd5199'
	'ba5d7e33bc3ce9ce33d20b23e8632af8f1e1507908bba3e91dae1a0cf460ddcc')

package() {
	cd "$srcdir"
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver \
		archiver@5.3.2 \
		body-parser@1.20.2 \
		cbor@5.2.0 \
		compression@1.7.4 \
		cookie-session@2.0.0 \
		express@4.18.2 \
		express-handlebars@5.3.5 \
		express-ws@4.0.0 \
		ipcheck@0.1.0 \
		minimist@1.2.8 \
		multiparty@4.2.3 \
		@yetzt/nedb \
		node-forge@1.3.1 \
		ua-parser-js@1.0.36 \
		ws@8.14.2 \
		yauzl@2.10.0 \
		passport \
		passport-saml \
		nodemailer@6.9.8 \
		otplib@10.2.3 \
		keygrip

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	# Remove references to package and source directories
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	# Our additional files
	install -D "${srcdir}/$_npmname.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -D "${srcdir}/$_npmname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$_npmname.conf"
	install -D "${srcdir}/$_npmname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$_npmname.conf"

	# Default configuration
	install -D "${pkgdir}/usr/lib/node_modules/$_npmname/sample-config-advanced.json" "${pkgdir}/etc/$_npmname/config.json"
}

# vim:set ts=2 sw=2 et:
