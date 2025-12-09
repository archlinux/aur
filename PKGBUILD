# Maintainer: XavierCLL <xavier.corredor.llano at gmail.com>
# Maintainer for aarch64: Ethan Reece <aur at ethanreece dot com>
# Contributor: Frederik Olesen
# Contributor: Andrew Shark

pkgname=pycharm
pkgver=2025.3
pkgrel=1
provides=("pycharm")
replaces=("pycharm-professional")
conflicts=('pycharm-professional' 'pycharm-community-edition')
pkgdesc="The only Python IDE you need. Bundled with the official JetBrains Runtime (JBR)"
arch=('x86_64' 'x86_64_v3' 'aarch64')
url='https://www.jetbrains.com/pycharm/'
license=('custom')
options=('!strip')
backup=(
    "opt/${pkgname}/bin/pycharm64.vmoptions"
    "opt/${pkgname}/bin/idea.properties"
)
depends=(
    giflib
    glibc
    sh
    python
    libdbusmenu-glib
    ttf-font
    fontconfig
)
source=("pycharm.desktop" "ltedit.desktop")
source_x86_64=("https://download-cf.jetbrains.com/python/${pkgname}-${pkgver}.tar.gz")
source_x86_64_v3=($source_x86_64)
source_aarch64=("https://download-cf.jetbrains.com/python/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums=('9fd489cc6c91f69d3e4678716910bceab95114028976051ec191d1671e300f59'
            '944d01526dcc0e6d4c321873bd42d2c7885973e929f3b363c31019f642af0101')
sha256sums_x86_64=('a410c9c5834ede16373325ea21b850e309557db5d9dcca3674caf92ea7c5bf05')
sha256sums_x86_64_v3=('a410c9c5834ede16373325ea21b850e309557db5d9dcca3674caf92ea7c5bf05')
sha256sums_aarch64=('97f00b722caba564eaf4eda35bb3344a92f3bd76e798ea58e65f45efa4054e14')
makedepends=('python-setuptools' 'cython')
optdepends=(
    'ipython: For enhanced interactive Python shell inside Pycharm'
    'openssh: For deployment and remote connections'
    'python-setuptools: Packages manager for Python, for project interpreter'
    'python-coverage: For support code coverage measurement'
    'docker-machine: For support docker inside Pycharm'
    'docker-compose: For support docker inside Pycharm'
    'vagrant: For support virtualized development environments'
    'python-pytest: For support testing inside Pycharm'
    'python-tox: Python environments for testing tool'
    'jupyter-server: For Jupyter notebooks and apps'
)
            
prepare() {
    # clean up for PyDev debugger
    find pycharm-${pkgver}/plugins/python-ce/helpers/pydev/ \( -name *.so -o -name *.pyd -o -name *.dll \) -delete
}

build(){
    cd "pycharm-${pkgver}"
    echo ":: Building Cython speed-ups"
    # compile PyDev debugger used by PyCharm to speedup debugging
    python ./plugins/python-ce/helpers/pydev/setup_cython.py build_ext --inplace --force-cython

    _gccarch='-m64'
    if [ "${CARCH}" == "aarch64" ]; then
        _gccarch='-march=armv8-a+crypto'
    fi

    # for attach debugger
    pushd ./plugins/python-ce/helpers/pydev/pydevd_attach_to_process/linux_and_mac
        g++ $_gccarch -shared -o ../attach_linux_amd64.so -fPIC -nostartfiles attach.cpp
    popd

    rm -rf ./plugins/python/helpers/pydev/build
    echo ":: Cython speed-ups done"
}

package() {
    # licenses
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m 644 "pycharm-${pkgver}/license/"* "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    # base
    install -dm 755 "${pkgdir}/opt/${pkgname}"
    mv "pycharm-${pkgver}/"* "${pkgdir}/opt/${pkgname}/"
    install -dm 755 "${pkgdir}/usr/share/applications"
    install -Dm 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm 644 "ltedit.desktop" "${pkgdir}/usr/share/applications/"
    install -dm 755 "${pkgdir}/usr/share/icons/hicolor/"{128x128,scalable}"/apps/"
    install -Dm 644 "${pkgdir}/opt/${pkgname}/bin/pycharm.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pycharm.png"
    install -Dm 644 "${pkgdir}/opt/${pkgname}/bin/pycharm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pycharm.svg"

    # fix the path of the binary in Pycharm Light Edit launcher
    sed -i "s/pycharm.sh/pycharm/g" "${pkgdir}/opt/${pkgname}/bin/ltedit.sh"

    # exec
    install -dm 755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/bin/pycharm" "${pkgdir}/usr/bin/pycharm"
    ln -s "/opt/${pkgname}/bin/ltedit.sh" "${pkgdir}/usr/bin/ltedit"
}

