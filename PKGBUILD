# Maintainer: Kamack38 <kamack38.biznes@gmail.com>

_pkgbase=asus-touchpad-numpad-driver
pkgbase="${_pkgbase}-git"
pkgname=(
    "${_pkgbase}-ux433fa-git"
    "${_pkgbase}-up5401ea-git"
    "${_pkgbase}-ux581l-git"
    "${_pkgbase}-gx701-git"
    "${_pkgbase}-b7402-git"
    "${_pkgbase}-e210ma-git"
    "${_pkgbase}-gx551-git"
    "${_pkgbase}-g533-git"
)
pkgver=r340.83866d9
pkgrel=1
pkgdesc="Linux newest feature-rich configurable driver for Asus numpad"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-touchpad-numpad-driver"
license=('GPL3')
depends=('libevdev' 'python-libevdev' 'i2c-tools' 'python-numpy' 'python-evdev' 'xorg-xinput')
makedepends=('git')
provides=("${_pkgbase}")
source=("git+${url}.git")
sha256sums=('SKIP')
install="$pkgbase.install"

pkgver() {
    cd "${srcdir}/asus-touchpad-numpad-driver"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package() {
    cd "${srcdir}/${_pkgbase}"
    sed -i "s/\$PERCENTAGE_KEY/${model}/" "asus_touchpad.service"
    sed -i "s#/usr/share/asus_touchpad_numpad-driver/asus_touchpad.py#${pkgdir}/usr/share/asus_touchpad_numpad-driver/asus_touchpad.py#" "asus_touchpad.service"
    install -Dm755 asus_touchpad.py "${pkgdir}/usr/share/asus_touchpad_numpad-driver/asus_touchpad.py"
    install -Dm644 "asus_touchpad.service" "${pkgdir}/usr/lib/systemd/system/asus_touchpad_numpad.service"
    install -Dm644 "asus_touchpad.X11.service" "${pkgdir}/usr/lib/systemd/system/asus_touchpad.X11.service"
    install -Dm644 "asus_touchpad_suspend.service" "${pkgdir}/usr/lib/systemd/system/asus_touchpad_suspend.service"
    install -Dm 644 -t "${pkgdir}/usr/share/asus_touchpad_numpad-driver/numpad_layouts" numpad_layouts/*.py
}

main() {
    for _pkgname in "${pkgname[@]}"; do
        eval "package_${_pkgname}() {
            model="$(echo ${_pkgname%-*} | sed "s/${_pkgbase}-//" | awk -F '-' '{print $1}')"
            _package
        }"
    done
}

main
