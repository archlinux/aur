# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=raze
pkgver=0.4.4
pkgrel=1
pkgdesc='Build engine port backed by GZDoom tech'
arch=('x86_64')
url='https://github.com/coelckers/Raze'
license=('custom:BUILD' 'GPL2')
depends=('hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'libvpx'
         'sdl2'
         'zmusic')
makedepends=('cmake'
             'desktop-file-utils'
             'git')
optdepends=('gtk3: IWAD selection dialog'
            'gxmessage: crash dialog (GNOME)'
            'kdialog: crash dialog (KDE)'
            'openal: in-game sound'
            'xorg-xmessage: crash dialog (other)')
source=("Raze::git+https://github.com/coelckers/Raze#tag=${pkgver}"
        '0001-Fix-file-paths.patch'
        'raze.desktop')
sha256sums=('SKIP'
            '35c2a1c652f84a56c6ee5a35ec30f9b2028307ee8e14ed053810a344beafc784'
            'ffc02d8f6f0d4464a74e025d41063f2441d9423d4ed605a0290eb266ae9531c8')

prepare() {
    cd Raze
    patch -i "$srcdir"/0001-Fix-file-paths.patch -p 1
}

build() {
    cd Raze
    mkdir -p build
    local _cflags="-ffile-prefix-map=\"$PWD\"=."
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_C_FLAGS="${CFLAGS} ${_cflags}" \
          -D CMAKE_CXX_FLAGS="${CXXFLAGS} ${_cflags}" \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D ZMUSIC_LIBRARIES=/usr/lib/libzmusic.so \
          -D INSTALL_PK3_PATH=lib/raze
    make -C build
}

package() {
    cd Raze
    make -C build install DESTDIR="$pkgdir"
    desktop-file-install "$srcdir"/raze.desktop --dir="$pkgdir"/usr/share/applications
    install source/platform/posix/game.xpm "$pkgdir"/usr/share/icons/hicolor/256x256/apps/raze.xpm -D -m 644
    install package/common/buildlic.txt "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt -D -m 644
}
