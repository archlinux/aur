# Maintainer: Caepom <caepom at gmail dot com>
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=raze
pkgver=1.10.2
pkgrel=2
pkgdesc='Build engine port backed by GZDoom tech'
arch=('x86_64')
url='https://github.com/ZDoom/Raze'
license=('custom:BUILD' 'GPL2')
options=(!lto)
depends=('gtk3'
         'hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'libvpx'
         'libwebp'
         'openal'
         'sdl2'
         'zmusic>=1.1.8')
makedepends=('cmake'
             'desktop-file-utils'
             'git')
optdepends=('gxmessage: crash dialog (GNOME)'
            'kdialog: crash dialog (KDE)'
            'xorg-xmessage: crash dialog (other)')
source=("Raze::git+https://github.com/coelckers/Raze#tag=${pkgver}"
	"0001-Fix-compile-gcc-14.patch"
        'raze.desktop')
sha256sums=('SKIP'
	    'ed1953867e554d9fec497e89d8e877d6e45135955a81a76ce5c63b7343ee095a'
            'ffc02d8f6f0d4464a74e025d41063f2441d9423d4ed605a0290eb266ae9531c8')

prepare() {
     cd Raze
     patch -i "$srcdir"/0001-Fix-compile-gcc-14.patch -p 1
}

build() {
    cd Raze
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=\"$PWD\"=." \
          -D DYN_GTK=OFF \
          -D DYN_OPENAL=OFF \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D SYSTEMINSTALL=ON
    make -C build
}

package() {
    cd Raze
    install build/raze -t "$pkgdir"/usr/bin -D
    install build/raze.pk3 -t "$pkgdir"/usr/share/raze -D -m 644
    desktop-file-install "$srcdir"/raze.desktop --dir="$pkgdir"/usr/share/applications
    install source/platform/posix/game.xpm "$pkgdir"/usr/share/icons/hicolor/256x256/apps/raze.xpm -D -m 644
    install package/common/buildlic.txt -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
    install build/soundfonts/raze.sf2 -t "$pkgdir"/usr/share/raze/soundfonts -D -m 644
}
