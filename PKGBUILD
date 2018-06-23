# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Ariel AxionL <axionl@aosc.io>

pkgname=go-nebulas-git
pkgver=r2209.78433128
pkgrel=2
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
        "go-nebulas.service"
        "go-nebulas-git.install"
        "go-nebulas-git.conf")
sha256sums=('SKIP'
            '47fb517be710ac459c446f34d69728f3416ae51aeccb9045ecdf8443450433ff'
            'f02573abd8979f50f4541b8e2c4b732f8ced823dc105b368d59b09e2591b3071'
            '3e11da7d6ef33e69de2f65c8d77f41d0e937f6900fe064572170648e92350892'
            '3b79cfec7c854ad35279c308068a56f499dee83db492b4ce7de3c1fb68890571'
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
    # Install Binary
    install -Dm755 ${_dir}/neb ${pkgdir}/usr/bin/neb
    install -Dm755 ${_dir}/neb-crashreporter ${pkgdir}/usr/bin/neb-crashreporter
    # Install License
    install -Dm755 ${_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    # Add example configuration file
    install -d ${pkgdir}/etc/go-nebulas
    install -Dm644 config.conf ${pkgdir}/etc/go-nebulas/config.conf.example
    install -Dm644 genesis.conf ${pkgdir}/etc/go-nebulas/genesis.conf.example
    cp -r ${_dir}/keydir ${pkgdir}/etc/go-nebulas/keydir.example
    install -Dm644 go-nebulas.service ${pkgdir}/usr/lib/systemd/system/go-nebulas.service
}

# vim: ts=2 sw=2 et:
