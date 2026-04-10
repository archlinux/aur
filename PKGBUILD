# Maintainer: Michael Tews <michael at tews dot dev>

pkgname=rclone-studip-git
pkgver=1.2.1
pkgrel=1
pkgdesc="Rclone with a Stud.IP backend"
arch=(any)
url="https://github.com/Mewsen/rclone-studip-backend-oot"
license=(MIT)
makedepends=(git go)
optdepends=("fuse3: mount support")
provides=(rclone)
conflicts=(rclone rclone-git)
source=("${pkgname}-${pkgver}::git+https://github.com/Mewsen/rclone-studip-backend-oot.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export CGO_ENABLED=0
	export GOEXPERIMENT=nodwarf5
	export GOPATH="${srcdir}/gopath"
	export GOMODCACHE="${GOPATH}/pkg/mod"
	export GOCACHE="${srcdir}/go-cache"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false'

	go build -o rclone .

	./rclone genautocomplete bash rclone.bash_completion
	./rclone genautocomplete zsh rclone.zsh_completion
	./rclone genautocomplete fish rclone.fish_completion
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./rclone help backends | grep -qE '^  studip[[:space:]]+Stud\.IP$'
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 rclone "${pkgdir}/usr/bin/rclone"

	install -Dm644 rclone.bash_completion "${pkgdir}/usr/share/bash-completion/completions/rclone"
	install -Dm644 rclone.zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_rclone"
	install -Dm644 rclone.fish_completion "${pkgdir}/usr/share/fish/vendor_completions.d/rclone.fish"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
