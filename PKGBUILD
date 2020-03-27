# Maintainer: Alex Agura <agura@tfwno.gf>
pkgname=asus-fan-control
pkgver=3.6.0
pkgrel=1
pkgdesc="Fan control for ASUS devices running Linux."
arch=('any')
url="https://github.com/dominiksalvet/asus-fan-control"
license=('MIT')
depends=(acpi_call dmidecode)
makedepends=(git)
optdepends=('acpi_call-lts: for the linux-lts kernel'
            'acpi_call-dkms: for other non-standard kernels')
install=$pkgname.install
source=("https://github.com/dominiksalvet/$pkgname/archive/$pkgver.tar.gz")
#_commit=5f8413164a65c590dad8bac31399d0908275de0a
#source=("$pkgname::git+https://github.com/dominiksalvet/asus-fan-control.git#commit=$_commit")
md5sums=('2c7ef428c9ad76eaded757f19f161d17')

#pkgver() {
#    cd $pkgname
#    git describe --tags | sed 's/-/+/g;s/^v//'
#}

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

    install -m644 data/models $pkgdir/usr/share/asus-fan-control
    install -m755 src/asus-fan-control $pkgdir/usr/bin
    install -m644 src/asus-fan-control-completion.bash $pkgdir/usr/share/bash-completion/completions/asus-fan-control
    install -m644 .gitpack/data/asus-fan-control.service $pkgdir/usr/lib/systemd/system

}
