# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=enlightenment-arc-theme
pkgname=${_gitname}-git
pkgver=r105.a4646e2
pkgrel=1
pkgdesc="A flat theme for enlightenment (Warning: will pull latest revision of efl to compile the theme)"
arch=('any')
url="https://github.com/charlesmilette/${_gitname}"
license=('GPL3')
depends=('efl')
makedepends=('git' 'efl')
source=("git://github.com/charlesmilette/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	if [ -d efl ] ; then
		cd efl && git pull efl master --depth=1
	else
		mkdir efl
		cd efl
		git init
		git remote add efl https://git.enlightenment.org/core/efl.git
		git config core.sparsecheckout true
		echo "data/elementary/themes" >> .git/info/sparse-checkout
		git pull efl master --depth=1
	fi
	cd "${srcdir}/${_gitname}"
	rm arc.edj
	rm arc-dark.edj
	# rm arc-darker.edj
	make orig-theme
	make all
}

package() {
	install -Dm644 "${srcdir}/${_gitname}/arc.edj" "$pkgdir"/usr/share/elementary/themes/arc.edj
	install -Dm644 "${srcdir}/${_gitname}/arc-dark.edj" "$pkgdir"/usr/share/elementary/themes/arc-dark.edj
	# install -Dm644 "${srcdir}/${_gitname}/arc-darker.edj" "$pkgdir"/usr/share/elementary/themes/arc-darker.edj
}
