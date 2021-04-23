# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=pycharm-professional
pkgver=2021.1.1
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
sha256sums=('afdbb1f8b63f927b871dd11600e3eb71a739d60f471dc7f4a9752a1aed918971'
            'a75264959b06a45ea0801729bc1688bfbd52da3c5fbf3d5b1ad9267860439291'
            'fdd92952973bf9c70dcb3a570b29fdc534ef87f524d06ca8f6c6422f3b954e14'
            'dc8c77b4c75805fa51f28a7cf8ca394d5143cd939ac5e6f2288132b4a36c7159')
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
    # workaround FS#40934
    sed -i "s/lcd/on/" "pycharm-$pkgver/bin/"*.vmoptions
    
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
