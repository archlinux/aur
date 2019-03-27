# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=screenlets-pack-basic
_pkgname=indiv-screenlets
pkgver=0.1.7
pkgrel=3
pkgdesc="Desktop widgets for Screenlets"
arch=('any')
url="https://launchpad.net/indiv-screenlets"
license=('GPL3')
depends=('screenlets')
optdepends=('python2-feedparser: Clear Rss Screenlet'
            'python2-numpy: Lipik Screenlet')
options=('!emptydirs')
source=(https://launchpad.net/indiv-screenlets/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.bz2{,.asc}
        fix-screenlets.patch)
validpgpkeys=('D82D1D02396B27DC5045E356A01AFB1B15E8CCA4'  # Guido Tabbernuk
              '1F78BFA38F0D87A5E007D332990F03C13116C9F7') # Hrotkó Gábor
sha256sums=('415f488c743171a0e2041245a50ee3c37500d4dfe2259ff4232164a6fd7b6051'
            'SKIP'
            '76e140406e911019c2a674b423e4a4c41143413e6992f2dcf8fee485cc623203')

prepare() {
  cd $_pkgname-$pkgver

  # Various fixes
  patch -Np1 -i ../fix-screenlets.patch

  # Remove broken screenlets
  sed -i '/Lyrics/d
          /Webframe/d
          /Stocks/d
          /MailCheck/d
          s/FreemeteoWeather/ClearWeather/' setup.py

  # Python2 fix
  find . -name \*.py -exec sed -i 's@^#.*python$@#!/usr/bin/python2@' '{}' \;
  sed -i 's@^#.*python$@#!/usr/bin/python2@' src/Lyrics/gui/{ls_widget,afv_widgets}
  sed -i 's/python -u/python2 -u/' setup.py

  # Fix desktop files
  sed -i 's/desktop_file % (podir, packname, podir, podir)/desktop_file % (podir, normal_packname, podir, podir)/' setup.py
}

package() {
  cd $_pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1

  # Remove screenlets-pack-all, because a lot of them are broken
  rm "$pkgdir"/usr/lib/python2.7/site-packages/screenlets_pack_all-$pkgver-py2.7.egg-info
  rm -r "$pkgdir"/usr/share/applications/screenlets_pack_all
  rm -r "$pkgdir"/usr/share/screenlets/screenlets-pack-all
}
