# Maintainer:  Alexander Rødseth <rodseth@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=0.4.9
pkgrel=1
pkgdesc='Lightweight web browser based on Gtk WebKit'
arch=('x86_64' 'i686')
url='http://www.twotoasts.de/index.php?/pages/midori_summary.html'
license=('LGPL2.1')
install=midori.install
depends=('libzeitgeist' 'libwebkit' 'libnotify' 'libxss' 'libunique' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('libxml2' 'intltool' 'gtk-doc' 'librsvg' 'python2' 'vala' 'gcr')
optdepends=('gstreamer0.10-ugly-plugins: HTML5 videos support'
            'aria2: download utility')
options=('!emptydirs')
source=("http://archive.xfce.org/src/apps/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2"
        'fix-copying.patch')
sha256sums=('f01e5dc45e94f909e48f0dd62cc4afedd80710769fdf98bc4e0b38d4ef0abc11'
            'd4395ac994d8d614f93ae4863bbf6289b1980e0ed84aef52ca95a678b464b959')

build() {
  cd $srcdir/$pkgname-$pkgver

  # FS#32229
  patch -s -Np1 -i ../fix-copying.patch > /dev/null || true

  # Python 2 
  export PYTHON=/usr/bin/python2
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" wscript waf
  
  ./configure --prefix=/usr \
              --jobs=${MAKEFLAGS/-j/} \
              --enable-addons \
              --enable-unique \
              --enable-nls \
              --enable-docs \
              --enable-apidocs
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
