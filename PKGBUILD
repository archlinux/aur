# Maintainer: Alex Agura <agura@tfwno.gf>
pkgname=asus-fan-control
pkgver=2.12.0+38+g7a53b61
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
#source=("https://github.com/dominiksalvet/$pkgname/archive/$pkgver.tar.gz")
_commit=7a53b619847784f9f96fb61aa61dea1a112b34bd
source=("$pkgname::git+https://github.com/dominiksalvet/asus-fan-control.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags | sed 's/-/+/g;s/^v//'
}

prepare(){
    cd "$pkgname" #-$pkgver"

    # Our asus-fan-control executable is installed to /usr/bin
    sed -ie '/^ExecStart/s:/local::' .gitpack/data/asus-fan-control.service

    # Fix loading acpi_call since Arch no longer does that on boot
    sed -ie '/^After=/s/$/ modprobe@acpi_call.service\nWants=modprobe@acpi_call.service/' .gitpack/data/asus-fan-control.service
}

package() {
    cd "$pkgname" #-$pkgver"

    for dir in usr/{bin,lib/systemd/system,share/{bash-completion/completions,asus-fan-control}} etc/asus-fan-control; do
        mkdir -p $pkgdir/$dir
    done

    install -m644 data/default-temps $pkgdir/usr/share/asus-fan-control
    install -m755 src/asus-fan-control $pkgdir/usr/bin
    install -m644 src/asus-fan-control-completion.bash $pkgdir/usr/share/bash-completion/completions/asus-fan-control
    install -m644 .gitpack/data/asus-fan-control.service $pkgdir/usr/lib/systemd/system

}
