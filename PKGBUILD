# Maintainer: Hideaki Takahashi (mymelo+aur@gmail.com)
# Maintainer: taotieren <admin@taotieren.com>
# based on PKGBUILD for MeCab https://aur.archlinux.org/packages/mecab/

pkgname=mecab-git
pkgrel=1
pkgver=r157.61b90ba
pkgdesc="Yet another part-of-speech and morphological analyzer."
arch=($CARCH)
url="https://taku910.github.io/mecab"
depends=(
	gcc-libs
	glibc
	sh
)
makedepends=(
	'git'
	'wget'
)
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
	if [ "$CARCH" == "aarch64" ]; then
		echo "Detected aarch64 architecture. Updating config.guess and config.sub..."

		rm -f config.guess
		wget 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD' -O config.guess
		if [ $? -ne 0 ]; then
			echo "Failed to download config.guess" >&2
			exit 1
		fi

		rm -f config.sub
		wget 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD' -O config.sub
		if [ $? -ne 0 ]; then
			echo "Failed to download config.sub" >&2
			exit 1
		fi

		echo "Updated config.guess and config.sub successfully."
	else
		echo "Not aarch64 architecture. Skipping update of config.guess and config.sub."
	fi
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
