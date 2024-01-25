pkgname=python-usbtmc
pkgver=0.8
pkgrel=4
pkgdesc="A Python USBTMC driver for controlling instruments over USB."
arch=('x86_64')
url="https://github.com/python-ivi/python-usbtmc"
license=(MIT)
depends=(
python-pyusb
)
makedepends=(
python-build
python-installer
python-wheel
git
python-setuptools
)
install=python-usbtmc.install

source=(
"git+https://github.com/python-ivi/python-usbtmc#tag=v${pkgver}"
python-usbtmc.sysusers
)
sha256sums=('SKIP'
            '3813bed7349a402231d291fe747cbe4b535081b8d39c33427701983a6bf08074')

prepare(){
    cd python-usbtmc

    # RIGOL stuff is often f'd, see https://web.archive.org/web/20240122010650/https://www.teuniz.net/DSRemote/
    # but the below are some attempts to make them work

    # rigol scope init hack
    curl https://patch-diff.githubusercontent.com/raw/python-ivi/python-usbtmc/pull/62.patch | patch -p1

    # add RIGOL DS1104z to udev rules
    echo '# rigol DS1104z' >> usbtmc.rules
    echo 'SUBSYSTEM=="usb", ACTION=="add", ATTRS{idVendor}=="1ab1", ATTRS{idProduct}=="04ce", GROUP="usbtmc", MODE="0660"' >> usbtmc.rules
}

build(){
    cd python-usbtmc

    python -m build --wheel --no-isolation
}

package(){
    cd python-usbtmc

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm 644 "${srcdir}"/python-usbtmc.sysusers "${pkgdir}"/usr/lib/sysusers.d/python-usbtmc.conf
    install -m 0644 -D usbtmc.rules "${pkgdir}"/etc/udev/rules.d/40-usbtmc.rules
    msg2 "Users might need to be added to the the usbtmc group to avoid permissions issues"
}

