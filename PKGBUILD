pkgname="rt-pyocd-git"
pkgver=0.2.0.0.g8c6a063
pkgrel=1
pkgdesc="RT_Thread DAP-Link 调试实例!"
arch=("x86_64")
license=("")
depends=('git' 'python')
url="https://github.com/RT-Thread-Studio/sdk-debugger-pyocd"

pkggitname="sdk-debugger-pyocd"

source=(${pkggitname}::git+https://github.com/RT-Thread-Studio/${pkggitname}.git)
sha512sums=(SKIP)

ROOT="${HOME}/.rt-thread"
TOOLS_ROOT="${ROOT}/tools"
PYOCD_ROOT="${TOOLS_ROOT}/pyocd"

pkgver() {
    _ver=`cd ${pkggitname} && git describe --long --tags | sed 's/-/\./g; s/^v//; s/g*$//'`
    echo $_ver
}

build() {
    mkdir -p ${srcdir}${ROOT}
    mkdir -p ${srcdir}${PYOCD_ROOT}/bin
    cp -r ${srcdir}/${pkggitname}/packs ${srcdir}${PYOCD_ROOT}/bin
    cd ${srcdir}${PYOCD_ROOT}/bin/packs && python ./update_yaml.py
}

package() {
    mkdir -p ${pkgdir}${HOME}
    chmod 700 ${pkgdir}${HOME}
    install -d -m755 "${pkgdir}${PYOCD_ROOT}"
    cp -rf ${srcdir}${PYOCD_ROOT}/* "${pkgdir}${PYOCD_ROOT}"
    chown -R $USER:`id -g -n $USER` ${pkgdir}${PYOCD_ROOT}
}

(
    cd "${pkgdir}"
    echo "pre_install() {"
    echo "    python -m venv ${PYOCD_ROOT}"
    echo "    ${PYOCD_ROOT}/bin/pip install pyocd"
    echo "}"
    echo "post_install() {"
    echo '    echo "SUBSYSTEMS==\"usb\", GROUP=\"users\", MODE=\"0666\"" > /etc/udev/rules.d/99-rt-usb.rules'
    echo "    udevadm control --reload-rules && udevadm trigger"
    echo "}"
    echo "post_remove() {"
    echo "    rm -rf ${PYOCD_ROOT}"
    echo "}"
) > "${startdir}/${pkgname}.install"
true && install="${pkgname}.install"