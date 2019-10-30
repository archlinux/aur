pkgname=mfcoin-cli-bin
pkgver=3.0.0.2
pkgrel=20706322
provides=('mfcoin' 'mfcoin-daemon')
conflicts=('mfcoin-bin' 'mfcoin-git' 'mfcoin-cli-git')
pkgdesc="MFCoin is a digital currency and blockchain service platform."
arch=('x86_64')
depends=("libevent>=2.1.8" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "protobuf")
makedepends=('wget' 'jq')
url="https://mfcoin.net/"
license=('GPL3')

_err(){
    echo "$@" 1>&2
}

_linux(){
    json=$(wget -O - https://api.github.com/repos/MFrcoin/MFCoin/releases/${pkgrel} 2>/dev/null)
    assets=$(echo "${json}" | jq '.assets')
    length=$(echo "${assets}" | jq '. | length')
    _err length="$assets"
    for (( i=0; i <= $length; i++ )); do
        name=$(echo "${assets}" | jq --raw-output ".[$i].browser_download_url")
        echo "$name" | grep linux
    done
}

source_x86_64=("$(_linux)")
sha256sums_x86_64=('9fe30f4e2143fc1ffd3060b82c959347f81533fab0836d72ed127d0f57619373')

_prep() {
    cp ./bin/mfcoin$1 $pkgdir/opt/mfcoin/bin/
    ln -s /opt/mfcoin/start $pkgdir/usr/bin/mfcoin$1
    cp ./share/man/man1/bitcoin$1.1 $pkgdir/share/man/man1/mfcoin$1.1 
}

package() {
    mkdir -p $pkgdir/opt/mfcoin/bin
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/include
    mkdir -p $pkgdir/share/man/man1
    cp ../start $pkgdir/opt/mfcoin/start
    cd $(ls -d */)
    cp -R ./utxo_snapshot ./genesis-reg.dat ./genesis-test.dat ./genesis.dat $pkgdir/opt/mfcoin/
    chmod 755 $pkgdir/opt/mfcoin/bin/* $pkgdir/opt/mfcoin/start
    _prep d
    _prep -cli
    cp ./include/mfcoinconsensus.h $pkgdir/usr/include/mfcoinconsensus.h
}
