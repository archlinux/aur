# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=('sbtools-git' 'sbtools-hook-git')
pkgver=r28.e0cdc2c
pkgrel=3
provides=('sbtools')
pkgdesc='Secure boot tools'
url='https://github.com/xdbob/sbtools'
arch=('x86_64')
depends=('sbsigntools' 'openssl' 'efitools')
optdepends=(
	'lz4: initramfs compression'
	'lzop: initramfs compression'
)
source=('git+https://github.com/xdbob/sbtools.git')
sha512sums=('SKIP')
_gitname="sbtools"

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_sbtools-hook-git() {
	depends=('sbtools-git')
	pkgdesc='Secure boot hook for pacman'
	cd "$srcdir/$_gitname"

	make DESTDIR=${pkgdir} install_arch
}

package_sbtools-git() {
	backup=('etc/sbtools.conf')
	cd "$srcdir/$_gitname"

	make DESTDIR=${pkgdir} PREFIX=/usr install

	install -D -m 644 sbtools.conf ${pkgdir}/etc/sbtools.conf

	install -D -m 644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
