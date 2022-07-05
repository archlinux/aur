_pkgname="all-ways-egpu"
pkgname="${_pkgname}-git"
pkgver=28.7afc5b7
pkgrel=1
pkgdesc="Configure eGPU as primary under Linux Wayland desktops "
arch=('x86_64')
url="https://github.com/ewagner12/all-ways-egpu"
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/ewagner12/all-ways-egpu.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	awk "/^DESTDIR=/ { printf \"DESTDIR=%s\\n\", \"${pkgdir}\"; next } 1" install.sh > install-new.sh
	mv -f install-new.sh install.sh
	chmod +x install.sh
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/applications"
	./install.sh install

	mkdir -p "${pkgdir}/usr/lib/systemd/system/"
	services=('' '-user' '-boot-vga' '-shutdown')

	for service in "${services[@]}"; do
		ln -sf "/etc/${_pkgname}/${_pkgname}${service}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}${service}.service"
	done
	install -m644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
