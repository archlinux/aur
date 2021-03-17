# Maintainer: Aleksandr <contact at via dot aur>
# Contributor: Anthony Ruhier <anthony.ruhier@gmail.com>

pkgname=netbox-git
pkgver=v2.10.5.r45.f9f1a4439
pkgrel=1
pkgdesc="IP address management (IPAM) and data center infrastructure management (DCIM) tool."
arch=('any')
url="https://github.com/netbox-community/netbox.git"
license=('Apache-2.0')
depends=('python'
         'gunicorn'
         'libffi'
         'libpgf'
         'openssl'
         'python-coreapi'
         'python-pycryptodomex'
         'python-django'
         'python-django-cors-headers'
         'python-django-debug-toolbar'
         'python-django-filter'
         'python-django-mptt'
         'python-django-rest-framework'
         'python-django-rest-swagger'
         'python-django-tables2'
         'python-graphviz'
         'python-lxml'
         'python-markdown'
         'python-natsort'
         'python-ncclient'
         'python-netaddr'
         'python-openapi-codec'
         'python-paramiko'
         'python-pillow'
         'python-py-gfm'
         'python-pytz'
         'python-psycopg2'
         'python-simplejson'
         'python-xmltodict'
         'python-yaml')

optdepends=('apache' 'nginx' 'postgresql' 'redis')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
install="${pkgname%-git}.install"

source=("netbox::git+$url"
        "${pkgname%-git}.service"
        "${pkgname%-git}-rq.service"
        "${pkgname%-git}.tmpfile"
		    "${pkgname%-git}.sysuser"
	      'gunicorn_config.py')
backup=('etc/netbox/gunicorn.py' 'etc/netbox/configuration.py')

md5sums=('SKIP'
         '1e44aed0029d2e3e2995bcec253586ca'
         '90ea43c475c3d2b6f2e3990e8a3d9899'
         '38488c7c89e416f70e5694b67d1c735c'
         '16c9be659fa0449794edf98b37a54454'
         '054ce4db516adc2147f5180ea56e4653')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

package() {
	cd "$srcdir/${pkgname%-git}"
	
	install -d -m775 "$pkgdir/etc/${pkgname%-git}"
	install -d "$pkgdir/opt/"${pkgname%-git}
	cp -r . "$pkgdir/opt/${pkgname%-git}"

	install -D -m644 ../${pkgname%-git}.service "$pkgdir/usr/lib/systemd/system/${pkgname%-git}.service"
	install -D -m644 ../${pkgname%-git}-rq.service "$pkgdir/usr/lib/systemd/system/${pkgname%-git}-rq.service"
	install -D -m644 ../${pkgname%-git}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
	install -D -m644 ../${pkgname%-git}.sysuser "$pkgdir/usr/lib/sysusers.d/${pkgname%-git}.conf"

	install -d "$pkgdir/etc/${pkgname%-git}"
	install -D -m644 ../gunicorn_config.py "$pkgdir/etc/${pkgname%-git}/gunicorn.py"
	install -D -m644 ${pkgname%-git}/${pkgname%-git}/configuration.example.py "$pkgdir/etc/${pkgname%-git}/configuration.py"
	ln -s /etc/netbox/configuration.py "$pkgdir/opt/${pkgname%-git}/${pkgname%-git}/configuration.py"
}

# vim: set ts=2 sw=2 ft=sh noet:
