# Maintainer: ava1ar mail(at)ava1ar(dot)me

_pkgname=log2mail
pkgname=${_pkgname}-git
pkgver=r7.6db1a01
pkgrel=1
pkgdesc="Daemon watching logfiles and mailing lines matching patterns"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
makedepends=('gcc' 'git')
url="https://github.com/fumiyas/${_pkgname}"
source=("git+$url" ${_pkgname}.service)
sha1sums=('SKIP' '619e94f405ed705bf5c865af341745c60759ea7a')
backup=('etc/log2mail/config' 'etc/log2mail/mail')

pkgver() {
	cd "${srcdir}"/${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"/${_pkgname}
	./configure --prefix=/usr
	make
}

package() {
    cd "${srcdir}"/${_pkgname}
    make DESTDIR="${pkgdir}" install

	# coping binaries to /bin instead of /sbin
	mv "${pkgdir}"/usr/{sbin,bin}

	# coping man files to /usr/share/man
	mkdir -p "${pkgdir}"/usr/share
	mv "${pkgdir}"/usr/man "${pkgdir}"/usr/share/man 

	# installing sample config and template files
	mkdir -p "${pkgdir}"/etc/${_pkgname}
	install -Dm644 "${srcdir}"/${_pkgname}/${_pkgname}.conf "${pkgdir}"/etc/${_pkgname}/config
	install -Dm644 "${srcdir}"/${_pkgname}/msg-tmpl "${pkgdir}"/etc/${_pkgname}/mail

	# installing systemd unit
	install -Dm644 "${srcdir}"/${_pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${_pkgname}.service
}
