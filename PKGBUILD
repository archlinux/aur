# Maintainer: Pierre Grasser <pierre.grasser@proton.me>
pkgname=custom-install-git
_pkgname=${pkgname%-git}
pkgver=2.1.r8.g1be4221
pkgrel=1
pkgdesc="Installs a title directly to an SD card for the Nintendo 3DS"
arch=('any')
url="https://github.com/ihaveamac/custom-install"
license=('MIT')
depends=('python' 'python-events' 'python-pyctr' 'save3ds_fuse')
makedepends=('git')
optdepends=('tk: GUI support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/ihaveamac/custom-install.git#branch=safe-install'
        'https://github.com/ihaveamac/custom-install/releases/download/v2.1/custom-install-finalize.3dsx' # To be built at some point
        'custominstall.sh'
        'ci-gui.sh')
md5sums=('SKIP'
         'd7c4f5b41bb30dc7db978a2ffe61ad4e'
         '8428490bcd8068b4c12812d9daf26435'
         '52ec8eb031d26f49fecbb8f04871a0cd')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
    
    # License
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md

    # CLI
    install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/" custominstall.py
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/" title.db.gz
    # GUI
    install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/" ci-gui.py
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/" TaskbarLib.tlb
    # Wrappers for /usr/bin
    install -Dm755 "$srcdir/custominstall.sh" "$pkgdir/usr/bin/custominstall"
    install -Dm755 "$srcdir/ci-gui.sh" "$pkgdir/usr/bin/ci-gui"

    # Title DB
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/" title.db.gz
    # custom-install-finalize 3DSX
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/" "$srcdir/custom-install-finalize.3dsx"
    
    # Symlink save3ds_fuse
    mkdir -p "$pkgdir/usr/lib/$_pkgname/bin/linux/"
    ln -sf /usr/bin/save3ds_fuse "$pkgdir/usr/lib/$_pkgname/bin/linux/save3ds_fuse"
}
