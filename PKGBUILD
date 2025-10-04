# Maintainer: Trix <admin@trix.is-a.dev>
# Contributor:  GasparVardanyan <gaspar_pm@proton.me>
pkgname='awcc-git'
pkgrel=1
pkgver=r221.41a7166
pkgdesc="An unofficial alternative to Alienware Command Centre of Windows for the Dell G series"
arch=('x86_64')
url="https://github.com/tr1xem/AWCC"
license=('GPL3')
depends=('acpi_call-dkms' 'libusb' 'libx11' 'systemd-libs' 'glibc' 'glfw' 'glu' 'libglvnd' 'libevdev' 'ttf-roboto')
makedepends=('git' 'make' 'cmake' 'nlohmann-json')
provides=("awcc")
conflicts=('awcc-bin')
install='awcc.install'
source=('awcc::git+https://github.com/tr1xem/AWCC.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd build/
    cmake ..
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "./build/awcc" "$pkgdir/usr/bin/awcc"
    install -Dm644 "./app/awccd.service" "$pkgdir/etc/systemd/system/awccd.service"
    install -Dm644 "./app/70-awcc.rules" "$pkgdir/etc/udev/rules.d/70-awcc.rules"
    install -Dm644 "./app/awcc.png" "$pkgdir/usr/share/icons/awcc.png"
    install -Dm644 "./app/awcc.desktop" "$pkgdir/usr/share/applications/awcc.desktop"
    install -Dm644 "./database.json" "$pkgdir/etc/awcc/database.json"
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
