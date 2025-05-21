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
	"${_pkgbase}-up5401ea-3145-git"
	"${_pkgbase}-ux433fa-git"
	"${_pkgbase}-ux581l-git"
)
pkgver=r957.67b52e9
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
	'python-pyinotify'
	'python-xlib'
	'python-numpy'
	'python-evdev'
	'python-smbus2'
	'xorg-xinput'
	'python-pyasyncore'
	'python-xkbcommon'
	'python-pywayland'
)
makedepends=('git')
provides=("${_pkgbase}")
replaces=('asus-touchpad-numpad-driver-git')
source=("git+${url}.git" "service.patch")
sha256sums=('SKIP'
            '57e60fe18e969a43061533d9e6d5ad44992cf75b79cb4fb76aba6b900cffa6b0')
install="$pkgbase.install"

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch "${srcdir}/${_pkgbase}/asus_numberpad_driver.wayland.service" service.patch
	patch "${srcdir}/${_pkgbase}/asus_numberpad_driver.x11.service" service.patch
}

_package() {
	_config_dir="/usr/share/${_pkgbase}"
	_log_dir="/var/log/asus-numberpad-driver"
	mkdir -p "${pkgdir}${_log_dir}"
	cd "${srcdir}/${_pkgbase}"
	install -Dm755 numberpad.py "${pkgdir}/${_config_dir}/numberpad.py"
	install -Dm644 "asus_numberpad_driver.wayland.service" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.wayland.service"
	install -Dm644 "asus_numberpad_driver.x11.service" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.x11.service"
	sed -i "s#\$LAYOUT_NAME#${model}#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.wayland.service"
	sed -i "s#\$LAYOUT_NAME#${model}#" "${pkgdir}/usr/lib/systemd/system/asus_numberpad_driver.x11.service"
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
