# Maintainer: Felix E. Klee <felix.klee@inka.de>

_gitname=vncdesk
pkgname="$_gitname"-git
pkgver=1.1.0.r0.ga0b4396
pkgrel=2
pkgdesc="Runs applications via VNC. Useful for scaling on high DPI (HiDPI) screens."
arch=('any')
url="https://github.com/feklee/vncdesk"
license=('custom:WTFPL')
depends=('tigervnc' 'gtk-vnc' 'python' 'python-gobject')
makedepends=('git' 'python-setuptools')
source=('git://github.com/feklee/vncdesk')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long | \
        sed 's/^v//' | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    git checkout $(git describe --long)
}

package() {
	cd "$srcdir/$_gitname"
    cat << EOF >vncdesk/font_path.py
font_path = ','.join(['/usr/share/fonts/misc/',
                      '/usr/share/fonts/75dpi/',
                      '/usr/share/fonts/100dpi/',
                      '/usr/share/fonts/Type1/'])
EOF
    python setup.py install --root="${pkgdir}"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
