# Maintainer: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>

pkgname=dsnet-git
_pkgname=${pkgname%-git}
pkgver=0.5.r33.ga5c5c7c
pkgrel=2
pkgdesc="Simple command to manage a centralised wireguard VPN."
arch=(x86_64)
url="https://github.com/naggie/dsnet"
license=(MIT)
makedepends=("go" "git")
depends=("glibc")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+https://github.com/naggie/dsnet")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname}"

	version=$(git tag -l --sort=-v:refname | sed 's/v\([^-].*\)/\1/g' | head -1)
	release=$(git describe --long --tags | sed 's/\([^-].*\)-\([0-9]*\)-\(g.*\)/r\2.\3/g')

	echo "${version}.${release}" | sed -re 's/-//g' # strip hyphen
}

build() {
    cd "${srcdir}/${pkgname}"
    go build \
        -gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-linkmode external -extldflags ${LDFLAGS}" \
        -buildmode=pie \
        -o dsnet \
        ./cmd/dsnet.go
}

package() {
    cd "${srcdir}/${pkgname}"

	install -Dm755 "dsnet" "${pkgdir}/usr/bin/dsnet"
	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "etc/dsnet.service" "${pkgdir}/usr/lib/systemd/system/dsnet.service"
}
