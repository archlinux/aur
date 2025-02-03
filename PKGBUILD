# Maintainer: Emma Nora Theuer <wallman@entheuer.de>

pkgname=wallman
pkgver=1.5.1.1
pkgrel=1
pkgdesc="A simple program to set dynamic wallpapers on standalone X11 window managers and wayland compositors"
arch=('any')
url="https://git.entheuer.de/emma/wallman"
license=('MIT')
depends=('feh' 'python' 'python-apscheduler' 'python-pillow' 'python-pystray')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-installer')
provides=("$pkgname=$pkgver")
source=("https://files.pythonhosted.org/packages/52/1e/6e02f5bb871775a61d1dbc2513b227730487be2252b2766bb33615da79e8/wallman-1.5.1.1.tar.gz")
b2sums=('27c4d584b2905780f244ffe9a0f4292e45946c4858878f5d8f31253c9f3d6f11d7f0d158e713067728f3b1898aa295ab44dabdb0174c87c32cd6e46ecfd88da0')
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
