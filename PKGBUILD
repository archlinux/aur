# Maintainer: Harry Youd <harry at youd dot family>
pkgname=telly
pkgver=1.1.0.9
_real_pkgver=v1.1.0-Beta9
pkgrel=2
pkgdesc="Telly TV - m3u proxy"
arch=("x86_64")
url="https://github.com/tellytv/telly"
license=('MIT')
groups=()
depends=()
makedepends=("go")
checkdepends=()
optdepends=("ffmpeg")
provides=("telly")
conflicts=("telly")
replaces=()
backup=("etc/telly/telly.config.toml")
options=()
install=
changelog=
source=("${pkgname}::git+${url}#tag=${_real_pkgver}"
	"0001-Revert-Change-ffmpeg-command.patch"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"${pkgname}.config.toml"
)
noextract=()
sha256sums=('20dc434988c98d7c1fb6c3fa8b3fb0d189c32111181e92daa2909678480a017c'
            '843b19dfd62d29c6f1deddd6215179970522ef5a1911a08a3c2ada1eb2b63de1'
            '166c3f84df21c52b3e703e9ff61df43a85020bf37743332f288d7ac113ea94a4'
            '6f5a344ed8a2e83913c3070621c57de261f4e68b95f80c7734ff953403b4fd19'
            '6db030762aee37d0fdaef4cee1c67217fb36f1a3b8da6255c5a5d7338590758e'
            'aafe8a87e8605f58ad9fc9570d3d47e6465a9a12459f1b2bef1bf0f3caeb3562')
validpgpkeys=()

prepare() {
	cd "${pkgname}"

	patch -Np1 -i ../0001-Revert-Change-ffmpeg-command.patch

	go mod edit -require github.com/ugorji/go@v1.2.12
	go mod edit -require github.com/ugorji/go/codec@v1.2.12
	go get
}

build() {
	cd "${pkgname}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o build/telly -ldflags="-X 'github.com/prometheus/common/version.Version=${pkgver}' -X 'github.com/prometheus/common/version.Revision=$(git rev-parse HEAD)' -X 'github.com/prometheus/common/version.Branch=$(git rev-parse --abbrev-ref HEAD)' -X 'github.com/prometheus/common/version.BuildUser=makepkg@archlinux' -X 'github.com/prometheus/common/version.BuildDate=$(date +"%Y%m%d-%k:%M:%S" -d @$(git show --no-patch --format="%ct"))'" .
}

package() {
	install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm644 "${pkgname}.config.toml" "${pkgdir}/etc/${pkgname}/${pkgname}.config.toml"

	cd "${pkgname}"
	install -Dm755 build/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
