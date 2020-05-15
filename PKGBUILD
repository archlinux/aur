# Maintainer: Ben Brooks <ben@bbrks.me>
# PRs/Issues: https://github.com/bbrks/aur-sync_gateway-git

_pkgbase=sync_gateway
pkgname=$_pkgbase-git
pkgver=2.7.3.r188.717fe5f3
pkgrel=1
pkgdesc="Manages access and synchronization between Couchbase Lite and Couchbase Server - Open Source Edition (OSE)"
url="https://github.com/couchbase/sync_gateway"
arch=('any')
license=('apache')
makedepends=('git' 'repo' 'go')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
	'sync_gateway.service'
	'git+https://github.com/couchbase/sync_gateway.git'
)
sha256sums=(
	'4bc3c5843b2b6e31d954a53d43c9ecdce77faf3942b5da4ffdaba846f02dd381'
	'SKIP'
)

pkgver() {
	cd "$srcdir/$_pkgbase"
	# latest tag (across all branchs) . number of commits on master since . master checksum
	printf "%s.r%s.%s" "$(git describe --all $(git rev-list --tags --max-count=1) | sed 's/tags\///g')" "$(git rev-list --count HEAD...$(git rev-list --tags --max-count=1))" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir"
	cp "$_pkgbase/bootstrap.sh" .
	./bootstrap.sh
}

build() {
	cd "$srcdir"
	SG_EDITION=CE ./build.sh
}

check() {
	cd "$srcdir"
	SG_EDITION=CE ./test.sh
}

package() {
	install -Dm755 "${srcdir}/godeps/bin/sync_gateway_ce" "${pkgdir}/usr/bin/sync_gateway"
	install -Dm644 "${srcdir}/godeps/src/github.com/couchbase/sync_gateway/examples/serviceconfig.json" "${pkgdir}/etc/sync_gateway.json"
	install -Dm644 "${srcdir}/sync_gateway.service" "${pkgdir}/usr/lib/systemd/system/sync_gateway.service"
}
