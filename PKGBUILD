# Maintainer: algebro <algebro at tuta dot io>

pkgname=firejail-apparmor-git
pkgver=r4928.1b4e80e3
pkgrel=1
pkgdesc="Linux namespaces sandbox program (GIT version with AppArmor support)"
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/netblue30/firejail"
source=("${pkgname}::git+https://github.com/netblue30/firejail.git")
sha512sums=('SKIP')
depends=('apparmor')
conflicts=('firejail')
provides=('firejail')
backup=('etc/firejail/login.users'
        'etc/firejail/firejail.config'
        'etc/apparmor.d/local/firejail-local')

pkgver() {
  	cd "${srcdir}/${pkgname}"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

build() {
  	cd "${srcdir}/${pkgname}"
	# fix build
	export CFLAGS=${CFLAGS/-fsanitize=undefined/}
	./configure --prefix=/usr --enable-apparmor
	make
}

package() {
  	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}