# Maintainer: Emma Nora Theuer <wallman@entheuer.de>

pkgname=wallman
pkgver=1.5.1.5
pkgrel=1
pkgdesc="A simple program to set dynamic wallpapers on standalone X11 window managers and wayland compositors"
arch=('any')
url="https://git.entheuer.de/emma/wallman"
license=('MIT')
depends=('feh' 'python' 'python-apscheduler' 'python-pillow' 'python-pystray')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-installer')
provides=("$pkgname=$pkgver")
source=("https://files.pythonhosted.org/packages/f4/71/491067bd530d813dd19716e37aada4f4623e2990914597350775872e7df8/wallman-1.5.1.5.tar.gz")
b2sums=('033d5ba4101fb1a576aa731052bf5682bc9ac6be23bc7f99c983041b1b256bed4b089ffc13644755e113f35945b180ed5e8013a26b3fa180574151b0b6230421')
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
