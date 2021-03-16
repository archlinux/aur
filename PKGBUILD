# Contributor: mar77i <mar77i at mar77i dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Mads Mogensen <mads256h at gmail dot com>

# PKGBUILD based on st-luke-git

pkgname=st-mads256h
_pkgname=st
pkgver=0.8.4
pkgrel=2
pkgdesc='Simple virtual terminal emulator for X'
url='https://st.suckless.org/'
arch=('x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext')

# include config.h and any patches you want to have applied here
source=("https://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz"
        "https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff"
        "https://st.suckless.org/patches/boxdraw/st-boxdraw_v2-0.8.3.diff"
        "https://st.suckless.org/patches/xresources/st-xresources-20200604-9ba7ecf.diff"
        "boxdraw-fix.diff"
        "config.diff")
sha256sums=('d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6'
            '9c5b4b4f23de80de78ca5ec3739dc6ce5e7f72666186cf4a9c6b614ac90fb285'
            'a24118148631f6670ea568a3debdd00a7cbcfa525839281888e876e7ea409658'
            '5be9b40d2b51761685f6503e92028a7858cc6571a8867b88612fce8a70514d5b'
            'c427ccdaf9b6eb4a298d27fd411e02728551a8dde5d1ab4d878d7321c78dbd89'
            '881743cddcf6d52abd01b17f3ed7f584e2ebd93958e880db1a6f4726db2aecba')
provides=('st')
conflicts=('st')


build() {

  # Patch boxdraw
  patch --follow-symlinks -i "${srcdir}/boxdraw-fix.diff"

  cd "$_pkgname-$pkgver"
  patch --strip=1 --input="${srcdir}/st-alpha-0.8.2.diff"
  patch --strip=1 --input="${srcdir}/st-xresources-20200604-9ba7ecf.diff"
  patch --strip=1 --input="${srcdir}/st-boxdraw_v2-0.8.3.diff"
  patch --strip=1 --input="${srcdir}/config.diff"

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
