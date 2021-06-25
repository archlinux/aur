# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

_pkgname=osu-handler
pkgname="$_pkgname-git"
pkgdesc='Provides a handler for osu! file formats (Git version)'
pkgver=0.3.0.r3.g4376b24
pkgrel=1
arch=(any)
license=(GPL3)
depends=(osu-mime glib2)
makedepends=(meson)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install='osu-handler-git.install'
source=('git+https://github.com/openglfreak/osu-handler-wine.git'
        osu-file-extensions-handler.desktop
        osu-url-handler.desktop)
sha256sums=('SKIP'
            '7b2be09150e4eec5b4d74b3c393fb1bb1c2b9896cb07d8fd362233286a8040b8'
            'e5e8d5c1ff6c2e464cb61c88a7ea74b7062ba9f3b8a69e18d5313b9eec3c1e76')

pkgver() {
  cd "$srcdir"

  git -C osu-handler-wine describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"

    arch-meson osu-handler-wine build --unity on -D b_ndebug=true
    meson compile -C build
}

package() {
    cd "$pkgdir"

    install -D -m755 "$srcdir/build/osu-handler-wine" 'usr/lib/osu-handler/osu-handler-wine'
    install -D -m644 "$srcdir/osu-file-extensions-handler.desktop" 'usr/share/applications/osu-file-extensions-handler.desktop'
    install -D -m644 "$srcdir/osu-url-handler.desktop" 'usr/share/applications/osu-url-handler.desktop'
}
