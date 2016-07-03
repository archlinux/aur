# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}-git
pkgver=336
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('python2' 'pcsclite' 'ccid')
makedepends=('git' 'python2-pyside' 'python2-pyscard-svn' 'python2-pbkdf2' 'python2-setuptools' 'python2-pyside-tools' 'python2-crypto' 'yubikey-personalization')
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
    python2 setup.py qt_resources
	python2 setup.py install --root=${pkgdir}

    sed -i '/PySide/d' ${pkgdir}/usr/lib/python2.7/site-packages/yubioath_desktop-3.0.2.dev0-py2.7.egg-info/requires.txt

    mkdir -p ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/yubioath-desktop/resources/yubioath.desktop ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -D -m0644 ${srcdir}/yubioath-desktop/resources/yubioath.xpm ${pkgdir}/usr/share/pixmaps
}
