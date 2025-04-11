# Maintainer: KiWi42 < pullthisplug dash aur at yahoo dot com >

pkgname=netexec-git
_pkgname=netexec
pkgver=v1.3.0.r4576.8d0b4e3
pkgrel=1
pkgdesc="A swiss army knife for pentesting Windows/Active Directory environments"
arch=(any)
url="https://github.com/Pennyw0rth/NetExec"
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry-dynamic-versioning git pyinstaller python-pip rust)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::git+$url)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $_pkgname
	pip install . --break-system-packages
    pyinstaller netexec.spec
	poetry build
}

package() {
    cd $_pkgname
	mkdir -p $pkgdir/usr/bin/
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -m755 dist/nxc $pkgdir/usr/bin/nxc
}
