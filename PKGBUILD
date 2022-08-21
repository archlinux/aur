# Maintainer: Martin Rys <rys.pw/contact>

pkgname=semaphore-git
pkgver=v2.8.65.r14.c2c4344
pkgrel=2
pkgdesc='Modern UI for Ansible'
arch=('any')
url='https://github.com/ansible-semaphore/semaphore'
license=('MIT')
depends=()
makedepends=('taskfile-git' 'npm' 'packr' 'go-swagger')
optdepends=('postgresql: Database')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('semaphore'::'git+https://github.com/ansible-semaphore/semaphore.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# AUR/packr is packr2 and this package relies on packr1.
	# packr2 has backwards compatibility but we have to patch out the binary name to packr2 instead of packr in Taskfile.yml
	# https://github.com/ansible-semaphore/semaphore/issues/1015
	sed -i 's/- packr/- packr2 --legacy/' "${srcdir}/semaphore/Taskfile.yml"
	sed -i 's/- goverage/- go test/' "${srcdir}/semaphore/Taskfile.yml"
	task-go all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -DT "${srcdir}/semaphore/bin/semaphore" "$pkgdir/usr/bin/semaphore"
}
