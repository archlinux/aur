# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>
pkgname=ztdns-git
_pkgname=ztdns
pkgver=0.0.2.r4.g5fdb3bc
pkgrel=1
pkgdesc='DNS server for a ZeroTier virtual network.'
url='https://github.com/uxbh/ztdns'
arch=('x86_64')
license=('MIT')
source=('https://github.com/uxbh/ztdns/releases/tag/$pkgver')
provides=('ztdns')
conflicts=('ztdns')
depends=(
	'glibc'
)
makedepends=(
	'go'
	'git'
)

source=(
	"${_pkgname}::git+https://github.com/uxbh/ztdns#branch=${BRANCH:-master}"
)

md5sums=(
	'SKIP'
)

backup=(
	'etc/.ztdns.toml'
)

install='ztdns.install'


prepare() {
	chmod u+w -R "$GOPATH"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
	# cutting off 'v.' prefix that presents in the git tag
	git describe --long --tags | sed 's/^v.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "${srcdir}/${_pkgname}"

	if [ -L "${srcdir}/${_pkgname}" ]; then
		rm "${srcdir}/${_pkgname}" -rf
		mv "${srcdir}/go/src/${_pkgname}/" "${srcdir}/${_pkgname}"
	fi

	rm -rf "${srcdir}/go/src"

	mkdir -p "${srcdir}/go/src"

	export GOPATH="${srcdir}/go"

	mv "${srcdir}/${_pkgname}" "${srcdir}/go/src/"

	cd "${srcdir}/go/src/${_pkgname}/"
	ln -sf "${srcdir}/go/src/${_pkgname}/" "${srcdir}/${_pkgname}"

	echo ":: Updating git submodules"
	git submodule update --init

	echo ":: Building binary"
	go get -v \
		-gcflags "-trimpath $GOPATH/src"
}

check() {
  cd "${srcdir}/${_pkgname}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mkdir -p ${pkgdir}/etc

	find "${srcdir}/go/bin/" -type f -executable | while read filename; do
		install -Dm 755 "${filename}" "${pkgdir}/usr/bin/$(basename ${filename})"
	done

	find "${srcdir}/go/src/${_pkgname}" -name "LICENSE" -type f | while read filename; do
		if [ "$(basename ${filename})" == "LICENSE" ]; then
				install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
		fi
	done

	find "${srcdir}/go/src/${_pkgname}" -name ".ztdns.toml.example" -type f | while read filename; do
		if [ "$(basename ${filename})" == ".ztdns.toml.example" ]; then
				install -Dm 644 .ztdns.toml.example "${pkgdir}/etc/.ztdns.toml"
		fi
	done

	chmod u+w -R "$GOPATH"
}
