# Maintainer: Hideaki Takahashi (mymelo+aur@gmail.com)
# Maintainer: taotieren <admin@taotieren.com>
# based on PKGBUILD for MeCab https://aur.archlinux.org/packages/mecab/

pkgname=mecab-git
pkgrel=2
pkgver=r155.05481e7
pkgdesc="Yet another part-of-speech and morphological analyzer."
arch=($CARCH)
url="https://taku910.github.io/mecab"
depends=(
	gcc-libs
	glibc
	sh
)
makedepends=('git')
conflicts=('mecab')
provides=('mecab')
license=('BSD-3-Clause AND GPL-2.0-or-later AND LGPL-2.1-or-later')
source=("${pkgname}::git+https://github.com/taku910/mecab.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	(
		set -o pipefail
		git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
}
build() {
	cd "${pkgname}/mecab"
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-charset=utf-8
	make
}

check() {
	cd "${pkgname}/mecab"
	make -k check
}

package() {
	cd "${pkgname}/mecab"
	make DESTDIR="$pkgdir/" install
}
