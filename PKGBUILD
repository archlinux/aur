# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}-git
pkgver=371
pkgrel=2
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('pcsclite' 'ccid' 'python-pyside' 'python-pyscard' 'python-pbkdf2' 'python-setuptools' 'python-pyside-tools' 'python-crypto' 'yubikey-personalization' 'python-click')
makedepends=('git')
source=("git+https://github.com/Yubico/yubioath-desktop.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git rev-list --count HEAD
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    cd "$_pkgname"
    git submodule init
    git submodule update
    python setup.py qt_resources
	python setup.py install --root=${pkgdir}

    sed -i '/PySide/d' ${pkgdir}/usr/lib/python3.6/site-packages/yubioath_desktop-3.1.1.dev0-py3.6.egg-info/requires.txt

    mkdir -p ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/yubioath-desktop/resources/yubioath.desktop ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -D -m0644 ${srcdir}/yubioath-desktop/resources/yubioath.xpm ${pkgdir}/usr/share/pixmaps
}
