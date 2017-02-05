# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>

_name=netbox
pkgname=${_name}
pkgver=1.8.4
pkgrel=1
pkgdesc="IP address management (IPAM) and data center infrastructure management (DCIM) tool."
arch=('any')
url="https://github.com/digitalocean/${_name}"
license=('Apache-2.0')
depends=('python'
         'gunicorn'
         'libffi'
         'libpgf'
         'openssl'
         'python-crypto'
         'python-cryptography'
         'python-django'
         'python-django-debug-toolbar-git'
         'python-django-filter'
         'python-django-rest-framework'
         'python-django-rest-swagger0.3.10'
         'python-django-tables2'
         'python-graphviz'
         'python-lxml'
         'python-markdown'
         'python-natsort'
         'python-ncclient'
         'python-netaddr'
         'python-paramiko'
         'python-py-gfm'
         'python-psycopg2'
         'python-sqlparse'
         'python-xmltodict'
				 'python-yaml')

conflicts=("${_name}-git")
replaces=("${_name}-git")
install="${_name}.install"
source=("${url}/archive/v${pkgver}.tar.gz"
        "${_name}-system.service"
        "${_name}.tmpfile"
				"debug_toolbar_middleware.patch"
				"gunicorn_config.py")
sha256sums=('f59d46affde19cb2c0f84d535293d5068c0b4aaa3bffd1a01ad4b272afb1e1cb'
            '12bb0253aea3dd763ee8bb1a17064256155b79e904a4350abf89cf4c65235951'
            '1028bac96ddcd18c10646dff26027b4891fcab4381436e2b6ea3302887a5586f'
            '2d6d55cad836eca187a7dfe40227f994e9b2f565e71fd39e296bc8bb73bf259a'
            '7a5ae05cad7ec14193a43ef080776b5525c80b6258762a6cb6a108db83861ff9')
backup=('etc/netbox/gunicorn_config.py' 'etc/netbox/configuration.py')

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"

	patch -p0 -i "${srcdir}"/debug_toolbar_middleware.patch
}

package() {
	mkdir -p "${pkgdir}/opt/${_name}"
	chmod 775 "${pkgdir}/opt/${_name}"
	cp -r ${_name}-${pkgver}/${_name} "$pkgdir/opt/"

	install -D -m644 ${_name}-system.service "$pkgdir/usr/lib/systemd/system/${_name}.service"
	install -D -m644 ${_name}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${_name}.conf"

	mkdir -p "$pkgdir/etc/netbox"
	install -D -m644 gunicorn_config.py "$pkgdir/etc/netbox/gunicorn_config.py"
	install -D -m644 ${_name}-${pkgver}/${_name}/${_name}/configuration.example.py "$pkgdir/etc/netbox/configuration.py"
	ln -s /etc/netbox/configuration.py "$pkgdir/opt/netbox/netbox/configuration.py"
}

# vim: set ts=2 sw=2 ft=sh noet:
