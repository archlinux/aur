# Maintainer: Dasith Gunawardhana <dasith@dg10a.com>

_pkgname=fraidycat
pkgname=${_pkgname}-git
pkgver=r76.76d1b26
pkgrel=1
pkgdesc="Follow blogs, wikis, YouTube channels, as well as accounts on Twitter, Instagram, etc. from a single page."
arch=('x86_64')
url="https://github.com/kickscondor/fraidycat"
license=('BlueOak-1.0.0')
makedepends=('npm' 'git' 'git-lfs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

prepare() {
	cd "$srcdir"

	rm -rf ${_pkgname}
	git clone https://github.com/kickscondor/fraidycat.git
	cd "$srcdir/${_pkgname}"

	git lfs install
	git lfs pull
	npm install
}

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	npm run electron:linux
}

package() {
	cd "$srcdir/${_pkgname}"

	install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
	cp -dr --no-preserve=ownership dist/linux-unpacked/* "${pkgdir}/usr/lib/${_pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
