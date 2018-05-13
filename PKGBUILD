# Maintainer: Antoine Detante <antoine.detante@gmail.com>
pkgname=bitwarden-server
pkgver=1.19.0
pkgrel=1
pkgdesc="Open source password management solutions for individuals, teams, and business organizations."
arch=('x86_64')
url="https://github.com/bitwarden"
license=(AGPL-3.0)
depends=(
	docker
)
makedepends=(
	openssl
)
backup=(
	etc/bitwarden/global.env
	etc/bitwarden/uid.env
	etc/bitwarden/mssql.env
	var/lib/bitwarden/identity/identity.pfx
)
install=bitwarden.install
source=(
	app-id.json
	uid.env
	global.env
	mssql.env
	nginx-default.conf
	settings.js
	bitwarden-server.service
	bitwarden-admin.service
	bitwarden-api.service
	bitwarden-attachments.service
	bitwarden-icons.service
	bitwarden-identity.service
	bitwarden-mssql.service
	bitwarden-nginx.service
	bitwarden-web.service
	bitwarden-sysuser.conf
)
md5sums=('0dcdbbb718832cecf19da5c3bbb481e1'
         '84d8a6a0eefc33752a1d5f564509ba4f'
         '2fc12753445f3d48fc929d320cb31e12'
         '8846cdf9e1b00cd70ba92cbd6d8ea652'
         'ac85d667e8842f9647429746a0f962b5'
         '128086b1346a3542b8a5958ecbe2d7a9'
         '9124b5ec3c799b1b1a433e85a5ade921'
         '8b4bd7b222fba118009ca7a976a77039'
         'd650ed51bef9b9d5960928a2a75df947'
         '7fa95353a04d76ddcd3a7478b14459f7'
         'c654f0958ba0af603af24ca43b89af0e'
         '5011742e7be53c6e439540f8a231ff01'
         '9072db1c0560945fcfac572d34ba5678'
         '2359641bcd0ab5546217aed1574c2f0f'
         'fce431796ab48c0a39c446fb0e9fcd27'
         '4f9373e3810b0b55d2350c5057cfded3')

prepare() {
	# Generate random passwords
	DB_PASSWORD=$(openssl rand -hex 16)
	ID_CERT_PASSWORD=$(openssl rand -hex 16)
	DUO_AKEY=$(openssl rand -hex 32)

  # Configure global.env
	sed -i "s/#DB_PASSWORD#/$DB_PASSWORD/" $srcdir/global.env
	sed -i "s/#ID_CERT_PASSWORD#/$ID_CERT_PASSWORD/" $srcdir/global.env
	sed -i "s/#DUO_AKEY#/$DUO_AKEY/" $srcdir/global.env

  # Configure mssql.env
	sed -i "s/#DB_PASSWORD#/$DB_PASSWORD/" $srcdir/mssql.env

  # Generate IdentityServer keypair and certificate
	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout $srcdir/identity.key -out $srcdir/identity.crt -subj '/CN=Bitwarden IdentityServer/' -days 10950
	# Export to PKCS12
	openssl pkcs12 -export -out $srcdir/identity.pfx -inkey $srcdir/identity.key -in $srcdir/identity.crt -certfile $srcdir/identity.crt -passout pass:$ID_CERT_PASSWORD
  # Remove key and certificate
  rm $srcdir/identity.{key,crt}
}

package() {
	# Create bitwarden directories
	mkdir -p $pkgdir/etc/bitwarden
	mkdir -p $pkgdir/var/lib/bitwarden/mssql/data
	mkdir -p $pkgdir/var/lib/bitwarden/mssql/backups
	mkdir -p $pkgdir/var/lib/bitwarden/web
	mkdir -p $pkgdir/var/lib/bitwarden/core
	mkdir -p $pkgdir/var/lib/bitwarden/core/attachments
	mkdir -p $pkgdir/var/lib/bitwarden/identity
	mkdir -p $pkgdir/var/lib/bitwarden/nginx
	
	mkdir -p $pkgdir/var/log/bitwarden/mssql
	mkdir -p $pkgdir/var/log/bitwarden/api
	mkdir -p $pkgdir/var/log/bitwarden/identity
	mkdir -p $pkgdir/var/log/bitwarden/admin
	mkdir -p $pkgdir/var/log/bitwarden/nginx

	# Install config files
	install -m 700 $srcdir/global.env $pkgdir/etc/bitwarden/global.env
	install -m 700 $srcdir/uid.env $pkgdir/etc/bitwarden/uid.env
	install -m 700 $srcdir/mssql.env $pkgdir/etc/bitwarden/mssql.env
	install -m 700 $srcdir/nginx-default.conf $pkgdir/var/lib/bitwarden/nginx/default.conf
	install -m 700 $srcdir/app-id.json $pkgdir/var/lib/bitwarden/web/app-id.json
	install -m 700 $srcdir/settings.js $pkgdir/var/lib/bitwarden/web/settings.js
	install -m 700 $srcdir/identity.pfx $pkgdir/var/lib/bitwarden/identity/identity.pfx

	# Install systemd services
	install -D -m 644 $srcdir/bitwarden-server.service $pkgdir/usr/lib/systemd/system/bitwarden-server.service
	install -D -m 644 $srcdir/bitwarden-admin.service $pkgdir/usr/lib/systemd/system/bitwarden-admin.service
	install -D -m 644 $srcdir/bitwarden-api.service $pkgdir/usr/lib/systemd/system/bitwarden-api.service
	install -D -m 644 $srcdir/bitwarden-attachments.service $pkgdir/usr/lib/systemd/system/bitwarden-attachments.service
	install -D -m 644 $srcdir/bitwarden-icons.service $pkgdir/usr/lib/systemd/system/bitwarden-icons.service
	install -D -m 644 $srcdir/bitwarden-identity.service $pkgdir/usr/lib/systemd/system/bitwarden-identity.service
	install -D -m 644 $srcdir/bitwarden-mssql.service $pkgdir/usr/lib/systemd/system/bitwarden-mssql.service
	install -D -m 644 $srcdir/bitwarden-nginx.service $pkgdir/usr/lib/systemd/system/bitwarden-nginx.service
	install -D -m 644 $srcdir/bitwarden-web.service $pkgdir/usr/lib/systemd/system/bitwarden-web.service

	# Sysuser
	install -D -m 644 $srcdir/bitwarden-sysuser.conf $pkgdir/usr/lib/sysusers.d/bitwarden.conf
}