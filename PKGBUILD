# Maintainer: Martin Rys <rys.pw/contact>

pkgname=semaphore-git
pkgver=v2.8.65.r25.f02c260
pkgrel=1
pkgdesc='Modern UI for Ansible'
arch=('any')
url='https://github.com/ansible-semaphore/semaphore'
license=('MIT')
depends=('ansible')
makedepends=('go-task' 'npm' 'go-swagger') # Missing packr1 dependency, build will fail
optdepends=('postgresql: Database')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'semaphore'::'git+https://github.com/ansible-semaphore/semaphore.git'
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# https://github.com/ansible-semaphore/semaphore/issues/1015
	# AUR/packr is packr2 and this package relies on packr1.
	# packr2 seemingly has backwards compatibility - we have to patch out the binary name to packr2 instead of packr in Taskfile.yml for that… but
	# this does not actually seem to work reliably and a proper way to build is to package legacy packr… hoping this gets resolved upstream sooner rather than later
#	sed -i 's/- packr/- packr2 --legacy/' "${srcdir}/semaphore/Taskfile.yml"
	go-task all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -DT "${srcdir}/semaphore/bin/semaphore" "$pkgdir/usr/bin/semaphore"
}
