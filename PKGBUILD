# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

_gitname="webvirtcloud"
pkgname=("${_gitname}-venv-git")
pkgver=20170309.276.531ea1e
pkgrel=1
pkgdesc="WebVirtCloud is virtualization web interface for admins and users"
arch=("x86_64")
url="https://github.com/retspen/webvirtcloud"
license=("Apache")
depends=("python2" "libvirt" "libxml2")
makedepends=("git" "python2-virtualenv" "python2-pip")
provides=("webvirtcloud" "webvirtcloud-git")
conflicts=("webvirtcloud" "webvirtcloud-git" "webvirtmgr" "webvirtmgr-git")
backup=("usr/lib/webvirtcloud/gunicorn.conf.py"
	"usr/lib/webvirtcloud/db.sqlite3")
options=("!strip" "!emptydirs")
install="${_gitname}.install"
source=("${_gitname}::git+https://github.com/retspen/webvirtcloud.git"
	"webvirtcloud-staticroot.patch"
	"webvirtcloud.sysusers"
	"webvirtcloud.sh"
	"webvirtcloud.service"
	"webvirtcloud-novncd.sh"
	"webvirtcloud-novncd.service"
	"manage.sh")
md5sums=("SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP")

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo "$(git log -1 --format="%cd" --date=short | sed "s/-//g").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/webvirtcloud"
	cp -r "${srcdir}/webvirtcloud" "${pkgdir}/usr/lib"

	cd "${pkgdir}/usr/lib/webvirtcloud"

	rm -rf .git Dockerfile Vagrantfile .gitignore .travis.yml

	patch -p1 < "${srcdir}/webvirtcloud-staticroot.patch"
	sed -i -e "s/^\(libvirt-python\)==.*$/\1/g" conf/requirements.txt

	virtualenv2 venv

	for f in venv/bin/easy_install venv/bin/easy_install-2.7 venv/bin/pip venv/bin/pip2 venv/bin/pip2.7 venv/bin/wheel
	do
		sed -i -e "s@^#\!/.*${pkgname}/pkg/${pkgname}/usr/lib/webvirtcloud/venv/bin/python2@#\!/usr/bin/env python2@g" ${f}
	done
	sed -i -e "s@^#\!/.*${pkgname}/pkg/${pkgname}/usr/lib/webvirtcloud/venv/bin/python@#\!/usr/bin/env python@g" ${f} venv/bin/python-config

	. venv/bin/activate
	pip2 install -U pip
	pip2 install -r conf/requirements.txt

	for f in venv/bin/django-admin venv/bin/django-admin.py venv/bin/f2py venv/bin/gunicorn venv/bin/gunicorn_django venv/bin/gunicorn_paster venv/bin/websockify
	do
		sed -i -e "s@^#\!/.*${pkgname}/pkg/${pkgname}/usr/lib/webvirtcloud/venv/bin/python2@#\!/usr/bin/env python2@g" ${f}
	done

	sed -i -e "s@STATIC_ROOT = .*@STATIC_ROOT = '${pkgdir}/usr/lib/webvirtcloud'@g" webvirtcloud/settings.py
	python2 manage.py collectstatic --noinput
	sed -i -e "s@STATIC_ROOT = .*@STATIC_ROOT = '/usr/lib/webvirtcloud/'@g" webvirtcloud/settings.py
	python2 manage.py migrate --noinput

	sed -i -e "s@VIRTUAL_ENV=.*\$@VIRTUAL_ENV=\"/usr/lib/webvirtcloud/venv\"@g" venv/bin/activate
	sed -i -e "s@setenv VIRTUAL_ENV .*\$@setenv VIRTUAL_ENV \"/usr/lib/webvirtcloud/venv\"@g" venv/bin/activate.csh
	sed -i -e "s@set -gx VIRTUAL_ENV .*\$@set -gx VIRTUAL_ENV \"/usr/lib/webvirtcloud/venv\"@g" venv/bin/activate.fish

	install -dm0755 "${pkgdir}/var/lib/webvirtcloud"
	mv "${pkgdir}/usr/lib/webvirtcloud/db.sqlite3" "${pkgdir}/var/lib/webvirtcloud/"
	ln -s "${pkgdir}/var/lib/webvirtcloud/db.sqlite3" "${pkgdir}/usr/lib/webvirtcloud/"
	mv "${pkgdir}/usr/lib/webvirtcloud/gunicorn.conf.py" "${pkgdir}/var/lib/webvirtcloud/"
	ln -s "${pkgdir}/var/lib/webvirtcloud/gunicorn.conf.py" "${pkgdir}/usr/lib/webvirtcloud/"
	chown -R 600:600 "${pkgdir}/var/lib/webvirtcloud"

	install -dm0755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm0644 "${srcdir}/webvirtcloud.sysusers" "${pkgdir}/usr/lib/sysusers.d/webvirtcloud.conf"

	install -dm0755 "${pkgdir}/usr/lib/webvirtcloud/bin"
	install -Dm0755 "${srcdir}/webvirtcloud.sh" "${pkgdir}/usr/lib/webvirtcloud/bin/"
	install -Dm0755 "${srcdir}/webvirtcloud-novncd.sh" "${pkgdir}/usr/lib/webvirtcloud/bin/"
	install -Dm0755 "${srcdir}/manage.sh" "${pkgdir}/usr/lib/webvirtcloud/bin/"
	install -dm0755 "${pkgdir}/usr/lib/systemd/system"
	install -Dm0644 "${srcdir}/webvirtcloud.service" "${pkgdir}/usr/lib/systemd/system/"
	install -Dm0644 "${srcdir}/webvirtcloud-novncd.service" "${pkgdir}/usr/lib/systemd/system/"
}

