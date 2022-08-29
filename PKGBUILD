# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=komanda-cli-git
pkgver=0.9.4.r32.g8596023
pkgrel=1
pkgdesc='The Komanda Command-line IRC Client'
arch=(x86_64)
url='https://github.com/mephux/komanda-cli'
license=(BSD)
makedepends=(go git dep)
source=("${pkgname}::git+https://github.com/mephux/komanda-cli.git"
        "runtime-fix.patch")
sha256sums=('SKIP'
            '1ff96e713c35aed197ba11d4681836b53016b1a83ea950c20cbaaaf2c122a560')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	patch -p1 -i '../runtime-fix.patch'

	install -m755 -d "${srcdir}/go/src/github.com/mephux/"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/mephux/komanda-cli"
}

build() {
	cd "${srcdir}/go/src/github.com/mephux/komanda-cli"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	make
}

package() {
	cd "${srcdir}/go/src/github.com/mephux/komanda-cli"

	install -Dm755 bin/komanda "${pkgdir}"/usr/bin/komanda
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/komanda-cli/LICENSE
}
