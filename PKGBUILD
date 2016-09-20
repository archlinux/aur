# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg== | base64 -d>

pkgname=dockviz
pkgver=0.4.2
pkgrel=1
pkgdesc="Visualizing Docker Data"
arch=('x86_64')
url="https://github.com/justone/dockviz"
license=('Apache')
depends=('glibc' 'docker')
makedepends=('go' 'git')
options=()
source=("https://github.com/justone/$pkgname/archive/v$pkgver.tar.gz"
        "docker.tar.gz::https://github.com/docker/docker/archive/master.tar.gz"
        "git+https://github.com/docker/engine-api"
        "git+https://github.com/docker/go-units"
        "runc.tar.gz::https://github.com/opencontainers/runc/archive/master.tar.gz"
        "git+https://github.com/jessevdk/go-flags"
        "git+https://github.com/Sirupsen/logrus"
        "git+https://github.com/fsouza/go-dockerclient"
        "git+https://github.com/hashicorp/go-cleanhttp"
        "net.tar.gz::https://go.googlesource.com/net/+archive/master.tar.gz")

noextract=("net.tar.gz")
sha1sums=('644e94a802a1ee0d8596b4686553d6d3b5851123'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

prepare() {
	cd "$pkgname-$pkgver"
    [ -d src ] && rm -r src/
    mkdir -p src/github.com/{docker,opencontainers,jessevdk,Sirupsen,fsouza,hashicorp}
    ln -s "$srcdir/docker-master" src/github.com/docker/docker
    ln -s "$srcdir/engine-api" src/github.com/docker/engine-api
    ln -s "$srcdir/go-units" src/github.com/docker/go-units
    ln -s "$srcdir/runc-master" src/github.com/opencontainers/runc
    ln -s "$srcdir/go-flags" src/github.com/jessevdk/go-flags
    ln -s "$srcdir/logrus" src/github.com/Sirupsen/logrus
    ln -s "$srcdir/go-dockerclient" src/github.com/fsouza/go-dockerclient
    ln -s "$srcdir/go-cleanhttp" src/github.com/hashicorp/go-cleanhttp
    mkdir -p src/golang.org/x/net
    tar zxf "$srcdir/net.tar.gz" -C src/golang.org/x/net/
    export GOPATH="$PWD"
	go get -d ./
}

build() {
	cd "$pkgname-$pkgver"
    export GOPATH="$PWD"
    make build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./$pkgname-$pkgver "$pkgdir/usr/bin/$pkgname"
}
