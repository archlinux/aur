# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libumem-git
pkgver=1.0.r15.g3fc772c
pkgrel=2
pkgdesc="A port of the Solaris libumem memory allocator"
arch=('i686' 'x86_64')
url="https://github.com/omniti-labs/portableumem"
license=('custom')
makedepends=('git')
provides=('umem' 'libumem' 'libumem.so')
source=("libumem-git"::'git+https://github.com/omniti-labs/portableumem.git'
        'portableumem-various-cleanups.diff')
sha256sums=('SKIP'
            '78688c528903a154edb956e9058e37144a9f2b0e0818b3167d94d3a643ee2ccf')

prepare() {
	cd "${srcdir}/${pkgname}"
	
	# Restore the git tree to its git origin state, without patches
	#+(necessary for reapllying the patches in succedent builds,
	#+otherwise the patches will fail to be reapplied)
	msg2 "Cleaning the git source code tree..."
	git reset --hard HEAD      # Restore tracked files
	git clean -d -x -f         # Delete untracked files
	
	# apply patch to fix building
	msg2 "Applying patches to fix building..."
	patch -Np1 -i ../portableumem-various-cleanups.diff
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	local _version="$(git tag | grep '[[0-9]*\.]*[0-9]*' | sort -r | head -n1)"
	local _revision="$(git rev-list ${_version}..HEAD --count)"
	local _shorthash="$(git rev-parse --short HEAD)"
	
	printf "%s.r%s.g%s" "$_version" "$_revision" "$_shorthash"
}

build() {
	cd "${srcdir}/${pkgname}"
	./autogen.sh
	./configure \
	    --prefix=/usr \
	    --enable-shared=yes \
	    --enable-static=no \
	    --enable-fast-install=yes \
	    --with-pic=yes
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYRIGHT           "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -D -m644 OPENSOLARIS.LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/OPENSOLARIS.LICENSE"
}
