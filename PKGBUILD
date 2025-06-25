# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=jira-cli-git
pkgver=1.6.0.r12.gadab79f
pkgrel=1
pkgdesc="Feature-rich interactive Jira command line (git version)"
arch=(x86_64)
url="https://github.com/ankitpokhrel/jira-cli"
license=('MIT')

makedepends=("go" "git")

conflicts=('jira-cli' 'jira-cli-bin' 'go-jira' 'go-jira-bin')
provides=('jira-cli' 'jira')

source=("${pkgname}::git+${url}.git")

sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}/cmd/jira"
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
	cd "${srcdir}/${pkgname}"
	install -Dm 644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE
	cd cmd/jira
	./jira man --generate --output ${pkgdir}/usr/share/man/man7/
	install -Dm 644 bash ${pkgdir}/usr/share/bash-completion/completions/jira
	install -Dm 644 zsh ${pkgdir}/usr/share/zsh/site-functions/_jira
	install -Dm 644 fish ${pkgdir}/usr/share/fish/vendor_completions.d/jira.fish
	install -D -m755 jira ${pkgdir}/usr/bin/jira
}
