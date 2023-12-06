# Maintainer: Kamack38 <kamack38.biznes@gmail.com>

_pkgbase=asus-numberpad-driver
pkgbase="${_pkgbase}-git"
pkgname=(
    "${_pkgbase}-b7402-git"
    "${_pkgbase}-b7402-unicode-git"
    "${_pkgbase}-e210ma-git"
    "${_pkgbase}-e210ma-unicode-git"
    "${_pkgbase}-g513-git"
    "${_pkgbase}-g513-unicode-git"
    "${_pkgbase}-g533-git"
    "${_pkgbase}-g533-unicode-git"
    "${_pkgbase}-gx551-git"
    "${_pkgbase}-gx551-unicode-git"
    "${_pkgbase}-gx701-git"
    "${_pkgbase}-gx701-unicode-git"
    "${_pkgbase}-up5401ea-git"
    "${_pkgbase}-up5401ea-unicode-git"
    "${_pkgbase}-ux433fa-git"
    "${_pkgbase}-ux433fa-unicode-git"
    "${_pkgbase}-ux581l-git"
    "${_pkgbase}-ux581l-unicode-git"
)
pkgver=r654.6693e3b
pkgrel=1
pkgdesc="Linux newest feature-rich configurable driver for Asus numberpad"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-numberpad-driver"
license=('GPL3')
depends=(
    'ibus'
    'libevdev'
    'python-libevdev'
    'i2c-tools'
    'python-libevdev'
    'python-inotify'
    'python-xlib'
    'python-numpy'
    'python-evdev'
    'xorg-xinput'
)
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
    _config_dir="/usr/share/${_pkgbase}"
    _log_dir="/var/log/asus-numberpad-driver"
    mkdir -p "${pkgdir}${_log_dir}"
    cd "${srcdir}/${_pkgbase}"
    install -Dm755 numberpad.py "${pkgdir}/${_config_dir}/numberpad.py"
    install -Dm644 "asus_numberpad_driver.service" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.service"
    install -Dm644 "asus_numberpad_driver.x11.service" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.x11.service"
    sed -i "s#\$LAYOUT_NAME#${model}#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.service"
    sed -i "s#\$LAYOUT_NAME#${model}#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.x11.service"
    sed -i "s#\$CONFIG_FILE_DIR_PATH#${_config_dir}#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.service"
    sed -i "s#\$CONFIG_FILE_DIR_PATH#${_config_dir}#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.x11.service"
    sed -i "s#\$ERROR_LOG_FILE_PATH#${_log_dir}/error.log#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.service"
    sed -i "s#\$ERROR_LOG_FILE_PATH#${_log_dir}/error.log#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.x11.service"
    install -Dm 644 -t "${pkgdir}/${_config_dir}/layouts" layouts/*.py
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
