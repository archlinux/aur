# Maintainers:
# - 2016-2021	Ian Beringer <ian@ianberinger.com>
# - 2021	Sebastian Karlsen <sebastian@karlsen.fr>

pkgname=lf-git
_pkgname=lf
pkgver=r519.8327505
pkgrel=1
license=('MIT')
pkgdesc='lf is a terminal file manager written in Go'
depends=("glibc")
makedepends=("git" "go>=1.6")
arch=("i686" "x86_64")
_gourl='github.com/gokcehan/lf'
url="https://${_gourl}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=("lf")
conflicts=("lf")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	GOPATH="${srcdir}/go" ./gen/build.sh
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 -t "${pkgdir}/usr/bin" ./lf

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md ./etc/lfrc.example
	install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" ./etc/lfcd.sh
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" ./lf.1

	# vim
	install -Dm644 -t "${pkgdir}/usr/share/vim/vimfiles/syntax" ./etc/lf.vim
	install -Dm644 -t "${pkgdir}/usr/share/vim/vimfiles/ftdetect" ./etc/lf.vim

	# fish
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" ./etc/lf.fish
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d" ./etc/lfcd.fish
}
