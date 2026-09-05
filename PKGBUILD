# Maintainer: Kaj Kowalski <info@kajkowalski.nl>

# VCS package: builds the tip of master. pkgver() derives the version from
# git describe at build time; the value below only feeds the AUR web page.
pkgname=actionlint-kjanat-git
pkgver=1.14.0.r21.gde29823
pkgrel=1
pkgdesc='Static checker for GitHub Actions workflow files (kjanat fork, git master)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://actionlint.kjanat.dev'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'pandoc-cli')
optdepends=(
	'shellcheck: check shell scripts in run steps'
	'python-pyflakes: check Python scripts in run steps'
)
provides=("actionlint=$pkgver")
conflicts=('actionlint' 'actionlint-bin' 'actionlint-git' 'actionlint-kjanat' 'actionlint-kjanat-bin')
source=('actionlint::git+https://github.com/kjanat/actionlint.git')
sha256sums=('SKIP')

# Go module path; the ldflags targets below are package-level vars in it.
_module='actionlint.kjanat.dev'

pkgver() {
	cd actionlint
	# v1.14.0-12-gabc1234 -> 1.14.0.r12.gabc1234
	git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd actionlint
	go mod download
}

build() {
	cd actionlint
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	# A second -ldflags on the command line replaces GOFLAGS' wholesale, so
	# -linkmode=external is passed here and not through GOFLAGS.
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
	# makepkg strips symbols itself; keeping them here lets debuginfod work.
	go build -o build/actionlint \
		-ldflags "-linkmode=external -X ${_module}.version=$pkgver -X ${_module}.installedFrom=https://aur.archlinux.org/packages/$pkgname" \
		./cmd/actionlint
	make man/actionlint.1
}

check() {
	cd actionlint
	# The ./scripts/... tests reach the network; the shellcheck and pyflakes
	# integration tests self-skip when those tools are absent.
	go test . ./cmd/...
}

package() {
	cd actionlint
	install -Dm0755 build/actionlint "$pkgdir/usr/bin/actionlint"
	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" docs/*.md
	install -Dm0644 man/actionlint.1 "$pkgdir/usr/share/man/man1/actionlint.1"

	# The binary was just built for $CARCH, so it can generate its own completions.
	install -dm0755 "$pkgdir/usr/share/bash-completion/completions" \
		"$pkgdir/usr/share/zsh/site-functions" \
		"$pkgdir/usr/share/fish/vendor_completions.d" \
		"$pkgdir/usr/share/actionlint"
	build/actionlint -completion bash >"$pkgdir/usr/share/bash-completion/completions/actionlint"
	build/actionlint -completion zsh >"$pkgdir/usr/share/zsh/site-functions/_actionlint"
	build/actionlint -completion fish >"$pkgdir/usr/share/fish/vendor_completions.d/actionlint.fish"
	# pwsh users dot-source this from their $PROFILE; Linux has no autoload dir for it.
	build/actionlint -completion powershell >"$pkgdir/usr/share/actionlint/actionlint.ps1"
	chmod 0644 "$pkgdir/usr/share/bash-completion/completions/actionlint" \
		"$pkgdir/usr/share/zsh/site-functions/_actionlint" \
		"$pkgdir/usr/share/fish/vendor_completions.d/actionlint.fish" \
		"$pkgdir/usr/share/actionlint/actionlint.ps1"
}
