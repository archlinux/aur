# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=raze-git
pkgver=1.4pre+1256+g3c54495c5
pkgrel=2
pkgdesc='Build engine port backed by GZDoom tech (git version)'
arch=('x86_64')
url='https://github.com/coelckers/Raze'
license=('custom:BUILD' 'GPL2')
depends=('gtk3'
         'hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'libvpx'
         'openal'
         'sdl2'
         'zmusic>=1.1.8')
makedepends=('cmake'
             'desktop-file-utils'
             'git')
optdepends=('gxmessage: crash dialog (GNOME)'
            'kdialog: crash dialog (KDE)'
            'xorg-xmessage: crash dialog (other)')
provides=('raze')
conflicts=('raze')
source=("Raze::git+https://github.com/coelckers/Raze"
        '0001-Fix-file-paths.patch'
        'raze.desktop')
sha256sums=('SKIP'
            'd8960cba3a0596a6e52072b9bd8f38e92d51be0315fcb53f3cb9c72da4e87081'
            'ffc02d8f6f0d4464a74e025d41063f2441d9423d4ed605a0290eb266ae9531c8')

pkgver() {
    cd Raze
    git describe --tags | tr - +
}

prepare() {
    cd Raze
    patch -i "$srcdir"/0001-Fix-file-paths.patch -p 1
}

build() {
    cd Raze
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=\"$PWD\"=." \
          -D DYN_GTK=OFF \
          -D DYN_OPENAL=OFF
    make -C build
}

package() {
    cd Raze
    install build/raze -t "$pkgdir"/usr/bin -D
    install build/raze.pk3 -t "$pkgdir"/usr/lib/raze -D -m 644
    desktop-file-install "$srcdir"/raze.desktop --dir="$pkgdir"/usr/share/applications
    install source/platform/posix/game.xpm "$pkgdir"/usr/share/icons/hicolor/256x256/apps/raze.xpm -D -m 644
    install package/common/buildlic.txt -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
    install build/soundfonts/raze.sf2 -t "$pkgdir"/usr/share/raze/soundfonts -D -m 644
}
