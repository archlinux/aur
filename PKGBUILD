# Maintainer: Ariel AxionL <axionl@aosc.io>
# Contributer: Hao Long <aur@esd.cc>

pkgname=go-nebulas
pkgver=1.0.8.1
pkgrel=1
pkgdesc="Official Go implementation of the Nebulas protocol"
arch=("x86_64")
url="https://github.com/nebulasio/go-nebulas"
license=("LGPL3")
depends=("icu" "rocksdb")
makedepends=("dep" "go" "git" "gflags" "snappy")
provides=("neb" "neb-crashreporter")
conflicts=("neb" "neb-crashreporter")
source=("$pkgname.tar.gz::https://github.com/nebulasio/go-nebulas/archive/v${pkgver}.tar.gz"
        "http://ory7cn4fx.bkt.clouddn.com/vendor.tar.gz"
        "config.conf"
        "genesis.conf"
        "go-nebulas.conf"
        "go-nebulas.service"
        "go-nebulas.install")

sha256sums=('a3f8537e65a0fbdfca06a7995ed67417b98714a194c7fb186bbe0bb619b508f9'
            'a5e8dac26ea77b88034a44d077e05777b079eee3f4755ea19ea67fde5d25724e'
            '47fb517be710ac459c446f34d69728f3416ae51aeccb9045ecdf8443450433ff'
            'f02573abd8979f50f4541b8e2c4b732f8ced823dc105b368d59b09e2591b3071'
            'b6847abcf7e442ccbc82edc560f5702303c9efb43c9cd321fdd81800c206d2c8'
            '3e11da7d6ef33e69de2f65c8d77f41d0e937f6900fe064572170648e92350892'
            '572be734ba453e467efb698654fe443ea5fbcd1bc98df64f6d52a0b9b994fbcf')

install="go-nebulas.install"
noextract=("$pkgname.tar.gz" "vendor.tar.gz")

prepare() {
    echo "  -> Extracting files ..."
    _extract_path="src/github.com/nebulasio"

    # extract
    bsdtar -zxf vendor.tar.gz
    mv vendor src
    bsdtar -zxf $pkgname.tar.gz -C $_extract_path
    mv "$_extract_path/go-nebulas-${pkgver}" "$_extract_path/${pkgname}"
}

build() {
    echo "  -> Building binary ..."
    export GOPATH=${srcdir}
    _dir="${srcdir}/src/github.com/nebulasio/${pkgname}"

    # neb
    cd ${_dir}/cmd/neb
    LD_LIBRARY_PATH=${_dir}/nf/nvm/native-lib/ go build -o ${_dir}/neb

    # neb-crashreporter
    cd ${_dir}/cmd/crashreporter
    LD_LIBRARY_PATH=${_dir}/nf/nvm/native-lib/ go build -o ${_dir}/neb-crashreporter
}

package() {
    echo "  -> Installing ..."
    _dir="${srcdir}/src/github.com/nebulasio/${pkgname}"

    # install library
    install -dm755 ${pkgdir}/usr/lib/${pkgname}
    install -Dm755 ${_dir}/nf/nvm/native-lib/*.so ${pkgdir}/usr/lib/${pkgname}
    install -dm755 ${pkgdir}/opt/${pkgname}/lib
    cp -r ${_dir}/nf/nvm/v8/lib/{1.0.0,1.0.5} ${pkgdir}/opt/${pkgname}/lib

    # install binary
    install -dm755 ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/opt/${pkgname}
    install -Dm755 ${_dir}/{neb,neb-crashreporter} ${pkgdir}/opt/${pkgname}
    ln -s ${pkgdir}/opt/${pkgname}/{neb,neb-crashreporter} ${pkgdir}/usr/bin

    # install license
    install -Dm755 ${_dir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # add example config
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
    install -Dm644 config.conf ${pkgdir}/etc/${pkgname}/config.example.conf
    install -Dm644 genesis.conf ${pkgdir}/etc/${pkgname}/gnesis.example.conf
    cp -r ${_dir}/keydir ${pkgdir}/etc/${pkgname}/keydir
    install -Dm644 ${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
# vim set: ts=2 sw=2 et:
