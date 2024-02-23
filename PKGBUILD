# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=octopusdeploy-cli
pkgver=2.2.0
pkgrel=1
pkgdesc="Next Generation Command Line Interface for Octopus Deploy"
arch=('x86_64' 'i686')
url="https://github.com/OctopusDeploy/cli"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("cli-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('73e77b99a7476817e2bbb696d00811de41f22643ebc938bf447c480b3ea66f00')

build() {
	cd "cli-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build ./cmd/octopus
}

package() {
	cd "cli-${pkgver}"
	install -vDm 755 octopus -t "${pkgdir}/usr/bin/"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# build bash completions
	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	OCTOPUS_URL=https://localhost OCTOPUS_API_KEY=API-XXXXXXXXXXXXXXXXXXXXXXXXXXXXX ./octopus completion bash > "${pkgdir}/usr/share/bash-completion/completions/octopus"

	# build zsh completions
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	OCTOPUS_URL=https://localhost OCTOPUS_API_KEY=API-XXXXXXXXXXXXXXXXXXXXXXXXXXXXX ./octopus completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_octopus"

	# build fish completions
	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	OCTOPUS_URL=https://localhost OCTOPUS_API_KEY=API-XXXXXXXXXXXXXXXXXXXXXXXXXXXXX ./octopus completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/octopus.fish"
}
