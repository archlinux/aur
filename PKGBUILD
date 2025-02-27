# Maintainer: Emma Nora Theuer <wallman@entheuer.de>

pkgname=wallman
pkgver=1.5.2.7
pkgrel=1
pkgdesc="A simple program to set dynamic wallpapers on standalone X11 window managers and wayland compositors"
arch=('any')
url="https://git.entheuer.de/emma/wallman"
license=('MIT')
depends=('feh' 'python' 'python-apscheduler' 'python-pillow' 'python-pystray')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-installer')
provides=("$pkgname=$pkgver")
source=("https://files.pythonhosted.org/packages/17/69/16d324a9b547ea8289d96cbe637b8a052c7a3a48e4f57184dfb1c7875fb1/wallman-1.5.2.7.tar.gz")
b2sums=('5cc3478d95e792ad0759fe115d90d83cc98ee1e0c26fac673169f80a7bf3d4ae44e39b7158b708998b2021d3b2a74ce5630c091e438b4bbff6809657ba9c884f')
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
