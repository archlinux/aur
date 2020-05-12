# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=mstat-git
pkgdesc='Fine-grained, cgroup-based tool for profiling memory usage over time of a process tree'
pkgver=r25.497eeee
pkgrel=2
url=https://github.com/bpowers/mstat
license=(custom:ISC)
makedepends=(git go-pie)
depends=(glibc)
arch=(x86_64)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver ()
{
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^version\.//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare ()
{
	mkdir -p "${srcdir}/_go/src/github.com/bpowers/"
	ln -rTsf "${pkgname}" "${srcdir}/_go/src/github.com/bpowers/mstat"
}

build ()
{
	cd "${srcdir}/_go/src/github.com/bpowers/mstat"
	local curdir=$(pwd)
	GOPATH="${srcdir}/_go" go build -v \
		-gcflags "all=-trimpath=${curdir}" \
		-asmflags "all=-trimpath=${curdir}" \
		-ldflags "-extldflags '${LDFLAGS}'" \
		.
}

check ()
{
	cd "${srcdir}/_go/src/github.com/bpowers/mstat"
	GOPATH="${srcdir}/_go" go test .
}

package ()
{
	install -Dm755 "${pkgname}/mstat" "${pkgdir}/usr/bin/mstat"
	install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
