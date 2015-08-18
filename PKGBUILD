# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=spreed-webrtc-server
_pkgname=spreed-webrtc
pkgver=0.24.8
pkgrel=1
pkgdesc="WebRTC audio/video call and conferencing server"
url="https://www.spreed.me"
license=('AGPL')
arch=('i686' 'x86_64')
makedepends=('go' 'nodejs' 'mercurial' 'autoconf' 'automake')
conflicts=('spreed-webrtc-server-git')
source=("https://github.com/strukturag/${_pkgname}/archive/v${pkgver}.tar.gz" ${pkgname}.service)
sha1sums=('63276e8fd321e30d2b3c86ab79e0efd5df945ba4' 847ff91a7b1ae884f73289d386853977eb14a78d)

build() {
  	cd "${srcdir}/${_pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr

	# running make get to get Go external dependencies 
	make get 

	# makeing release
	make release
}
        
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# patch Makefile to use /usr/bin instead of /usr/sbin and support $(DESTDIR)
	sed -i -e 's|BIN ?= /usr/sbin|BIN ?= /usr/bin|g' \
		   -e 's|$(BIN)|$(DESTDIR)$(BIN)|g' \
		   -e 's|$(SHARE)|$(DESTDIR)$(SHARE)|g' \
		   ./Makefile

	# install package files
	make DESTDIR="${pkgdir}" install

	# remove executable bit from the static files
	find "${pkgdir}/usr/share/spreed-webrtc-server" -type f -exec chmod 644 {} \;

	# install config file
	install -Dm644 ./server.conf.in "${pkgdir}/etc/${pkgname}.conf"

	# update config file (uncomment root value in http section)
	sed -i 's|;root =|root =|g' "${pkgdir}/etc/${pkgname}.conf"

	# install systemd service
    install -m644 -D "${startdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
