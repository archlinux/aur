# Maintainer: Hao Zhang <hao@hao-zhang.com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=pycharm-eap
_buildver=233.11799.209
_pkgver=2023.3
_eap=true
pkgver="${_pkgver}.${_buildver}"
pkgrel=1
pkgdesc="Powerful Python and Django IDE, Early Access Program (EAP) build. Professional edition."
arch=("any")
options=("!strip")
url="https://www.jetbrains.com/pycharm/nextversion/"
license=("custom")
makedepends=('python-setuptools' 'cython')
optdepends=('ipython: For enhanced interactive Python shell inside Pycharm'
            'openssh: For deployment and remote connections'
            'python-setuptools: Packages manager for Python, for project interpreter'
            'python-coverage: For support code coverage measurement for Python'
            'docker-machine: For support docker inside Pycharm'
            'docker-compose: For support docker inside Pycharm'
            'vagrant: For support virtualized development environments'
            'python-pytest: For support testing inside Pycharm with Python'
            'python-tox: Python environments for testing tool with Python'
            'jupyter-notebook: For support Jupyter Notebook')
provides=("pycharm" "pycharm-professional")

if [[ $_eap = false ]]; then
    source=("https://download.jetbrains.com/python/pycharm-professional-${_pkgver}.tar.gz"
    "${pkgname}.desktop")
else
    source=("https://download.jetbrains.com/python/pycharm-professional-${_buildver}.tar.gz"
    "${pkgname}.desktop")
fi

sha256sums=("177bd4ee26c13792a07f5d3da0201d630e58b84cd947798159de7144a1122915"
            "7801ea1379c4c183efeb78ec8d2f67bc30741548410fa51b9f4827b0188da4b2")

prepare() {
    if [[ -d $srcdir/pycharm-${_pkgver} ]]; then
        mv $srcdir/pycharm-${_pkgver} $srcdir/pycharm-${_buildver}
    fi
}

build() {
    # compile PyDev debugger used by PyCharm to speedup debugging
    find $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/ \( -name *.c -o -name *.so -o -name *.pyd \) -delete
    sed -i '1s/^/# cython: language_level=3\n/' $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_cython.pxd
    sed -i '/compatible_c/d' $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/setup_cython.py
    python $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/setup_cython.py build_ext --inplace --force-cython
    rm -rf $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/build/
    find $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/ -name __pycache__ -exec rm -rf {} \;
}

package() {
    cd "${srcdir}"
    install -dm 755 \
        "${pkgdir}/opt/${pkgname}" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/licenses/" \
        "${pkgdir}/usr/share/applications/"

    mv "${srcdir}"/pycharm-${_buildver}/license "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${srcdir}"/pycharm-${_buildver}/* "${pkgdir}/opt/${pkgname}"

    sed -i "s/Version=/Version=${pkgver}/g" "${pkgname}.desktop"
    install -m755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

    ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-eap"
}
