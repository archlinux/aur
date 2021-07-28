# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=pycharm-professional
pkgver=2021.2
pkgrel=1
pkgdesc="Python IDE for Professional Developers. Professional Edition"
arch=('x86_64')
url='https://www.jetbrains.com/pycharm/'
conflicts=('pycharm' 'pycharm-community-edition')
provides=('pycharm')
license=('custom')
backup=("opt/$pkgname/bin/pycharm.vmoptions"
        "opt/$pkgname/bin/pycharm64.vmoptions"
        "opt/$pkgname/bin/idea.properties")
depends=('giflib' 'glibc' 'sh' 'libxtst' 'libxslt' 'libxss' 'nss' 'python' 'libdbusmenu-glib')
source=("https://download.jetbrains.com/python/$pkgname-$pkgver.tar.gz"
        "pycharm-professional.desktop"
        "charm.desktop"
        "charm")
sha256sums=('2f6d8bcf4e11701664c6acc62e465f31619893d8c7fdcb746b9d7cec385203d1'
            'a75264959b06a45ea0801729bc1688bfbd52da3c5fbf3d5b1ad9267860439291'
            '6996b38a3c2ba1e472838d7046a4c54a27822fd647be9ca590457e8c6a2d50c8'
            '43d05c8bebe48eaa0489f739387c58ad919b2f07a2d9003c8e6fb1cc309e3af2')
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
            'jupyter: For support Jupyter Notebook')
            
build() {
    # compile PyDev debugger used by PyCharm to speedup debugging
    find pycharm-${pkgver}/plugins/python/helpers/pydev/ \( -name *.c -o -name *.so -o -name *.pyd \) -delete
    sed -i '1s/^/# cython: language_level=3\n/' pycharm-${pkgver}/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_cython.pxd
    python pycharm-${pkgver}/plugins/python/helpers/pydev/setup_cython.py build_ext --inplace --force-cython
    rm -rf pycharm-${pkgver}/plugins/python/helpers/pydev/build/
    find pycharm-${pkgver}/plugins/python/helpers/pydev/ -name __pycache__ -exec rm -rf {} \;
    
    rm -r pycharm-${pkgver}/lib/pty4j-native/linux/{mips64el,ppc64le,aarch64}
}

package() {
    # licenses
    install -dm 755 "$pkgdir/usr/share/licenses/$pkgname/"
    mv "pycharm-$pkgver/license/"* "$pkgdir/usr/share/licenses/$pkgname/"
    
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
