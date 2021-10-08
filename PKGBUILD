# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=swtpm-git
pkgver=0.7.0rc1.r12.f1d425b
pkgrel=1
pkgdesc='Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface'
arch=('x86_64')
url='https://github.com/stefanberger/swtpm'
license=('BSD')
depends=('fuse2' 'glib2' 'gnutls' 'json-glib' 'libseccomp' 'libtpms' 'libseccomp.so')
makedepends=('git' 'expect' 'iproute2' 'libtasn1' 'python' 'python-setuptools' 'socat')
checkdepends=('softhsm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/[-_]rc/rc/;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"

	# Remove usage of /usr/bin/env to avoid PATH manipulation attacks
	sed --in-place 's/env //' samples/swtpm-create-tpmca samples/swtpm-create-user-config-files.in

	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --with-cuse --with-gnutls --with-seccomp
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	echo 'u tss - "tss user for tpm2"' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	echo 'z /var/lib/swtpm-localca 0750 tss root' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	chmod 750 "$pkgdir/var/lib/swtpm-localca"
}
