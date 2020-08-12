# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=sasquatch-git
pkgrel=1
pkgver=r60.982cc25
pkgdesc='Patched unsquashfs utility with support for vendor-specific SquashFS implementations.'
arch=('x86_64')
url='https://github.com/devttys0/sasquatch'
license=('unknown')
makedepends=('git')
source=("${pkgname}"::'git+'$url'.git'
        0001-No-install.patch
        0002-Make_build_gcc_10_compatible.patch)
sha512sums=('SKIP'
            'c94ebf6c2274b81fa749b226d04804d0f1d0e20b6579f74717584abbf5590bfa68e13b31163aa69ab6b5e5f214a30b8ce74115ea343bede05ddf8ae19008d37b'
            '9f61b5052f6daa0ef84f08426d420d1a308b149cf8b7bae30566dd85c825b9c7fcd90ec4833f075d0244076894e2572212ad1bc33f018adbe043fed54657c2b2')

prepare() {
	cd "$pkgname"
	git am "${srcdir}/0001-No-install.patch"
	git am "${srcdir}/0002-Make_build_gcc_10_compatible.patch"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	./build.sh
}

package() {
	cd "${srcdir}/${pkgname}/squashfs"*"/squashfs-tools/"
	install -D -m0755 sasquatch ${pkgdir}/usr/local/bin/sasquatch
}
