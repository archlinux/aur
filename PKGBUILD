# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=clair-git
pkgver=4.3.5.r3.gc88c406f
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=(x86_64)
url="https://github.com/quay/clair.git"
license=(Apache)
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	version=$(git tag -l --sort=-v:refname | sed 's/v\([^-].*\)/\1/g' | head -1)
	release=$(git describe --long --tags | sed 's/\([^-].*\)-\([0-9]*\)-\(g.*\)/r\2.\3/g')

	echo "${version}.${release}" | sed -re 's/-//g' # strip hyphen
}

prepare() {
	cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/quay/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/quay/clair"

    cd "${srcdir}/go/src/github.com/quay/clair"
}

build() {
	cd "${srcdir}/go/src/github.com/quay/clair"

    export GOPATH="${srcdir}/go" PATH="${srcdir}/go/bin:${PATH}"
    make

    go build -o clair -trimpath \
        -ldflags "-s -w -X main.Version=${pkgver}" \
        ./cmd/clair

    go build -o clairctl -trimpath \
        -ldflags "-s -w -X main.Version=${pkgver}" \
        ./cmd/clairctl
}

package() {
	cd "${srcdir}/go/src/github.com/quay/clair"

	install -Dm755 "clair" "${pkgdir}/usr/bin/clair"
	install -Dm755 "clairctl" "${pkgdir}/usr/bin/clair"
	install -Dm755 "config.yaml.sample" "${pkgdir}/etc/clair/config.yaml"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
