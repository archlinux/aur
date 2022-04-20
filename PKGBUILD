# Maintainer:   vertion <vertion@protonmail.com>
# Contributor:  James Lovejoy, Gert-Jaap Glasbergen, jk_14

pkgname=create-verthash-datafile
_pkgname=vertcoinhash-python
pkgver=1.0.1
pkgrel=1

pkgdesc='verthash.dat generation for electrum-vtc'
arch=('any')
url='https://github.com/vertcoin-project/vertcoinhash-python'
license=('MIT')

depends=('git' 'make')
provides=('create-verthash-datafile')
conflicts=('create-verthash-datafile')
source=("git+$url.git")
sha256sums=('SKIP')
_sha256sum=('a55531e843cd56b010114aaf6325b0d529ecf88f8ad47639b6ededafd721aa48')

build() {
    cd "$srcdir/vertcoinhash-python/"
    git submodule update --init --recursive
    make h1
    ./h1
    if [[ $(sha256sum -c <(echo "$_sha256sum verthash.dat")) = "verthash.dat: OK" ]]; then
        echo "Checksum OK"
    else
        echo "Checksum failed"
        exit 1
    fi
}

package() {
    cd "$srcdir/vertcoinhash-python/"
    install -Dm444 verthash.dat "$pkgdir/usr/share/licenses/$pkgname/verthash.dat"

    mkdir -p ~/.electrum-vtc
    rm -f ~/.electrum-vtc/verthash.dat
    ln -s "$pkgdir/usr/share/licenses/$pkgname/verthash.dat" ~/.electrum-vtc
}