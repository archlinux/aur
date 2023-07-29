# Maintainer: XavierCLL <xavier.corredor.llano at gmail.com>
# Maintainer for aarch64: Ethan Reece <aur at ethanreece dot com>

pkgname=pycharm-professional
pkgver=2023.2
pkgrel=1
pkgdesc="Python IDE for Professional Developers. Professional Edition"
arch=('x86_64' 'aarch64')
url='https://www.jetbrains.com/pycharm/'
conflicts=('pycharm' 'pycharm-community-edition' 'pycharm-community-jre' 'pycharm-community-eap' 'pycharm-eap' 'pycharm-community-jre-aarch64')
provides=('pycharm')
license=('custom')
backup=("opt/$pkgname/bin/pycharm64.vmoptions"
        "opt/$pkgname/bin/idea.properties")
depends=('giflib' 'glibc' 'sh' 'libxtst' 'libxslt' 'libxss' 'nss' 'python' 'libdbusmenu-glib')
options=('!strip')
source_x86_64=("https://download.jetbrains.com/python/$pkgname-$pkgver.tar.gz")
source_aarch64=("https://download.jetbrains.com/python/$pkgname-$pkgver-aarch64.tar.gz")
source=("pycharm-professional.desktop"
        "ltedit.desktop")
sha256sums=('a75264959b06a45ea0801729bc1688bfbd52da3c5fbf3d5b1ad9267860439291'
            '41f0e64dc7ec5ab85e7b0df1dc8237b56c94ccf9e4f2fa033eaadcc7756df3d3')
sha256sums_x86_64=('95f1666c471a9d752c53ec0b776840552e023f6405a3b000ce6f1014125bfc83')
sha256sums_aarch64=('533916df23c39ac06df41bb98b7611b707492e51e5ad4b4a9aab8a7391edd9f2')
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
            
if [[ $CARCH == "x86_64" ]]; then
    install=pycharm-professional_x86_64.install
elif [ "${CARCH}" == "aarch64" ]; then
    install=pycharm-professional_aarch64.install
fi
            
prepare() {
    # clean up for PyDev debugger
    find pycharm-${pkgver}/plugins/python/helpers/pydev/ \( -name *.so -o -name *.pyd -o -name *.dll \) -delete
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
    install -Dm 644 ltedit.desktop "$pkgdir/usr/share/applications/"
    install -dm 755 "$pkgdir/usr/share/icons/hicolor/"{128x128,scalable}"/apps/"
    install -Dm 644 "$pkgdir/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/pycharm.png"
    install -Dm 644 "$pkgdir/opt/$pkgname/bin/pycharm.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pycharm.svg"

    # exec
    install -dm 755 "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm"
    ln -s "/opt/$pkgname/bin/ltedit.sh" "$pkgdir/usr/bin/ltedit"
}
