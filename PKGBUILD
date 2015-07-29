pkgname='vault-git'
pkgdesc='A tool for managing secrets'
pkgver=v0.2.0.r38.g51c87c2
pkgrel=1
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64')
makedepends=('godep')
depends=('glibc')
source=("${pkgname}::git+https://github.com/hashicorp/vault/")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	mkdir -p "${pkgname}/,build!"
}

build () {
	cd "${pkgname}"
	GOPATH="${srcdir}" godep go build -x -v -o ,build/vault
}

package () {
	cd "${pkgname}"
	install -Dm755 ,build/vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	for file in README.md CHANGELOG.md ; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
}

