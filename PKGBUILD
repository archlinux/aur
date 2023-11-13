pkgname="rt-pyocd-git"
pkgver=0.2.2.0.g3f8626e
pkgrel=1
pkgdesc="RT_Thread DAP-Link 调试实例!"
arch=("x86_64")
license=("")
depends=('git' 'python')
url="https://github.com/RT-Thread-Studio/sdk-debugger-pyocd"

pkggitname="sdk-debugger-pyocd"

source=(${pkggitname}::git+https://github.com/RT-Thread-Studio/${pkggitname}.git)
sha512sums=('SKIP')

_root="/opt/rt-thread"
_tools_root="${_root}/tools"
_pyocd_root="${_tools_root}/pyocd"

pkgver() {
    _ver=`cd ${pkggitname} && git describe --long --tags | sed 's/-/\./g; s/^v//; s/g*$//'`
    echo $_ver
}

build() {
    mkdir -p ${srcdir}${_root}
    mkdir -p ${srcdir}${_pyocd_root}/bin
    cp -r ${srcdir}/${pkggitname}/packs ${srcdir}${_pyocd_root}/bin
    cd ${srcdir}${_pyocd_root}/bin/packs && python ./update_yaml.py
}

package() {
    install -d -m755 "${pkgdir}${_pyocd_root}"
    cp -rf ${srcdir}${_pyocd_root}/* "${pkgdir}${_pyocd_root}"
}

(
    echo "pre_install() {"
    echo "    python -m venv ${_pyocd_root}"
    echo "    ${_pyocd_root}/bin/pip install pyocd"
    echo "}"
    echo "post_install() {"
    echo '    echo "SUBSYSTEMS==\"usb\", GROUP=\"users\", MODE=\"0666\"" > /etc/udev/rules.d/99-rt-usb.rules'
    echo "    udevadm control --reload-rules && udevadm trigger"
    echo "}"
    echo "post_remove() {"
    echo "    rm -rf ${_pyocd_root}"
    echo "}"
) > "${startdir}/${pkgname}.install"
true && install="${pkgname}.install"
