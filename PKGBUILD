# Maintainer: Maxim Levchenko <maximalist at d-net dot kiev dot ua>

pkgname=cockpit-zfs-manager-git
pkgver=0.1.0.r219.gbd0b01b
pkgrel=1
pkgdesc='Modern ZFS manager for Cockpit using React and PatternFly 6 (development snapshot)'
arch=('any')
url='https://github.com/brycelarge/cockpit-zfs-manager'
license=('LGPL-2.1-only')
depends=(
	'cockpit'
	'zfs-utils'
	'util-linux'
)
makedepends=(
	'git'
	'nodejs'
	'npm'
	'python'
	'make'
)
optdepends=(
	'smartmontools: disk S.M.A.R.T. data'
	'sanoid: automated snapshots'
)

# The pinned Cockpit commit is the one required by upstream's Makefile.
_cockpit_commit=c137401a2b5fd8ba2088242b9ddc2f35fbb18337
source=(
	"git+https://github.com/brycelarge/cockpit-zfs-manager.git"
	"cockpit-lib-${_cockpit_commit}.tar.gz::https://github.com/cockpit-project/cockpit/archive/${_cockpit_commit}.tar.gz"
	'smartctl-fix.patch'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/cockpit-zfs-manager"
	local base rev hash
	base=$(node -p "JSON.parse(require('fs').readFileSync('package.json')).version")
	rev=$(git rev-list --count HEAD)
	hash=$(git rev-parse --short=7 HEAD)
	printf '%s.r%s.g%s\n' "$base" "$rev" "$hash"
}

prepare() {
	cd "$srcdir/cockpit-zfs-manager"
	patch -Np1 -i "$srcdir/smartctl-fix.patch"
	mkdir -p pkg
	cp -a "$srcdir/cockpit-${_cockpit_commit}/pkg/lib" pkg/lib
	npm ci --no-audit --no-fund --cache "$srcdir/npm-cache"
}

build() {
	cd "$srcdir/cockpit-zfs-manager"
	NODE_ENV=production node build.js
}

package() {
	cd "$srcdir/cockpit-zfs-manager"
	install -d "$pkgdir/usr/share/cockpit/zfs-manager"
	cp -a dist/. "$pkgdir/usr/share/cockpit/zfs-manager/"
}
