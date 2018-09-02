# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Ariel AxionL <axionl@aosc.io>

pkgname=go-nebulas-git
pkgver=r2237.2928567d
pkgrel=1
pkgdesc="Official Go implementation of the Nebulas protocol"
arch=("x86_64")
url="https://github.com/nebulasio/go-nebulas"
license=("LGPL3")
depends=("icu" "rocksdb")
makedepends=("dep" "go" "git" "gflags" "snappy")
provides=("neb" "neb-crashreporter")
conflicts=("neb" "neb-crashreporter")
install="go-nebulas-git.install"
source=("$pkgname::git+https://github.com/nebulasio/go-nebulas.git"
        "config.conf"
        "genesis.conf"
        "dynasty.conf"
        "go-nebulas.service"
        "go-nebulas-git.install"
        "go-nebulas-git.conf")
sha256sums=('SKIP'
            '0bc04c4f6b8bc78ea1bd346866c838a8d4ca667f91edd86256a2b005264e47c8'
            'f02573abd8979f50f4541b8e2c4b732f8ced823dc105b368d59b09e2591b3071'
            'f137c0d7e28580c515f6a79bbf317f02106d66d3f7bf0da52566e918007c2531'
            'c950199571a367dff0987e9dac583199290df67565922386ff717d93b40a5183'
            '25c7cef2f26594514a5616bcc3965484dcd8dd7972f3e3e55087ec302aa6bebd'
            'eba28579d2c1d1213ed5dc09f84d8244de20bca1828d9adfaac841b603b54f06')

pkgver() {
    cd ${srcdir}/${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export GOPATH=${srcdir}
    export _dir=${srcdir}/src/github.com/nebulasio/go-nebulas
    git clone ${srcdir}/${pkgname} ${_dir}
}

build() {
    cd ${_dir}
    dep ensure -v
    # neb
    cd ${_dir}/cmd/neb
    LD_LIBRARY_PATH=${_dir}/nf/nvm/native-lib/ go build -o ../../neb
    # neb-crashreporter
    cd ${_dir}/cmd/crashreporter
    LD_LIBRARY_PATH=${_dir}/nf/nvm/native-lib/ go build -o ../../neb-crashreporter
}

package() {
    # Install Library
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
    install -dm755 ${pkgdir}/usr/lib/${pkgname}
    install -Dm755 ${_dir}/nf/nvm/native-lib/*.so ${pkgdir}/usr/lib/${pkgname}
    install -dm755 ${pkgdir}/opt/${pkgname}/lib
    cp -r ${_dir}/nf/nvm/v8/lib/1.0.0 ${pkgdir}/opt/${pkgname}/lib
    cp -r ${_dir}/nf/nvm/v8/lib/1.0.5 ${pkgdir}/opt/${pkgname}/lib
    # Install Binary
    install -Dm755 ${_dir}/neb ${pkgdir}/opt/${pkgname}/neb
    install -Dm755 ${_dir}/neb-crashreporter ${pkgdir}/opt/${pkgname}/neb-crashreporter
    install -dm755 ${pkgdir}/usr/bin
    ln -s ${pkgdir}/opt/${pkgname}/neb ${pkgdir}/usr/bin/neb
    ln -s ${pkgdir}/opt/${pkgname}/neb-crashreporter ${pkgdir}/usr/bin/neb-crashreporter
    # Install License
    install -Dm755 ${_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    # Add example configuration file
    install -d ${pkgdir}/opt/${pkgname}/conf
    install -Dm644 config.conf ${pkgdir}/opt/${pkgname}/conf/config.conf.example
    install -Dm644 genesis.conf ${pkgdir}/opt/${pkgname}/conf/genesis.conf.example
    cp -r ${_dir}/keydir ${pkgdir}/opt/${pkgname}/conf/keydir.example
    install -Dm644 go-nebulas.service ${pkgdir}/usr/lib/systemd/system/go-nebulas.service
}

# vim: ts=2 sw=2 et:
