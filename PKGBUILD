# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade-git
pkgver=3.2.0_b4+35+gf7bd1432
pkgrel=1
pkgdesc='SLADE3 Doom editor (git version)'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
         'fluidsynth>=2.2'
         'freeimage'
         'ftgl'
         'glu'
         'gtk3'
         'libgl'
         'lua'
         'mpg123'
         'sfml>=2.5'
         'webkit2gtk'
         'wxgtk3>=3.0'
         'zlib')
makedepends=('cmake'
             'git'
             'p7zip')
provides=('slade')
conflicts=('slade')
source=('slade::git+https://github.com/sirjuddington/SLADE.git'
        '0001-compatibility-with-stable-wxWidgets.patch')
sha256sums=('SKIP'
            'ababb76f64b4cfbdabd283ffb8e5d7900f270893161433e84a93f2655767d5d2')

pkgver() {
    cd slade

    git describe --long --tags | sed -r 's/-/+/g'
}

prepare() {
    cd slade

    patch -i "$srcdir"/0001-compatibility-with-stable-wxWidgets.patch -p 1
}

build() {
    cd slade

    export CCACHE_SLOPPINESS=pch_defines,time_macros
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
          .
    make
}

package() {
    cd slade

    make install DESTDIR="$pkgdir"
}
