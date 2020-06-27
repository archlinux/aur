# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgname=cgproxy
pkgver=0.16
pkgrel=2
pkgdesc="A transparent proxy program powered by cgroup2 and tproxy"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('GPL')
groups=('')
makedepends=('llvm' 'clang' 'cmake' 'nlohmann-json' 'bpf')
depends=('gcc-libs' 'systemd' 'which' 'iproute2')
provides=('cgproxy')
conflicts=('cgproxy')

source=("${pkgname}::git+https://github.com/springzfx/cgproxy#tag=v${pkgver}")
md5sums=('SKIP')

backup=('etc/cgproxy/config.json')
install='cgproxy.install'

build(){
    cd ${srcdir}/${pkgname}
    # init submodule
    git submodule init
    git submodule update

    # build libexecsnoop.so
    cd "${srcdir}/${pkgname}/execsnoop-libbpf"
    make clean
    make CFLAGS="-O2 -Wall" libexecsnoop.so

    # build main binary
    cd "${srcdir}/${pkgname}"
    mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make
}

package_cgproxy(){
    cd "${srcdir}/$pkgname"/build
    make DESTDIR=$pkgdir install
    # cd "${srcdir}/${pkgname}/execsnoop-libbpf"
    # make DESTDIR=$pkgdir install
}
