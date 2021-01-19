# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=swtpm-git
pkgver=0.5.0.r31.526c9fa
pkgrel=1
pkgdesc='Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface'
arch=('x86_64')
url='https://github.com/stefanberger/swtpm'
license=('BSD')
depends=('fuse2' 'glib2' 'libseccomp' 'libtpms' 'libseccomp.so')
makedepends=('git' 'expect' 'gnutls' 'iproute2' 'libtasn1' 'python' 'python-cryptography' 'python-setuptools' 'socat')
checkdepends=('softhsm')
optdepends=('gnutls: swtpm_cert support'
            'python-cryptography: swtpm_setup support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"

	# Remove usage of /usr/bin/env to avoid PATH manipulation attacks
	sed --in-place 's/env //' samples/swtpm-create-tpmca samples/swtpm-create-user-config-files.in \
	                          samples/swtpm-localca.in src/swtpm_setup/py_swtpm_setup/swtpm_setup.py \
	                          src/swtpm_setup/swtpm_setup.in

	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --with-cuse --with-gnutls --with-seccomp --disable-python-installation
	make

	for _dir in samples src/swtpm_setup; do (cd "$_dir"; python setup.py build); done
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	for _dir in samples src/swtpm_setup
	do
		(cd "$_dir"; python setup.py install --root="$pkgdir" --optimize=1 --skip-build)
	done

	echo 'u tss - "tss user for tpm2"' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	echo 'z /var/lib/swtpm-localca 0750 tss root' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
