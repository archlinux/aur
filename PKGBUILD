# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgname=cgproxy-git
pkgver=v0.14.r0.g40bd709
pkgrel=1
pkgdesc="A transparent proxy program powered by cgroup2 and tproxy"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('GPL')
groups=('')
makedepends=('cmake' 'nlohmann-json' 'bcc')
depends=()
optdepends=('systemd: service manager'
                         'bcc: execsnoop for program_proxy/program_noproxy')
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
    cd "$pkgname"
    mkdir -p build && cd build && cmake .. && make 
}

package_cgproxy-git(){
    cd "$pkgname"/build
    make DESTDIR=$pkgdir install 
}

