# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

_name=netbox
pkgname=${_name}
pkgver=1.7.1
pkgrel=1
pkgdesc="IP address management (IPAM) and data center infrastructure management (DCIM) tool."
arch=('any')
url="https://github.com/digitalocean/${_name}"
license=('Apache-2.0')
depends=('python2'
         'gunicorn-python2'
         'libffi'
         'libpgf'
         'openssl'
         'python2-crypto'
         'python2-cryptography'
         'python2-django'
         'python2-django-debug-toolbar-git'
         'python2-django-filter'
         'python2-django-rest-framework'
         'python2-django-rest-swagger0.3.10'
         'python2-django-tables2'
         'python2-graphviz'
         'python2-lxml'
         'python2-markdown'
         'python2-natsort'
         'python2-ncclient'
         'python2-netaddr'
         'python2-paramiko'
         'python2-py-gfm'
         'python2-psycopg2'
         'python2-sqlparse'
         'python2-xmltodict')

conflicts=("${_name}-git")
replaces=("${_name}-git")
install="${_name}.install"
source=("${url}/archive/v${pkgver}.tar.gz"
        "${_name}-system.service"
        "${_name}.tmpfile"
				"gunicorn_config.py")
sha256sums=('6c072e1f9cecd42e3c9e30472155c254ba4a305699df29581fa7fca3ed371c97'
            '12bb0253aea3dd763ee8bb1a17064256155b79e904a4350abf89cf4c65235951'
            '1028bac96ddcd18c10646dff26027b4891fcab4381436e2b6ea3302887a5586f'
            '7a5ae05cad7ec14193a43ef080776b5525c80b6258762a6cb6a108db83861ff9')
backup=('etc/netbox/gunicorn_config.py' 'etc/netbox/configuration.py')

package() {
	mkdir -p "${pkgdir}/opt/${_name}"
	chmod 775 "${pkgdir}/opt/${_name}"
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
		$(find "${_name}-${pkgver}/${_name}" -name '*.py')
	cp -r ${_name}-${pkgver}/${_name} "$pkgdir/opt/"

	install -D -m644 ${_name}-system.service "$pkgdir/usr/lib/systemd/system/${_name}.service"
	install -D -m644 ${_name}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${_name}.conf"

	mkdir -p "$pkgdir/etc/netbox"
	install -D -m644 gunicorn_config.py "$pkgdir/etc/netbox/gunicorn_config.py"
	install -D -m644 ${_name}-${pkgver}/${_name}/${_name}/configuration.example.py "$pkgdir/etc/netbox/configuration.py"
	ln -s /etc/netbox/configuration.py "$pkgdir/opt/netbox/netbox/configuration.py"

	find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}

# vim: set ts=2 sw=2 ft=sh noet:
