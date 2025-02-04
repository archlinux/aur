# Maintainer: Emma Nora Theuer <wallman@entheuer.de>

pkgname=wallman
pkgver=1.5.1.3
pkgrel=1
pkgdesc="A simple program to set dynamic wallpapers on standalone X11 window managers and wayland compositors"
arch=('any')
url="https://git.entheuer.de/emma/wallman"
license=('MIT')
depends=('feh' 'python' 'python-apscheduler' 'python-pillow' 'python-pystray')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-installer')
provides=("$pkgname=$pkgver")
source=("https://files.pythonhosted.org/packages/73/fd/07bf7fdb9b291195b6cda44afac9705607cb1f8c5ad67f980169bac5c050/wallman-1.5.1.3.tar.gz")
b2sums=('14b57d7b9e4d3b2d884121942fc32cf43b422ab198cf986cc44b541fbd98da3027110c4d61d997590f90c477155a0ccb6af011f16c9216c4ff2d080ad4a78078')
# Treating this as config files seems to be necessary for python to do not complain
backup=('etc/wallman/icons/WallmanLogo.jpg' 'etc/wallman/icons/systrayIcon.jpg')


build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Copy LICENSE
    install -D -m 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    # Copy Icons
    if [ -d "icons" ]; then
        install -d -m 755 "$pkgdir/etc/$pkgname/icons"
        cp -r icons/* "$pkgdir/etc/$pkgname/icons/"
    fi

    # Copy sample config
    install -D -m 644 sample_config.toml -t "$pkgdir/etc/$pkgname/"

    # Copy .desktop file
    install -D -m 755 packaging/wallman.desktop -t "$pkgdir/usr/share/application/$pkgname.desktop"

    # Create logdirectory
    install -d -m 733 "$pkgdir/var/log/$pkgname"
}
