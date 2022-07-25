# Maintainer: Kamack38 <kamack38.biznes@gmail.com>

_pkgbase=asus-touchpad-numpad-driver
pkgbase="${_pkgbase}-git"
pkgname=(
    "${_pkgbase}-ux433fa-qwerty-git"
    "${_pkgbase}-ux433fa-azerty-git"
    "${_pkgbase}-up5401ea-qwerty-git"
    "${_pkgbase}-up5401ea-azerty-git"
    "${_pkgbase}-ux581l-qwerty-git"
    "${_pkgbase}-ux581l-azerty-git"
    "${_pkgbase}-gx701-qwerty-git"
    "${_pkgbase}-gx701-azerty-git"
    "${_pkgbase}-g533-qwerty-git"
    "${_pkgbase}-g533-azerty-git"
)
pkgver=r152.a1c7ced
pkgrel=1
pkgdesc="Linux newest feature-rich configurable driver for Asus numpad"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-touchpad-numpad-driver"
license=('GPL3')
depends=('libevdev' 'python-libevdev' 'i2c-tools' 'python-numpy' 'python-evdev')
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
    if [ "$layout" == "qwerty" ]; then
        PERCENTAGE_KEY=6
    elif [ "$layout" == "azerty" ]; then
        PERCENTAGE_KEY=40
    fi
    sed -i "s/\$LAYOUT \$PERCENTAGE_KEY/${model} ${PERCENTAGE_KEY}/" "asus_touchpad.service"
    sed -i "s#/usr/share/asus_touchpad_numpad-driver/asus_touchpad.py#${pkgdir}/usr/share/asus_touchpad_numpad-driver/asus_touchpad.py#" "asus_touchpad.service"
    install -Dm755 asus_touchpad.py "${pkgdir}/usr/share/asus_touchpad_numpad-driver/asus_touchpad.py"
    install -Dm644 "asus_touchpad.service" "${pkgdir}/usr/lib/systemd/system/asus_touchpad_numpad.service"
    install -Dm 644 -t "${pkgdir}/usr/share/asus_touchpad_numpad-driver/numpad_layouts" numpad_layouts/*.py
}

main() {
    for _pkgname in "${pkgname[@]}"; do
        eval "package_${_pkgname}() {
            model="$(echo ${_pkgname%-*} | sed "s/${_pkgbase}-//" | awk -F '-' '{print $1}')"
            layout="$(echo ${_pkgname%-*} | sed "s/${_pkgbase}-//" | awk -F '-' '{print $2}')"
            _package
        }"
    done
}

main
