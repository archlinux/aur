# $Id$
# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Original TU: Jeff Mickey <j@codemac.net>
# Contributor: ciccio.a

pkgname=squashfs-tools-git
_pkgbasename=squashfs-tools
pkgver=1808.6e242dc
pkgrel=1
pkgdesc="Tools for squashfs, a highly compressed read-only filesystem for Linux."
url="https://github.com/plougher/squashfs-tools"
license=("GPL2")
arch=('x86_64')
depends=('zlib' 'lzo' 'xz' 'lz4' 'zstd')
conflicts=('squashfs-tools')
provides=('squashfs-tools')
source=("squashfs-tools::git+https://github.com/plougher/squashfs-tools.git"
		"glibc-compat.patch::https://patch-diff.githubusercontent.com/raw/plougher/squashfs-tools/pull/52.patch")
sha512sums=('SKIP'
			'5c47a63e711ccde0a692c6be89c9d0c3590461458087f114decd404616b7b75d25f05d5e216fd2ffd95e5404f7a27a4837701341337d0faae22d5fe6a1b97da8')

pkgver() {
	cd ${_pkgbasename}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "${srcdir}"/${_pkgbasename}
	patch -Np1 -i ../glibc-compat.patch
}

build() {
	cd "$srcdir"/${_pkgbasename}/${_pkgbasename}
	CFLAGS="$CFLAGS -O2" make XZ_SUPPORT=1 LZO_SUPPORT=1 LZMA_XZ_SUPPORT=1 LZ4_SUPPORT=1 ZSTD_SUPPORT=1
}

package() {
	cd "$srcdir"/${_pkgbasename}/${_pkgbasename}
	install -Dm755 mksquashfs "$pkgdir"/usr/bin/mksquashfs
	install -m755 unsquashfs "$pkgdir"/usr/bin/unsquashfs
}
