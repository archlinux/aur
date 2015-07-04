# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}
pkgver=2.1.1
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('python2' 'pcsclite' 'ccid')
makedepends=('git' 'python2-pyside' 'python2-pyscard-svn' 'python2-pbkdf2' 'python2-setuptools')
source="https://github.com/Yubico/yubioath-desktop/releases/download/yubioath-desktop-2.1.1/yubioath-desktop-2.1.1.tar.gz"
sha256sums=('8d4243311d7cbd08970d81e38616f90b851fa73939bf7ffaa91fe5c2aa2025d5')

package() {
    mkdir -p ${pkgdir}/usr/bin

    cat >> "$pkgdir/usr/bin/yubicoauthenticator" <<EOF
#!/bin/sh
python2 /usr/lib/python2.7/site-packages/yubicoauthenticator/yubico_authenticator.py
EOF
    chmod +x "$pkgdir/usr/bin/yubicoauthenticator"


    cat >> "$pkgdir/usr/bin/yubicoauthenticator-disable-systray" <<EOF
#!/bin/sh
python2 /usr/lib/python2.7/site-packages/yubicoauthenticator/yubico_authenticator.py --disable-systray
EOF
    chmod +x "$pkgdir/usr/bin/yubicoauthenticator-disable-systray"
	
    cd "${srcdir}/$_pkgname-${pkgver}"
	python2 setup.py install --root=${pkgdir}

    mkdir -p ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/$_pkgname-${pkgver}/resources/yubioath.desktop ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -D -m0644 ${srcdir}/$_pkgname-${pkgver}/resources/yubioath.xpm ${pkgdir}/usr/share/pixmaps
}
