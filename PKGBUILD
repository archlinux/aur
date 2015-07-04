# Maintainer: tuftedocelot@fastmail.fm
_pkgname=yubioath-desktop
pkgname=yubico-${_pkgname}-git
pkgver=206
pkgrel=1
pkgdesc="Crossplatform graphical user interface to generate one-time passwords."
arch=('i686' 'x86_64')
url="https://developers.yubico.com/yubioath-desktop/"
license=('GPL')
depends=('python2' 'pcsclite' 'ccid')
makedepends=('git' 'python2-pyside' 'python2-pyscard-svn' 'python2-pbkdf2' 'python2-setuptools')
source="git+https://github.com/Yubico/yubioath-desktop.git"
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git rev-list --count HEAD
}

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
	
    cd "$_pkgname"
	python2 setup.py install --root=${pkgdir}

    mkdir -p ${pkgdir}/usr/share/applications/
    install -D -m0644 ${srcdir}/yubioath-desktop/yubicoauthenticator/resources/yubicoauthenticator.desktop ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -D -m0644 ${srcdir}/yubioath-desktop/yubicoauthenticator/resources/yubicoauthenticator.xpm ${pkgdir}/usr/share/pixmaps
}
