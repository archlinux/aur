# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: KiYugadgeter <getalotofmail@gmail.com
#_pkgname=
pkgname=gnome-ponytail-daemon
pkgver=0.0.11
pkgrel=9
epoch=
pkgdesc='a helper daemon intended for dogtail on Wayland.'
arch=('x86_64')
url='https://gitlab.gnome.org/ofourdan/gnome-ponytail-daemon'
license=('GPL-2.0-or-later')
sha256sums=('SKIP')
groups=()
depends=('gnome-shell' 'glib2-devel' 'systemd' 'libei>=1.0' 'libxkbcommon' 'python' 'python-dbus')
makedepends=('meson' 'ninja')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://gitlab.gnome.org/ofourdan/gnome-ponytail-daemon/-/archive/0.0.11/gnome-ponytail-daemon-0.0.11.tar.gz')
noextract=()
validpgpkeys=()

build() {
    cd "$srcdir/$pkgname-$pkgver"
    meson setup build -Dponytail_python=false
    ninja -C build
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cd "$srcdir/$pkgname-$pkgver"
    sed -i -e "s/usr\/local\/libexec/usr\/bin/" $srcdir/$pkgname-$pkgver/build/src/org.gnome.Ponytail.service 
    sed -i -e "s/usr\/local\/libexec/usr\/bin/" $srcdir/$pkgname-$pkgver/build/src/gnome-ponytail-daemon.service 
    install -D -m755 $srcdir/$pkgname-$pkgver/build/src/gnome-ponytail-daemon $pkgdir/usr/bin/gnome-ponytail-daemon
    install -D -m644 $srcdir/$pkgname-$pkgver/build/src/org.gnome.Ponytail.service $pkgdir/usr/share/dbus-1/services/org.gnome.Ponytail.service
    install -D -m644 $srcdir/$pkgname-$pkgver/build/src/gnome-ponytail-daemon.service $pkgdir/usr/lib/systemd/system/gnome-ponytail-daemon.service
    install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -dm755  $pkgdir/$site_packages/ponytail
    install -D -m644 $srcdir/$pkgname-$pkgver/ponytail/__init__.py $pkgdir/$site_packages/ponytail/__init__.py
    install -D -m644 $srcdir/$pkgname-$pkgver/ponytail/ponytail.py $pkgdir/$site_packages/ponytail/ponytail.py
}

