# Maintainer: Kimiblock
# Contributor: Fancy Zhang <springzfx@gmail.com>

pkgname=cgproxy-git
pkgver=0.20.r0.g86fe42ec
pkgrel=1
pkgdesc="A transparent proxy program powered by cgroup2 and tproxy"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('GPL-2.0-or-later')
groups=()
makedepends=('cmake' 'nlohmann-json' 'clang' 'bpf' 'libbpf')
depends=('libbpf' 'iproute2' 'which')
provides=('cgproxy')
conflicts=('cgproxy')

source=("${pkgname}::git+https://github.com/springzfx/cgproxy#branch=master")
md5sums=('SKIP')

function pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

backup=('etc/cgproxy/config.json')

function build(){
	mkdir -p "${srcdir}/${pkgname}/build"
	cd "${srcdir}/${pkgname}/build"
	cmake -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Dbuild_execsnoop_dl=ON \
		-Dbuild_static=OFF \
		.. 
	make
}

package_cgproxy-git(){
	cd "${srcdir}/${pkgname}"/build
	make DESTDIR="${pkgdir}" install
}


