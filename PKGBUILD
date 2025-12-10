# Maintainer: Hao Zhang <hao@hao-zhang.com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=pycharm-eap
_buildver=253.28294.336
_pkgver=2025.3
_eap=false
pkgver="${_buildver}_${_pkgver}"
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

sha256sums=("a410c9c5834ede16373325ea21b850e309557db5d9dcca3674caf92ea7c5bf05"
            "b76e9b0a64a62d0775b4fa98313f6cbc2c3a2306da3715cb1f855dea5736ece0")

prepare() {
    if [[ -d $srcdir/pycharm-${_pkgver} ]]; then
        mv $srcdir/pycharm-${_pkgver} $srcdir/pycharm-${_buildver}
    fi
}

build() {
    # compile PyDev debugger used by PyCharm to speedup debugging
    find $srcdir/pycharm-${_buildver}/plugins/python-ce/helpers/pydev/_pydevd_bundle/ \( -name *.c -o -name *.so -o -name *.pyd \) -delete
    sed -i '1s/^/# cython: language_level=3\n/' $srcdir/pycharm-${_buildver}/plugins/python-ce/helpers/pydev/_pydevd_bundle/pydevd_cython.pxd
    sed -i '/compatible_c/d' $srcdir/pycharm-${_buildver}/plugins/python-ce/helpers/pydev/setup_cython.py
    python $srcdir/pycharm-${_buildver}/plugins/python-ce/helpers/pydev/setup_cython.py build_ext --inplace --force-cython
    rm -rf $srcdir/pycharm-${_buildver}/plugins/python-ce/helpers/pydev/build/
    find $srcdir/pycharm-${_buildver}/plugins/python-ce/helpers/pydev/ -name __pycache__ -exec rm -rf {} \;
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
