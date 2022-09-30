# Maintainer: Gustavo Ramos Rehermann <rehermann6046@gmail.com>

pkgname=bspc-warsow-git
_srcname=bspc
pkgver=1664573766.111.d0673fd
pkgrel=1
pkgdesc="Quake 3 BSP-to-AAS compiler, to create bot navigation meshes. Warsow version"
arch=("x86_64")
url="https://github.com/Warsow/bspc"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'make')
optdepends=()
provides=("bspc" "bspc-warsow")
conflicts=("bspc" "bspc-warsow")
replaces=()
backup=()
options=()
install=
source=(
	'git+https://github.com/Warsow/bspc.git'
	'bspc-ttimo::git+https://github.com/TTimo/bspc.git'
	'bspc-makefile.patch')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'e3dfc816409a85aa5a62f4b9dd7da258')

pkgver() {
	cd "$srcdir/$_srcname"

	# Use timestamp, because there are no tags or other sorts of version information,
	# to inform AUR helpers' update processes.
	printf "%s.%s.%s" "$(git show -s --format=%ct HEAD)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_srcname"

	patch --forward --strip=1 --input="${srcdir}/bspc-makefile.patch"
	git add Makefile
	git commit -m autopatch-makefile

	git remote add ttimo "${srcdir}/bspc-ttimo" || true
	git fetch ttimo
	git merge ttimo/master -m automerge -s ort -X theirs
}

build() {
	cd "$srcdir/$_srcname"
	
	make -j"$(nproc)"
}
package() {
	cd "$srcdir/$_srcname"

	mkdir -p "$pkgdir/usr/bin"
	cp bspc "$pkgdir/usr/bin/bspc"
}
