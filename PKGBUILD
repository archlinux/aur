# Contributor: Johannes Loher <johannes dor loher at fg4f dot de>

pkgname=dfix-git
pkgver=0.3.5.r7.g954c50f
pkgrel=1
pkgdesc='Tool for automatically upgrading D source code - git version'
arch=('x86_64')
url='https://github.com/dlang-community/dfix'
license=('BSL-1.0')
groups=('dlang')
depends=('gcc-libs')
makedepends=('dmd' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}"
        "git+https://github.com/Hackerpilot/libdparse"
        "git+https://github.com/dlang-community/stdx-allocator")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd dfix
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd dfix
	git submodule init
	git config submodule.libdparse.url "$srcdir/libdparse"
	git config submodule.stdx-allocator.url "$srcdir/stdx-allocator"
	git -c protocol.file.allow=always submodule update
}

build() {
	make -C dfix
}

package(){
	install -Dm755 -t "${pkgdir}/usr/bin" "dfix/bin/dfix"
}
