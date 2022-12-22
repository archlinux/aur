# Maintainer: Pierre Grasser <pierre.grasser@proton.me>
pkgname=custom-install-git
_pkgname=${pkgname%-git}
pkgver=2.1.r9.g9ab8236
pkgrel=3
pkgdesc="Installs a title directly to an SD card for the Nintendo 3DS"
arch=('any')
url="https://github.com/ihaveamac/custom-install"
license=('MIT')
depends=('python' 'python-events' 'python-pyctr' 'save3ds_fuse')
makedepends=('git' 'devkitARM' 'devkitarm-rules' 'devkit-env' 'libctru' '3dstools' 'general-tools')
optdepends=('tk: GUI support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/ihaveamac/custom-install.git#branch=safe-install'
        'custominstall.sh'
        'ci-gui.sh'
        'com.github.ihaveamac.CustomInstall.desktop')
md5sums=('SKIP'
         '8428490bcd8068b4c12812d9daf26435'
         '52ec8eb031d26f49fecbb8f04871a0cd'
         '1283d9e3f3b9b7f976a73b73f1656bb9')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname/finalize"
    source /etc/profile.d/devkit-env.sh # just in case
    make
}

package() {
	cd "$srcdir/$_pkgname"

    # CLI
    install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/" custominstall.py
    # GUI
    install -Dm755 -t "$pkgdir/usr/lib/$_pkgname/" ci-gui.py
    # Wrappers for /usr/bin
    install -Dm755 "$srcdir/custominstall.sh" "$pkgdir/usr/bin/custominstall"
    install -Dm755 "$srcdir/ci-gui.sh" "$pkgdir/usr/bin/ci-gui"

    # Title DB
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/" title.db.gz
    # custom-install-finalize 3DSX
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname/" finalize/custom-install-finalize.3dsx

    # Symlink save3ds_fuse
    mkdir -p "$pkgdir/usr/lib/$_pkgname/bin/linux/"
    ln -sf /usr/bin/save3ds_fuse "$pkgdir/usr/lib/$_pkgname/bin/linux/save3ds_fuse"

    # License
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
    # README
    install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md

    # Desktop file
    install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/com.github.ihaveamac.CustomInstall.desktop"
}
