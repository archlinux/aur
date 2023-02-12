# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=makehuman
pkgver=1.2.0
pkgrel=7
pkgdesc="Parametrical modeling program for creating human bodies"
arch=('any')
url="http://www.makehumancommunity.org/"
license=('AGPL3' 'custom:CC0')
depends=('python-numpy'
         'python-pyqt5'
         'python-opengl'
         'qt5-svg'
         'hicolor-icon-theme')
optdepends=('python-pygments: IPython Qt Console plugin'
            'python-distro: distro detection for debug output')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makehumancommunity/makehuman/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname-assets-$pkgver.tar.gz::https://github.com/makehumancommunity/makehuman-assets/archive/v$pkgver.tar.gz"
        "$pkgname-188.patch::https://github.com/makehumancommunity/makehuman/pull/188.patch"
        "$pkgname-197.patch::https://github.com/makehumancommunity/makehuman/pull/197.patch"
        "$pkgname-220.patch::https://github.com/makehumancommunity/makehuman/pull/220.patch"
        "$pkgname-multisampling.patch::https://github.com/makehumancommunity/makehuman/commit/c47b884028a24eb190d097e7523a3059e439cb6f.patch"
        "$pkgname-fix_77-2.patch::https://github.com/makehumancommunity/makehuman/commit/02c4269a2d4c57f68159fe8f437a8b1978b99099.patch")
sha512sums=('e15acf536c99f2258abd317e3ff88e908d7447bea07be2c9b2319bd4b1847e76ad3035479e1d71ec5b086aa2442e7530436a6844a11e4c9bfd74abc26c3bd9f5'
            '79fc694b68dcfb8e17d7162b9225e9ddc23d5c011eff39f5a6268c3b3b72c26414ed0441194e3e25312a9f2b30e08dedaef16753b64d0300c5cf43830411caea'
            '989810a56138db858bedce341b099986a5fb5f64a7ce1d275d71c0409c8027d868c5b5a165ee119ead25bfdcf556492ca5856abe274d3428723b5312582b1f0c'
            'c1be08b522c372c04836f37afd8e0245efada6dda3a20e8c2c5ebd75f196cc911270adb21dcf40b4eba754ba0c28045121eb7fe71fcf5cf0fdff4b72e3a8250d'
            '5cbe7f6e6b56e283c03ed80740be014e7de761b2f1891a981292e40928f54eadd1fefad866c0e3360a6262ed69d29a694b5ff3ae854cb57631797113788fc6c3'
            '4b1c6c1e00cd95c38323699299b66829f9809bbf658359f08ec37f05dbf5da84d77502237665fad83dc2ad7fa73ec1ea20af1dedc99d155b8e40195192a1da0c'
            '5df80df28d734e4c81855112b42746dbc4586fa734c2a8432bfecb62864073b96baf6c588dbf65ada43990c47a135c6ae19a09dd909f233c8ea56f35a6c10091')

prepare() {
  # copy files from assets repo to makehuman data directory
  cp -r "$pkgname-assets-$pkgver"/base/* "$pkgname-$pkgver/$pkgname/data/"

  # make build_prepare.py happy
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p .git

  # fix crash during startup
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/$pkgname-188.patch"

  # fix upstream issue #77
  patch -Np1 -i "$srcdir/$pkgname-fix_77-2.patch"

  # fix blank window
  patch -Np1 -i "$srcdir/$pkgname-197.patch"

  # fix issue with multisampling
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/$pkgname-multisampling.patch"

  # fix build with python-numpy >= 1.24.0
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/$pkgname-220.patch"

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
  mv "$srcdir/build/$pkgname" "$pkgdir/opt/"

  # remove empty directories
  find "$pkgdir/opt/$pkgname" -empty -type d -delete

  # remove exec permission from regular files except makehuman.py
  find "$pkgdir/opt/$pkgname" -executable -type f -exec chmod a-x '{}' +
  chmod a+x "$pkgdir/opt/$pkgname/$pkgname.py"

  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  ln -s /opt/$pkgname/icons/$pkgname.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
  install -Dm 644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" "$pkgname/icons/$pkgname.svg"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/applications" "buildscripts/deb/debian/MakeHuman.desktop"

  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir"/build/LICENSE*.md
}
