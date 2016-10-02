# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

_gitname="webvirtcloud"
pkgname=("${_gitname}-git")
pkgver=20160711.191.346b96b
pkgrel=1
pkgdesc="WebVirtCloud is virtualization web interface for admins and users"
arch=("x86_64")
url="https://github.com/retspen/webvirtcloud"
license=("Apache")
depends=("libvirt" "libvirt-python" "qemu" "dnsmasq" "bridge-utils" "ebtables" "dmidecode" "python2" "supervisor" "websockify" "python2-django" "gunicorn-python2" "libxml2")
makedepends=("git")
provides=("webvirtcloud" "webvirtcloud-git")
conflicts=("webvirtcloud" "webvirtcloud-git" "webvirtmgr" "webvirtmgr-git")
options=("!strip" "!emptydirs")
install="${pkgname}.install"
source=("${_gitname}::git+https://github.com/retspen/webvirtcloud.git"
        "webvirtcloud.ini"
        "webvirtcloud-staticroot.patch"
        "webvirtcloud.nginx.conf.sample")
md5sums=("SKIP"
         "20b3b5476227c4108110b4b561e582c7"
         "f0b40e21fd861269b41806857bd18d7f"
         "4572258a85dcb0ef1010d717e48d0431")

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo "$(git log -1 --format="%cd" --date=short | sed "s/-//g").$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/webvirtcloud"
	cp -r "${srcdir}/webvirtcloud" "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/usr/lib/webvirtcloud/.git"
	
	cd "${pkgdir}/usr/lib/webvirtcloud"

	patch -p1 < "${srcdir}/webvirtcloud-staticroot.patch"

	install -dm0755 "${pkgdir}/etc/supervisor.d"
	install -Dm0644 "${srcdir}/webvirtcloud.ini" "${pkgdir}/etc/supervisor.d/webvirtcloud.ini"
	install -dm0755 "${pkgdir}/etc/nginx/conf.d"
	install -Dm0644 "${srcdir}/webvirtcloud.nginx.conf.sample" "${pkgdir}/etc/nginx/conf.d/webvirtcloud.nginx.conf.sample"
}
