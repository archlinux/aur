# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=('sbtools-git' 'sbtools-hook-git')
pkgver=r22.f3aa297
pkgrel=1
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

	install -D -m 755 secure-boot-hook ${pkgdir}/usr/share/libalpm/scripts/secure-boot-hook
	install -D -m 644 95-secure-boot.hook ${pkgdir}/usr/share/libalpm/hooks/95-secure-boot.hook
}

package_sbtools-git() {
	backup=('etc/sbtools.conf')
	cd "$srcdir/$_gitname"

	install -D -m 755 sbmkkeys ${pkgdir}/usr/bin/sbmkkeys
	install -D -m 755 sb-make-boot-img ${pkgdir}/usr/bin/sb-make-boot-img
	install -D -m 755 sb-sign-binary ${pkgdir}/usr/bin/sb-sign-binary
	install -D -m 755 uncat ${pkgdir}/usr/bin/uncat

	install -D -m 644 sbtools.conf ${pkgdir}/etc/sbtools.conf

	install -D -m 644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
