# Maintainer: Janne Heß <jannehess@gmail.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Mark Rosenstand <mark@archlinux.org>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname='gofish'
pkgver='1.2'
pkgrel=2
pkgdesc='Simple gopher/web server with HTTP support'
license=('GPL-2')
url='http://gofish.sourceforge.net/'
arch=('i686' 'x86_64')
backup=('etc/gofish/gofish.conf' 'etc/gofish/gofish-www.conf')
provides=('gopherd')
install='gofish.install'

sha512sums=('f7999a5e2b4f80d6402f26d9434f844b26b47b43a6b00055e72ba399426672ed299ca759252d8eb732b23a4c2c369a92c11c0d496f16f4bf3a999398cf6c5bee'
            '735884a93a0c33dd9442315ec6d658454fc8d7235466013504f000824a9f42248b8b5ef12cd6af2b48cef38b0cabfa893ef4de20f95837cf1fa295bb60215236'
            '74891090106d5134f9886a2f554b7fe9120c4562f6d47e9319a9feae64e6332551df00048d4f4b9a4eca0a78690cca0cb7addf8fd13456004a4d0e1a8f67f9f0')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'gofish.service'
        'gofish-www.service')

build() {
	cd "${srcdir}/${pkgname}"
	./configure --prefix=/usr \
		--sysconfdir=/etc/gofish \
		--localstatedir=/var \
		--disable-mmap-cache \
		--with-gopherroot=/srv/gopher \
		--with-gopheruser=gopher

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
	install -dm755 "${pkgdir}/srv/gopherweb"

	# move sbin
	mv "${pkgdir}/usr/sbin/gofish" "${pkgdir}/usr/bin/"
	ln -s /usr/bin/gofish "${pkgdir}/usr/bin/gopherd"
	rm -r "${pkgdir}/usr/sbin"

	# correct for /srv
	sed -i \
		-e 's/^;root/root/g' \
		-e 's/^;logfile/logfile/g' \
		-e 's/^;pidfile/pidfile/g' \
		-e 's:/var/gopher:/srv/gopher:g' \
		-e 's:/var/log/gopherd.log:/var/log/gofish/gofish.log:g' \
		-e 's:/var/run/gopherd.pid:/run/gofish/gofish.pid:g' \
		"${pkgdir}/etc/gofish/gofish.conf"
	sed -i \
		-e 's:/var/www/html:/srv/gopherweb:g' \
		-e 's:/var/log/gofish.log:/var/log/gofish/gofish-www.log:g' \
		-e 's:/var/run/gofish.pid:/run/gofish/gofish-www.pid:g' \
		"${pkgdir}/etc/gofish/gofish-www.conf"
	sed -i 's:/var/gopher:/srv/gopher:g' "${pkgdir}/srv/gopher/Configure_GoFish"
	sed -i 's:/var/gopher:/srv/gopher:g' "${pkgdir}/usr/bin/check-files"

	# systemd
	install -Dm644 "${srcdir}/gofish.service" "${pkgdir}/usr/lib/systemd/system/gofish.service"
	install -Dm644 "${srcdir}/gofish-www.service" "${pkgdir}/usr/lib/systemd/system/gofish-www.service"

	# Logging
	install -dm755 "${pkgdir}/var/log/gofish"
}
