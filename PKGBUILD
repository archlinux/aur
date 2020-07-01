# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgname=cgproxy-git
pkgver=v0.16.r7.g6cb1695
pkgrel=1
pkgdesc="A transparent proxy program powered by cgroup2 and tproxy"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('GPL')
groups=('')
makedepends=('llvm' 'clang' 'cmake' 'nlohmann-json' 'bpf')
depends=('gcc-libs' 'systemd' 'which' 'iproute2')
provides=('cgproxy')
conflicts=('cgproxy')

source=("${pkgname}::git+https://github.com/springzfx/cgproxy#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

backup=('etc/cgproxy/config.json')
install="cgproxy.install"

build(){
    cd ${srcdir}/${pkgname}
    # init submodule
    git submodule init
    git submodule update

    # build libexecsnoop.so
    # cd "${srcdir}/${pkgname}/execsnoop-libbpf"
    # make clean
    # make CFLAGS="-O2 -Wall" libexecsnoop.so

    # build main binary
    cd "${srcdir}/${pkgname}"
    mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .. && make
}

package_cgproxy-git(){
    cd "${srcdir}/$pkgname"/build
    make DESTDIR=$pkgdir install
    # cd "${srcdir}/${pkgname}/execsnoop-libbpf"
    # make DESTDIR=$pkgdir install
}


