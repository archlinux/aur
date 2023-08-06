# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>
# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

_gitname="webvirtcloud"
pkgname=("${_gitname}-git")
pkgver=20230711.1220.82de7f4
pkgrel=5
pkgdesc="WebVirtCloud is virtualization web interface for admins and users"
arch=("x86_64")
url="https://github.com/retspen/webvirtcloud"
license=("Apache")
# rwlock is no longer required for python3.x
depends=(
	"python"
	"python-django"
	"python-django_bootstrap5"
	"python-django-icons"
	"python-django-login-required-middleware"
	"gunicorn"
	"python-libsass"
	"libvirt-python"
	"python-lxml"
	"python-qrcode"
	"websockify"
	"python-zipp"
	"python-ldap3"
	"python-engineio"
	"python-socketio"
	"python-eventlet"
	"python-django-rest-framework"
	"python-drf-nested-routers"
	"python-drf-yasg"
	"python-markdown"
)
makedepends=("git")
provides=("webvirtcloud")
conflicts=("webvirtcloud" "webvirtmgr" "webvirtmgr-git")
options=("!strip" "!emptydirs")
install="${pkgname}.install"
source=("${_gitname}::git+https://github.com/retspen/webvirtcloud.git"
        "webvirtcloud.ini"
        "webvirtcloud.nginx.conf.sample")
md5sums=("SKIP"
         "20b3b5476227c4108110b4b561e582c7"
         "4572258a85dcb0ef1010d717e48d0431")

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo "$(git log -1 --format="%cd" --date=short | sed "s/-//g").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_gitname}"

	cp "${_gitname}/settings.py.template" "${_gitname}/settings.py"
	echo "STATIC_ROOT = '/usr/lib/webvirtcloud/'" >> "${_gitname}/settings.py"
	sed -i -e "s/SECRET_KEY = \"\"/SECRET_KEY = \"12345678901234567890123456789012345678901234567890\"/g" webvirtcloud/settings.py
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/webvirtcloud"
	cp -r "${srcdir}/webvirtcloud" "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/usr/lib/webvirtcloud/.git"

	install -dm0755 "${pkgdir}/etc/supervisor.d"
	install -Dm0644 "${srcdir}/webvirtcloud.ini" "${pkgdir}/etc/supervisor.d/webvirtcloud.ini"
	install -dm0755 "${pkgdir}/etc/nginx/conf.d"
	install -Dm0644 "${srcdir}/webvirtcloud.nginx.conf.sample" "${pkgdir}/etc/nginx/conf.d/webvirtcloud.nginx.conf.sample"
}
