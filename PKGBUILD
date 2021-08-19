# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=kde-auto-rotate-git
pkgver=r17.f2436fa
pkgrel=1
pkgdesc="Autorotate the display & pointers on a convertible laptop"
arch=('any')
url="https://github.com/donbowman/kde-auto-rotate"
license=('APACHE')
depends=('gawk' 'iio-sensor-proxy' 'bash' 'dbus' 'plasma-desktop' 'xorg-xinput' 'xorg-xrandr' 'grep' 'coreutils' 'mawk')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/donbowman/kde-auto-rotate.git' 'change-service-execstart-path.patch')
sha256sums=('SKIP' 'c5405a522506eb1d825ba6a793e026e5bd0bd512b6ef51b6c74ac0ef732aeb2d')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    patch -p1 -i "${srcdir}/change-service-execstart-path.patch"
}


package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm 755 -t "${pkgdir}/usr/bin" "auto-rotate"
    install -Dm 644 -t "${pkgdir}/usr/lib/systemd/user" "auto-rotate.service"
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"

    printf "%b" "\e[1;33m==> WARNING: \e[0mIn order to use kde-auto-rotate, start and enable its service: systemctl enable --now --user auto-rotate\n"
}
