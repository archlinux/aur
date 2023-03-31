# Maintainers:
# - 2016-2021	Ian Beringer <ian@ianberinger.com>
# - 2021	Sebastian Karlsen <sebastian@karlsen.fr>

pkgname=lf-sixel-git
_pkgname=lf-sixel
pkgver=28.1.r1.g8997e5b
pkgrel=1
license=('MIT')
pkgdesc='lf is a terminal file manager written in Go from fork supporting sixel'
depends=("glibc")
makedepends=("git" "go>=1.6")
arch=("i686" "x86_64")
_gourl='github.com/horriblename/lf'
url="https://${_gourl}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=("lf")
conflicts=("lf")

# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver()_function
pkgver() {
	cd "${srcdir}/${_pkgname}"
	version=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
	echo "${version:1}"
}

# Based on a suggestion from leandro.vital
build() {
	export GOPATH="${srcdir}/go"

	cd "${srcdir}/${_pkgname}"
	go mod vendor
	version="${pkgver}" ./gen/build.sh -mod=vendor -trimpath

	# clean now to ensure makepkg --clean works
	go clean -modcache
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 -t "${pkgdir}/usr/bin" ./lf

	install -Dm644 -t "${pkgdir}/usr/share/applications" ./lf.desktop

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
