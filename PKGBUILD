# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgdesc='A tool for managing secrets'
pkgname=vault-git
pkgver=v1.2.0.8635.g54304bf6f4
pkgrel=1
url='https://vaultproject.io/'
license=(BUSL-1.1)
arch=('i686' 'x86_64')
makedepends=('go>=1.21.8' git)
depends=()
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
install='vault.install'
source=("${pkgname}::git+https://github.com/hashicorp/vault/"
        'vault.service'
		'vault.hcl')
sha512sums=('SKIP'
            'a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            'ee6f91c766415fcd38d9929e9715609bd63abf1ccd6fc618c0655c09dadb1dfbf146c4e9ed7d789a8ff75a1dcdbbc17ff0bb1795e7dcc8f595d68d9b538fb67a')

pkgver () {
	cd "${pkgname}"
	( set -o pipefail
	  git describe --long --tags --match 'v*' 2>/dev/null | sed 's/v\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


_srcpath='src/github.com/hashicorp/vault'
prepare () {
	mkdir -vp "$srcdir/go"
}

build () {
	export GOPATH="${srcdir}/go:$(pwd)"
	export PATH="$srcdir/go/bin:$PATH"

	cd "$pkgname"
	tools/tools.sh install
	make bootstrap bin
}

package () {
	cd "${pkgname}"
	install -Dm755 bin/vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
	for file in README.md CHANGELOG*.md ; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
}
