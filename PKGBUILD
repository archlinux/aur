# Maintainer: Emma Nora Theuer <wallman@entheuer.de>

pkgname=wallman
pkgver=1.5.2.8
pkgrel=1
pkgdesc="A simple program to set dynamic wallpapers on standalone X11 window managers and wayland compositors"
arch=('any')
url="https://git.entheuer.de/emma/wallman"
license=('MIT')
depends=('feh' 'python' 'python-apscheduler' 'python-pillow' 'python-pystray')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-installer')
provides=("$pkgname=$pkgver")
source=("https://files.pythonhosted.org/packages/4e/fe/0998cd577e5b4e72cc60a7a3d95d11ff9b86c7c5e848aa0d8dc4690f75e8/wallman-1.5.2.8.tar.gz")
b2sums=('116ef95afff6569cea63d0777b13a59da07ea6e0cf08692a3c470d1b3d135b7051adc0892f5558aecba2a49c81f7a2c848baa63763dceffe53d8565952654b3a')
# Treating this as config files seems to be necessary for python to do not complain
backup=('etc/wallman/icons/WallmanLogo.jpg' 'etc/wallman/icons/systrayIcon.jpg' 'etc/wallman/DefaultFallbackWallpaper.jpg')


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

    # Copy Fallback Wallpaper
    install -D -m 644 DefaultFallbackWallpaper.jpg -t "$pkgdir/etc/$pkgname/"

    # Copy .desktop file
    install -D -m 755 packaging/wallman.desktop -t "$pkgdir/usr/share/application/$pkgname.desktop"

    # Create logdirectory
    install -d -m 733 "$pkgdir/var/log/$pkgname"
}
