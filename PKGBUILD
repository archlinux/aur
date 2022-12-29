# Maintainer: XavierCLL <xavier.corredor.llano at gmail.com>
# Contributors: MikeBreytenbach <mike.breyten.bach at gmail dot com>
# Contributors: edacval

pkgname=pycharm-professional
pkgver=2022.3.1
pkgrel=1
pkgdesc="Python IDE for Professional Developers. Professional Edition"
arch=('x86_64')
url='https://www.jetbrains.com/pycharm/'
conflicts=('pycharm' 'pycharm-community-edition' 'pycharm-community-jre' 'pycharm-community-eap' 'pycharm-eap')
provides=('pycharm')
license=('custom')
backup=("opt/$pkgname/bin/pycharm64.vmoptions"
        "opt/$pkgname/bin/idea.properties")
depends=('giflib' 'glibc' 'sh' 'libxtst' 'libxslt' 'libxss' 'nss' 'python' 'libdbusmenu-glib')
source=("https://download.jetbrains.com/python/$pkgname-$pkgver.tar.gz"
        "pycharm-professional.desktop"
        "charm.desktop"
        "charm")
sha256sums=('8f845077cc0fa3582348ee3d76a69ff001391b3f3d63a9b279b8039fd6e07622'
            'a75264959b06a45ea0801729bc1688bfbd52da3c5fbf3d5b1ad9267860439291'
            '6996b38a3c2ba1e472838d7046a4c54a27822fd647be9ca590457e8c6a2d50c8'
            '2c520f63afffa5ef153077fc61e0c3b15a0a9bf8fd4973164af62ec64626a741')
makedepends=('python-setuptools' 'cython')
optdepends=('ipython: For enhanced interactive Python shell inside Pycharm'
            'openssh: For deployment and remote connections'
            'python-setuptools: Packages manager for Python, for project interpreter'
            'python-coverage: For support code coverage measurement'
            'cython: For performance debugger'
            'docker-machine: For support docker inside Pycharm'
            'docker-compose: For support docker inside Pycharm'
            'vagrant: For support virtualized development environments'
            'python-pytest: For support testing inside Pycharm'
            'python-tox: Python environments for testing tool'
            'jupyter-server: For Jupyter notebooks and apps')
            
build() {
    # clean up and compile PyDev debugger used by PyCharm to speedup debugging
    find pycharm-${pkgver}/plugins/python/helpers/pydev/ \( -name *.so -o -name *.pyd \) -delete
    sed -i '1s/^/# cython: language_level=3\n/' pycharm-${pkgver}/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_cython.pxd
    python pycharm-${pkgver}/plugins/python/helpers/pydev/setup_cython.py build_ext --inplace --force-cython
    
    # for attach debugger
    pushd pycharm-${pkgver}/plugins/python/helpers/pydev/pydevd_attach_to_process/linux_and_mac
    g++ -m64 -shared -o ../attach_linux_amd64.so -fPIC -nostartfiles attach.cpp
    popd

    rm -rf pycharm-${pkgver}/plugins/python/helpers/pydev/build/
    find pycharm-${pkgver}/plugins/python/helpers/pydev/ -name __pycache__ -exec rm -rf {} \;
}

package() {
    # licenses
    install -dm 755 "$pkgdir/usr/share/licenses/$pkgname/"
    install -m 644 "pycharm-$pkgver/license/"* "$pkgdir/usr/share/licenses/$pkgname/"
    
    # base
    install -dm 755 "$pkgdir/opt/$pkgname"
    mv "pycharm-$pkgver/"* "$pkgdir/opt/$pkgname/"
    install -dm 755 "$pkgdir/usr/share/applications"
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/"
    install -dm 755 "$pkgdir/usr/share/icons/hicolor/"{128x128,scalable}"/apps/"
    install -Dm 644 "$pkgdir/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pycharm.png"
    install -Dm 644 "$pkgdir/opt/$pkgname/bin/pycharm.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pycharm.svg"

    # exec
    install -dm 755 "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm"

    # install charm application - for edit a single file in Pycharm
    install -Dm 755 charm "$pkgdir/usr/bin/"
    install -Dm 644 charm.desktop "$pkgdir/usr/share/applications/"
}
