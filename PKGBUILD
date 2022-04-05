# Maintainer: Glen Ogilvie <nelg at linuxsolutions dot co dot nz>
# Contributor: Michael Straube <straubem at gmx dot de>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Vitaly Bogdanov <vsbogd at gmail dot com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>

pkgname=bubbros
pkgver=1.6.2
pkgrel=4
pkgdesc="Bubble Bobble clone for up to 10 players"
arch=('i686' 'x86_64')
license=('MIT' 'custom:Artistic')
url="http://bub-n-bros.sourceforge.net"
depends=('python2' 'libxext')
makedepends=('gendesk' 'imagemagick')
optdepends=('python2-pygame: alternative frontend for client'
            'pygtk: alternative frontend for client'
            'java-environment: alternative frontend for client')
options=('!makeflags')
install=bubbros.install
source=("https://downloads.sourceforge.net/bub-n-bros/bubbros-$pkgver.tar.gz"
        "bubbros-config-in-home.patch"
        "bubbros-use-python2.patch")
sha256sums=('0ad8a359c4632071a9c85c2684bae32aa0fa278632c49f092dc4078cfb9858c4'
            '6331c308c0db4fed129e765a26cb1f0da9219e7d5626ed8144d28f2456a011e8'
            '5f958f3b09069af5f5ce75b15793d87c53f606b3ea99ded71542d2274546dc82')

prepare() {
  # save to home dir
  patch -Np0 -i bubbros-config-in-home.patch
  # use python2
  patch -Np0 -i bubbros-use-python2.patch
  # generate desktop file
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc" \
    --name=Bub-n-Bros --categories=Game
}

build() {
  cd bubbros-$pkgver
  # build extensions and man pages
  make all docs
  # generate images with different colors from palette
  python2 bubbob/images/buildcolors.py
  # generate bonuses documentation
  cd bubbob/doc && python2 bonus-doc.py
}

package() {
  cd bubbros-$pkgver
  # data and libs
  install -d "$pkgdir"/usr/{bin,lib/bubbros,share/man/man1}
  install -Dm755 BubBob.py "$pkgdir"/usr/share/bubbros/BubBob.py
  cp -r bubbob common display java http2 metaserver "$pkgdir"/usr/share/bubbros
  mv "$pkgdir"/usr/share/bubbros/{display/xshm.so,bubbob/statesaver.so} "$pkgdir"/usr/lib/bubbros
  chmod 755 "$pkgdir"/usr/share/bubbros/display/Client.py
  # symlinks
  ln -s /usr/share/bubbros/BubBob.py "$pkgdir"/usr/bin/bubbros
  ln -s /usr/share/bubbros/display/Client.py "$pkgdir"/usr/bin/bubnbros-client
  ln -s /usr/share/bubbros/bubbob/bb.py "$pkgdir"/usr/bin/bubnbros-server
  ln -s /usr/lib/bubbros/xshm.so "$pkgdir"/usr/share/bubbros/display/xshm.so
  ln -s /usr/lib/bubbros/statesaver.so "$pkgdir"/usr/share/bubbros/bubbob/statesaver.so
  # manual, license, desktop entry
  install -m644 doc/*.gz "$pkgdir"/usr/share/man/man1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/bubbros/LICENSE
  install -Dm644 artistic.txt "$pkgdir"/usr/share/licenses/bubbros/artistic.txt
  install -Dm644 ../bubbros.desktop "$pkgdir"/usr/share/applications/bubbros.desktop
  install -Dm644 http2/data/bob.png "$pkgdir"/usr/share/pixmaps/bubbros.png
  # remove not needed stuff
  cd "$pkgdir"/usr/share/bubbros
  find . \( -type d -and \( -name build -or -name CVS \) \) -exec rm -r {} \+
  find . \( -type f -and \( -name .cvsignore -or -name Makefile -or -name "*.c" \) \) -delete
  rm -r "$pkgdir"/usr/share/bubbros/display/{windows,dpy_windows.py,snd_windows.py,setup.py}
  rm "$pkgdir"/usr/share/bubbros/bubbob/{images/buildcolors.py,doc/bonus-doc.py,setup.py}
}
