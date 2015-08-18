# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=spreed-webrtc-server-git
_pkgname=spreed-webrtc
pkgver=0.24.8.r0.g873314e
pkgrel=1
pkgdesc="WebRTC audio/video call and conferencing server (Development version)"
url="https://www.spreed.me"
license=('AGPL')
arch=('i686' 'x86_64')
makedepends=('go' 'nodejs' 'mercurial' 'autoconf' 'automake')
conflicts=('spreed-webrtc-server')
source=("git+https://github.com/strukturag/spreed-webrtc" spreed-webrtc-server.service)
sha1sums=('SKIP' 847ff91a7b1ae884f73289d386853977eb14a78d)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}
      
build() {
  	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr

	# running make get to get Go external dependencies 
	make get 

	# makeing release
	make release
}
        
package() {
	cd "${srcdir}/${_pkgname}"

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
	install -Dm644 ./server.conf.in "${pkgdir}/etc/spreed-webrtc-server.conf"

	# update config file (uncomment root value in http section)
	sed -i 's|;root =|root =|g' "${pkgdir}/etc/spreed-webrtc-server.conf"

	# install systemd service
    install -m644 -D "${startdir}/spreed-webrtc-server.service" "${pkgdir}/usr/lib/systemd/system/spreed-webrtc-server.service"
}
