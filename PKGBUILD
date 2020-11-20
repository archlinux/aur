# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antoine Detante <antoine.detante@gmail.com>

pkgname=bitwarden-server
pkgver=1.38.1
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
sha512sums=('70e172014b21c60ad7135d3c11b1c73274be846fa51529c9401176eccd7caaab89414e545779d5a49f2a5498ffffe4359e0c811d29fa3dcd1c98ff9b97cdfd06'
            'b090165d6aacf0186c01c0949b54a97760cc62698a14baed52b678648163e64357848724ac313b9870499d4eec59f7736db119ca3b578cbcc86c9e3a03b0d3cb'
            '737e87e9af8fe9a069fb007df6ef664966ff2e8d767689efc7266c6c58d81963b2f92a1817d589e1d952394be382c1d5fa7fbcff64eb14a029cc45c8c517bf17'
            'e3e466b55523a88833a6bdbecb29fd7af883f39e8e1812ab4469076923b36bd670d3868a265a054f29445260a06684191b214ac83f837eb1f38d701041879329'
            'dd840b75abfae563f0b0edee6516935e04aff826ba0bed670a3d20375622c2fad3aa0c7a598df9427f45bd192d962c18d6254f43f6910859c257f81b2e2834f7'
            '747006cfda4c6b1dddb75f5c70a42344e228460a765aa4a3569382c48f3cf72c087c6787e59cef716f2073ceb7b9a24829f71b7cd0cc8718858f89903adb1435'
            'e0cca7c4ef3f17e65490280cb3e56e2577f1e82e61f0e25b95cfd7ae1bdbb8f86ea769a80aaa4a76bf3757b4ef753731a9a970502d0412f4c6a821d7c14e280f'
            '58cfaba7a932bfd0f157b3ebb18f7376d6d70cfd738a0a96973028530371d2b17568ee5fbafe11ea1649c1102319696b9537ee550b0f4034f35f2c315d8251fc'
            'd7764965ae1b9dc0adb563cd3f6946aa19b06957bd517402423fd1e14a4f1713cc8500648874c72e7fd521cedabfae49b05ec594bcfe945e9ae392fb6891c5d5'
            'ca96f48024653e82dcafc1b6055f4ded512573cb76e2b134aedcb147f74dd72ef52af3a0c91b1fc665061ef36ab7397bc170cc4ca42545b2f32968694b6ba89f'
            '741bee960146a9f560538aec06837db8e43586daa87acae2f38b24bd71c0d353b49f594875b67ef07a68b1398b971b7248897b119c207aaf23f76095e5aadf6a'
            '1e43eb233d9a9cfced9acadc200ae94c0b52b8c639fa4e27530d1ed0395dd01195e10125068a0f27318d3810acf50f46bfbad0053c3be77194f5f7358db5a1ef'
            '61d27daac298f13f46fa971139cbe6da2c64fd3b1a08b6060eb76efb7b54de3386a88646868bec6dc4e20667f6f5b9e26dcae7a7601b1abb35baf2e54d1ff39d'
            'd87a0ab807b10f9e294a23514f1ae064e52807e0bc8563674588ea1837e521347eabd465adba98c9fd433db6ca4ae5f9349d1b9917e8152dd2e499f83076fd14'
            'a855409628792684ddbc202565bd06f665edc060997e9663dd27c2f2e9d995fc28c05f2e4c0adebffdaa884ac52712b864a2b8967fba47fcf6f06504e07c7ab2'
            '955bad567fd295bb0255e16609ef5999b59682d37ca5390997204168d90056f27e006d2f5a3dd4a597e0ffee72ce330da1da9434986bd52e416b38b13a94c445')

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
