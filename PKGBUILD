# Maintainer: Maxime “pep” Buquet <archlinux@bouah.net>
# Package based on aur/forgejo-runner-bin and aur/act-runner.
pkgname="forgejo-runner"
pkgver=3.2.0
pkgrel=4
pkgdesc="Continous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('Expat')
depends=('docker')
provides=('forgejo-runner')
makedepends=('git' 'go')
optdepends=('docker')
backup=('etc/forgejo-runner/forgejo-runner.yaml')
source=(
	"forgejo-runner::git+https://code.forgejo.org/forgejo/runner#tag=v$pkgver"
	"forgejo-runner.service"
)
sha256sums=('SKIP'
            '693925cda2ad678f5e03d3196468f1304db42d4d74df3376979d8f35a0fb86d0')

prepare() {
	mkdir -p cache
}

build() {
	cd "$pkgname"

	export GOPATH="$srcdir/cache"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	# When running `make forgejo-runner` I get:
	# flag provided but not defined: -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now
	# by the linker.
	go build \
		-v -tags 'netgo osusergo' -buildvcs=false \
		-ldflags "-linkmode=external -extldflags '-static -s -w' -X main.version=$pkgver" \
		-o $pkgname

	./forgejo-runner generate-config > "$pkgname.yaml"
}

package() {
	cd "$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	sed -i -e "s|file: \.runner|file: /etc/$pkgname/.runner|" $pkgname.yaml
	# install -m755 -d "$pkgdir/etc/$pkgname"
	install -Dm644 "$pkgname.yaml" "$pkgdir/etc/$pkgname/$pkgname.yaml"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
