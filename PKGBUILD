# Maintainer: noirscape <deepnavy at waifu dot club>
pkgname=fatattr-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r7.0d6431f
pkgrel=2
pkgdesc="Small linux application to see or modify MSDOS attributes in a FAT file system"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/Terseus/fatattr"
license=('GPL')
depends=()
makedepends=('git' 'scons' 'clang') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("fatattr")
conflicts=("fatattr")
source=("$pkgname"::'git+https://gitlab.com/Terseus/fatattr.git#branch=master' "scons.patch")
md5sums=('SKIP'
         '1e4b2764a0940840bb842ac83ff5e655')

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
	patch --forward --strip=1 --input="${srcdir}/scons.patch"
}

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
        scons
}
package() {
	cd "$srcdir/${pkgname%-VCS}"
	mkdir -p "$pkgdir"/usr/bin
	install -Dm755 "bin/fatattr" "$pkgdir"/usr/bin
}
