# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jira-cli
pkgver=1.5.1
pkgrel=1
pkgdesc="Feature-rich interactive Jira command line."
arch=(x86_64)
url="https://github.com/ankitpokhrel/jira-cli"
license=('MIT')

makedepends=("go")

conflicts=('jira-cli-bin' 'go-jira' 'go-jira-bin')
provides=('jira')

source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('726d793f1863f075ee4446b31f9ff692fa10b66b09ee2bc1d2471f7f94315c85')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/cmd/jira"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
	./jira completion bash >bash
	./jira completion zsh >zsh
	./jira completion fish >fish
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm 644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE
	cd cmd/jira
	./jira man --generate --output ${pkgdir}/usr/share/man/man7/
	install -Dm 644 bash ${pkgdir}/usr/share/bash-completions/completions/jira
	install -Dm 644 zsh ${pkgdir}/usr/share/zsh/site-functions/_jira
	install -Dm 644 fish ${pkgdir}/usr/share/fish/vendor_completions.d/jira.fish
	install -D -m755 jira ${pkgdir}/usr/bin/jira
}
