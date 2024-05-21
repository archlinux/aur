# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=makehuman
pkgver=1.3.0
pkgrel=1
pkgdesc="Parametrical modeling program for creating human bodies"
arch=('any')
url="http://www.makehumancommunity.org/"
license=('AGPL-3.0-or-later AND CC0-1.0')
depends=('python-numpy'
         'python-pyqt5'
         'python-opengl'
         'qt5-svg'
         'hicolor-icon-theme')
optdepends=('python-pygments: IPython Qt Console plugin'
            'python-distro: distro detection for debug output')
_assets_commit='8cf9645b975a98eea056b140df11a1d278da0d10'
source=("$pkgname-$pkgver.tar.gz::https://github.com/makehumancommunity/makehuman/archive/v$pkgver.tar.gz"
        "$pkgname-assets-$_assets_commit.tar.gz::https://github.com/makehumancommunity/makehuman-assets/archive/$_assets_commit.tar.gz")
b2sums=('e2cc3d19d22ae510ea3ecd70860dce4b28dc88f0a98226e193ace056a4282b0418def345cf922439fc5b018025db578e6de56868712f04788f631151efb88f30'
        '252bacf8ca8e32848fcf9c9e8c2257070519f3c2109a6e8efee43229875e8cd93027504cfd22b9b729d4e94c04b80478851e32fb0aa22be78baf1a1d8e8ac0cd')

prepare() {
  # copy files from assets repo to makehuman data directory
  cp -r "$pkgname-assets-$_assets_commit"/base/* "$pkgname-$pkgver/$pkgname/data/"

  # make build_prepare.py happy
  cd "$pkgname-$pkgver"
  mkdir -p .git

  # enable release build and set version information
  cd buildscripts
  sed -e '/#isRelease = True/s/^#//' \
      -e 's/#version=.*$/version='"$pkgver/" \
      -e '/#gitBranch=master/s/^#//' \
      < build.conf.example > build.conf

  # fix desktop file
  sed -i -e 's/MakeHuman VERSION/MakeHuman/' \
      -e 's|Icon=/usr/share/makehuman/makehuman.svg|Icon=makehuman|' \
      deb/debian/MakeHuman.desktop
}

build() {
  cd "$pkgname-$pkgver"
  python buildscripts/build_prepare.py --nodownload . "$srcdir/build"

  # compile python bytecode
  python -m compileall -o 0 -o 1 -s "$srcdir/build" -p /opt "$srcdir/build/$pkgname"
}

package() {
  install -d "$pkgdir/opt"
  cp -r "build/$pkgname" "$pkgdir/opt/"

  # remove empty directories
  find "$pkgdir/opt/$pkgname" -empty -type d -delete

  # remove exec permission from regular files except makehuman.py
  find "$pkgdir/opt/$pkgname" -executable -type f -exec chmod a-x '{}' +
  chmod a+x "$pkgdir/opt/$pkgname/$pkgname.py"

  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  ln -s /opt/$pkgname/icons/$pkgname.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
  install -Dm 644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" "$pkgname/icons/$pkgname.svg"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/applications" "buildscripts/deb/debian/MakeHuman.desktop"

  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir"/build/LICENSE*.md
}
