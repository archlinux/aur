# Maintainer: Martin Rys <rys.pw/contact>

pkgname=semaphore-git
pkgver=v2.9.39.beta.r2.85d9936
pkgrel=1
pkgdesc='Modern UI for Ansible'
arch=('any')
url='https://github.com/ansible-semaphore/semaphore'
license=('MIT')
depends=('ansible')
makedepends=('git' 'go-task' 'npm' 'go-swagger')
optdepends=('postgresql: Database')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# C0rn3j -> # #branch=packr-halfremoval for testing
# This doesn't work, the git release binary is completely different from the one go install fetches, which is the one we actually need
# Self-hosted on Nextcloud at the moment, packr is dead altogether and upstream needs to switch to embed.
#	'packr_1.10.4.tar.gz'::https://github.com/gobuffalo/packr/releases/download/v1.10.4/packr_1.10.4_linux_amd64.tar.gz
source=(
	'semaphore'::'git+https://github.com/ansible-semaphore/semaphore.git'
	'packr-semaphore'::'https://cloud.rys.pw/s/fs9sPjLcMbHDNNz/download/packr'
)
sha256sums=(
	'SKIP'
	'f1e4e41de6c416aac8a8c3d780c5d9fd56ad8358bb245f5d6f0f4c24b1ffb214'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	# Packr hack
	local _tempdir="$srcdir/temp-bin"
	mkdir -p "$_tempdir"
	cp "$srcdir/packr-semaphore" "$_tempdir/packr-semaphore"
	chmod +x "$_tempdir/packr-semaphore"
	export PATH="$_tempdir:$PATH"

	cd "$srcdir/${pkgname%-git}"
	# https://github.com/ansible-semaphore/semaphore/issues/1015
	# AUR/packr is packr2 and this package relies on packr1.
	# packr2 seemingly has backwards compatibility - we have to patch out the binary name to packr2 instead of packr in Taskfile.yml for that… but
	# this does not actually seem to work reliably and a proper way to build is to package legacy packr… hoping this gets resolved upstream sooner rather than later

	# Make sure we use the specific binary
	sed -i 's/- packr/- packr-semaphore/' "${srcdir}/semaphore/Taskfile.yml"
	go-task all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -DT "${srcdir}/semaphore/bin/semaphore" "$pkgdir/usr/bin/semaphore"
}
