# Maintainer: Keyu Tao <me@taoky.moe>

pkgname=git-keeper-git
_pkgname=git-keeper
pkgver=rolling.r8.g0d0d6ef
pkgrel=1
pkgdesc="Tracks specified git repos for sysadmins"
arch=('any')
url="https://github.com/taoky/git-keeper"
license=('MIT')
depends=('python' 'git')
makedepends=('go-md2man')
source=("git+${url}.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
}

build() {
	cd "${_pkgname}"
	go-md2man -in debian/git-keeper.1.md -out debian/git-keeper.1
	gzip -f -9 debian/git-keeper.1
}

package() {
	install -Dm755 "${_pkgname}/git-keeper" "${pkgdir}/usr/bin/git-keeper"
	ln -s /usr/bin/git-keeper "${pkgdir}/usr/bin/gitkp"
	install -Dm644 "${_pkgname}/debian/git-keeper.1.gz" "${pkgdir}/usr/share/man/man1/git-keeper.1.gz"
	install -Dm644 "${_pkgname}/completions/git-keeper.completion.bash" "${pkgdir}/usr/share/bash-completion/completions/git-keeper"
	install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# Arch does not have dynamic motd scripts so this is not installed for now.
}
