# Maintainer: Alex Agura <agura@tfwno.gf>
pkgname=asus-fan-control
pkgver=2.11.0
pkgrel=2
pkgdesc="ACPI fan control for ASUS devices running Linux."
arch=('any')
url="https://github.com/dominiksalvet/asus-fan-control"
license=('MIT')
depends=(acpi_call dmidecode)
makedepends=()
optdepends=()
install=$pkgname.install
source=("https://github.com/dominiksalvet/$pkgname/archive/$pkgver.tar.gz")
md5sums=('2562408fb931266f0f906f7de68f9513')

prepare(){
    cd "$pkgname-$pkgver"

    # Our asus-fan-control executable is installed to /usr/bin
    sed -ie '/^ExecStart/s:/local::' .gitpack/data/asus-fan-control.service
}

package() {
    cd "$pkgname-$pkgver"

    for dir in usr/{bin,lib/systemd/system,share/{bash-completion/completions,asus-fan-control}} etc/asus-fan-control; do
        mkdir -p $pkgdir/$dir
    done

    install -m644 data/default-temps $pkgdir/usr/share/asus-fan-control
    install -m755 src/asus-fan-control $pkgdir/usr/bin
    install -m644 src/asus-fan-control-completion $pkgdir/usr/share/bash-completion/completions/asus-fan-control
    install -m644 .gitpack/data/asus-fan-control.service $pkgdir/usr/lib/systemd/system
}
