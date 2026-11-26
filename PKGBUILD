# Maintainer: Mike Wilson <aur at mjwilson dot org>
# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=qui
pkgver=1.37.0
pkgrel=1
pkgdesc="A fast, modern web interface for qBittorrent"
arch=(x86_64)
url=https://github.com/autobrr/qui
license=(GPL-2.0-or-later)
depends=(glibc)
makedepends=(
	git
	go
	nodejs
	pnpm
)
source=(git+"${url}".git#tag=v"${pkgver}"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles")
sha256sums=('730a183002ae50c153c9d1a8e4e1215b7f6e91ae26d1006667804c3bdccb0492'
            'f9f478c29d18cadb7a58b421c7c65711bc612822e32077c19849e473cc269e6b'
            '149029ffcc078976e0ac6cd1f002b25221bb1561a1c979362dc27d9e6ad5dda3'
            '3bacde8867fbb7b6d566666b635589579c1cc079cd23418284f43a7b37f0c41b')

prepare() {
	cd "${pkgname}"
	mkdir -p build

	# Retrieve Go dependencies
	# Don't proxy connection through Google
	export GOPROXY=direct
	export GOPATH="${srcdir}"
	go mod download -modcacherw

	# Retrieve NodeJS dependencies
	cd web
	pnpm install
}

build() {
	cd "${pkgname}"

	# Ensure build date is reproducible
	local _build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"

	# Build frontend
	pnpm --dir web run build

	# Set Go flags
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export _LDFLAGS="${_LDFLAGS} -compressdwarf=false"
	export _LDFLAGS="${_LDFLAGS} -linkmode=external"
	export _LDFLAGS="${_LDFLAGS} -X github.com/autobrr/qui/internal/buildinfo.Version=${pkgver}"
	export _LDFLAGS="${_LDFLAGS} -X github.com/autobrr/qui/internal/buildinfo.Commit=$(git rev-parse --verify HEAD)"
	export _LDFLAGS="${_LDFLAGS} -X github.com/autobrr/qui/internal/buildinfo.Date=${_build_date}"
	export _LDFLAGS="${_LDFLAGS} -extldflags \"${LDFLAGS}\""
	export GOPATH="${srcdir}"

	# Build backend
	go build \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-trimpath \
		-ldflags "${_LDFLAGS}" \
		-o build \
		./cmd/...

	# Generate shell completions
	"build/${pkgname}" completion bash >bash_completion
	"build/${pkgname}" completion zsh >zsh_completion
	"build/${pkgname}" completion fish >fish_completion
}

check() {
	cd "${pkgname}"
	go test ./...
}

package() {
	# systemd files
	install -Dm755 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm755 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm755 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	cd "${pkgname}"

	# Binary
	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Shell Completions
	install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm644 zsh_completion "${pkgdir}/usr/share/zsh/site-functions/${pkgname}"
	install -Dm644 fish_completion "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
