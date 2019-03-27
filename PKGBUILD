# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: javonera <javonera@gmail.com>

pkgname=screenlets
pkgver=0.1.7
pkgrel=2
pkgdesc="Widget framework that consists of small owner-drawn applications"
arch=('any')
url="https://launchpad.net/screenlets"
license=('GPL3')
depends=('pygtk' 'python2-dbus' 'python2-xdg')
optdepends=('screenlets-pack-basic: Desktop widgets')
source=(https://launchpad.net/screenlets/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2{,.asc}
        drop-webkit.patch
        bs4-port.patch
        remove-beautifulsoup.patch
        optional-gconf.patch
        optional-wnck.patch
        update-website.patch)
validpgpkeys=('D82D1D02396B27DC5045E356A01AFB1B15E8CCA4'  # Guido Tabbernuk
              '1F78BFA38F0D87A5E007D332990F03C13116C9F7') # Hrotkó Gábor
sha256sums=('e3c2575461051f4e39713edebc93284f35649a54ce5a068a4090f8d07a91da57'
            'SKIP'
            '2283836998e7a249f61eec408fc4b4432391c060463c41f79b579761b6dda032'
            '0e12e18c0b2caeac804b1fcfdf82c868a8270d24cda4a94f28302fa3ef03c2a9'
            '5e1e36c1a5b3c7f53c3708e5719ff267da615fe27148e91618ddb59e10054960'
            'fe7ea6b146e328c82a950d03b5f779f870bfcc0f93107864fe84537b419f00d0'
            'a26220546d4149588395fbf2687d0103ea2443280cc81b8727e614c37c0c9adb'
            '03c658426ebecff5fc0dc67c29f1c4c84a1b6a0cd714f1bad353da0f35dd8f31')

prepare() {
  cd $pkgname-$pkgver

  # Remove insecure pywebkitgtk dependency
  patch -Np1 -i ../drop-webkit.patch

  # Port to BeautifulSoup 4
  # patch -Np1 -i ../bs4-port.patch

  # Remove BeautifulSoup dependency
  patch -Np1 -i ../remove-beautifulsoup.patch

  # Make gconf dependency optional
  patch -Np1 -i ../optional-gconf.patch

  # Make wnck dependency optional
  patch -Np1 -i ../optional-wnck.patch

  # Update website links
  patch -Np1 -i ../update-website.patch

  # Update deprecated icon names
  sed -i 's/gtk-close/window-close/
          s/gtk-properties/document-properties/' src/lib/__init__.py

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' src/share/screenlets-manager/*.py
  sed -i 's/python -u/python2 -u/' src/bin/* src/lib/*.py src/share/screenlets-manager/*.py
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
