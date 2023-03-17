# Maintainer: Kamack38 <kamack38.biznes@gmail.com>

_pkgbase=asus-numberpad-driver
pkgbase="${_pkgbase}-git"
pkgname=(
    "${_pkgbase}-b7402-git"
    "${_pkgbase}-e210ma-git"
    "${_pkgbase}-g513-git"
    "${_pkgbase}-g533-git"
    "${_pkgbase}-gx551-git"
    "${_pkgbase}-gx701-git"
    "${_pkgbase}-up5401ea-git"
    "${_pkgbase}-ux433fa-git"
    "${_pkgbase}-ux581l-git"
)
pkgver=r501.3fface8
pkgrel=1
pkgdesc="Linux newest feature-rich configurable driver for Asus numberpad"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-numberpad-driver"
license=('GPL3')
depends=('libevdev' 'python-libevdev' 'i2c-tools' 'python-numpy' 'python-evdev' 'xorg-xinput')
makedepends=('git')
provides=("${_pkgbase}")
replaces=('asus-touchpad-numpad-driver-git')
source=("git+${url}.git")
sha256sums=('SKIP')
install="$pkgbase.install"

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package() {
    cd "${srcdir}/${_pkgbase}"
    install -Dm755 asus_touchpad.py "${pkgdir}/usr/share/${_pkgbase}/asus_touchpad.py"
    install -Dm644 "asus_touchpad.service" "${pkgdir}/usr/lib/systemd/system/asus_touchpad.service"
    install -Dm644 "asus_touchpad.X11.service" "${pkgdir}/usr/lib/systemd/system/asus_touchpad.X11.service"
    sed -i "s/\$LAYOUT/${model}/" "${pkgdir}/usr/lib/systemd/system/asus_touchpad.service"
    sed -i "s/\$LAYOUT/${model}/" "${pkgdir}/usr/lib/systemd/system/asus_touchpad.X11.service"
    install -Dm 644 -t "${pkgdir}/usr/share/${_pkgbase}/numpad_layouts" numpad_layouts/*.py
    install -Dm 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE.md"
}

main() {
    for _pkgname in "${pkgname[@]}"; do
        eval "package_${_pkgname}() {
            model="$(echo ${_pkgname%-*} | sed "s/${_pkgbase}-//")"
            _package
        }"
    done
}

main
