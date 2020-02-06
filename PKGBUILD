# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=raze
pkgver=0.4.0
pkgrel=1
pkgdesc='Build engine port backed by GZDoom tech'
arch=('i686' 'x86_64')
url='https://github.com/coelckers/Raze'
license=('custom:BUILD' 'custom:dumb' 'GPL2')
depends=('alsa-lib'
         'fluidsynth>=2'
         'gtk3'
         'hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'libsndfile'
         'libvpx'
         'mpg123'
         'openal'
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'git')
optdepends=('gxmessage: crash dialog (GNOME)'
            'kdialog: crash dialog (KDE)'
            'soundfont-fluid: FluidR3 soundfont for FluidSynth'
            'xorg-xmessage: crash dialog (other)')
provides=('raze')
conflicts=('raze')
_srcver=$pkgver
source=("Raze::git+https://github.com/coelckers/Raze#commit=${_srcver}"
        '0001-Fix-file-paths.patch'
        'raze.desktop')
sha256sums=('SKIP'
            'cebea1d7bb84a60c4a3b0961ee5f827f5acf18a015ebc42c2bada31cab273221'
            'ffc02d8f6f0d4464a74e025d41063f2441d9423d4ed605a0290eb266ae9531c8')

pkgver() {
    cd Raze

    git describe --tags | tr - +
}

prepare() {
    cd Raze

    patch -p1 -i"$srcdir"/0001-Fix-file-paths.patch
}

build() {
    cd Raze

    local _cflags="-ffile-prefix-map=\"$PWD\"=."
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_C_FLAGS="${CFLAGS} ${_cflags}" \
          -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${_cflags}" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DINSTALL_PK3_PATH=lib/raze \
          .
    make
}

package() {
    cd Raze

    make install DESTDIR="$pkgdir"

    desktop-file-install --dir="$pkgdir"/usr/share/applications "$srcdir"/raze.desktop
    install -D -m644 source/platform/posix/game.xpm "$pkgdir"/usr/share/icons/hicolor/256x256/apps/raze.xpm
    install -D -m644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt
    install -D -m644 libraries/dumb/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/dumb.txt
}
