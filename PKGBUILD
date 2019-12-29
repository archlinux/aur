# Maintainer: Alex Agura <agura@tfwno.gf>
pkgname=asus-fan-control
pkgver=2.12.0
pkgrel=1
pkgdesc="Fan control for ASUS devices running Linux."
arch=('any')
url="https://github.com/dominiksalvet/asus-fan-control"
license=('MIT')
depends=(acpi_call dmidecode)
makedepends=()
optdepends=('acpi_call-lts: for the linux-lts kernel'
            'acpi_call-dkms: for other non-standard kernels')
install=$pkgname.install
source=("https://github.com/dominiksalvet/$pkgname/archive/$pkgver.tar.gz")
md5sums=('8c24fb12b174a854ddfe528a05d00165')

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
