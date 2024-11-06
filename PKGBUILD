# Maintainer: envolution
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=magicrescue
pkgver=1.1.10
pkgrel=1
pkgdesc="Find and recover deleted files on block devices"
arch=('i686' 'x86_64')
url="https://github.com/jbj/magicrescue"
options=(!strip !debug)
license=('GPL-2.0-or-later')
source=(
	"http://deb.debian.org/debian/pool/main/m/$pkgname/${pkgname}_${pkgver}.orig.tar.gz"
	010_fix-manpage.patch
	020_add-Perl-preprocessor.patch
	030_fix-textextract-crash.patch
	040_fix-install.patch
)

sha256sums=('060c77be3e86a328a4f90f45d2da41b2b78cb74f13d44f69e29909cf68e98cad'
            'cf100ebf81d758abd6d4f6c8c35e6f4cb30bb4454b45aff96108c9a80c6ca4b3'
            'b9bc14b94bfe9922beccff4fd5383ef03dc5ebaf040afd15fb2712e43fe89b32'
            '7c7c3f6fbd914a770d0a3a49819b21ae20fb2ef2e81b8770c94a8c5886b8ee20'
            '50b3a504121cfc682b926a1667509edf1bad675dd207214d5e3a521b239d55fc')

prepare() {
        #patches taken from http://ftp.debian.org/debian/pool/main/m/magicrescue/magicrescue_1.1.10-4.debian.tar.xz
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/010_fix-manpage.patch"
	patch -p1 -i "${srcdir}/020_add-Perl-preprocessor.patch"
	patch -p1 -i "${srcdir}/030_fix-textextract-crash.patch"
	patch -p1 -i "${srcdir}/040_fix-install.patch"

}
build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make PREFIX="${pkgdir}"/usr
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i "s|${PREFIX}/man/man1|${PREFIX}/share/man/man1|" Makefile
  install -d "${pkgdir}"/usr
  make PREFIX="${pkgdir}"/usr install
}
