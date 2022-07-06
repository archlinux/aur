# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_assets_commit='1f2f63338613bcbefa2c1edbc1da91128e9e0451'
_assets_repo='https://github.com/makehumancommunity/makehuman-assets.git'

pkgname=makehuman
pkgver=1.2.0
pkgrel=4
pkgdesc="Parametrical modeling program for creating human bodies"
arch=('any')
url="http://www.makehumancommunity.org/"
license=('AGPL3' 'custom:CC0')
depends=('python-numpy'
         'python-pyqt5'
         'python-opengl'
         'qt5-svg'
         'hicolor-icon-theme')
makedepends=('git' 'git-lfs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makehumancommunity/makehuman/archive/refs/tags/v$pkgver.tar.gz"
        "git+${_assets_repo}#commit=$_assets_commit"
        "$pkgname-188.patch::https://github.com/makehumancommunity/makehuman/pull/188.patch"
        "$pkgname-197.patch::https://github.com/makehumancommunity/makehuman/pull/197.patch"
        "$pkgname-multisampling.patch::https://github.com/makehumancommunity/makehuman/commit/c47b884028a24eb190d097e7523a3059e439cb6f.patch"
        "$pkgname-fix_77-2.patch::https://github.com/makehumancommunity/makehuman/commit/02c4269a2d4c57f68159fe8f437a8b1978b99099.patch")
sha512sums=('e15acf536c99f2258abd317e3ff88e908d7447bea07be2c9b2319bd4b1847e76ad3035479e1d71ec5b086aa2442e7530436a6844a11e4c9bfd74abc26c3bd9f5'
            'SKIP'
            '989810a56138db858bedce341b099986a5fb5f64a7ce1d275d71c0409c8027d868c5b5a165ee119ead25bfdcf556492ca5856abe274d3428723b5312582b1f0c'
            'c1be08b522c372c04836f37afd8e0245efada6dda3a20e8c2c5ebd75f196cc911270adb21dcf40b4eba754ba0c28045121eb7fe71fcf5cf0fdff4b72e3a8250d'
            '4b1c6c1e00cd95c38323699299b66829f9809bbf658359f08ec37f05dbf5da84d77502237665fad83dc2ad7fa73ec1ea20af1dedc99d155b8e40195192a1da0c'
            '5df80df28d734e4c81855112b42746dbc4586fa734c2a8432bfecb62864073b96baf6c588dbf65ada43990c47a135c6ae19a09dd909f233c8ea56f35a6c10091')

prepare() {
  cd "$pkgname-assets"
  # Download git-lfs files
  git remote | grep -q github || git remote add github "$_assets_repo"
  git lfs install --local
  git lfs pull github

  # copy files from assets repo to makehuman data directory
  cp -r base/* "$srcdir/$pkgname-$pkgver/$pkgname/data/"

  # make build_prepare.py happy
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p .git

  # fix crash during startup
  patch -Np1 -i "$srcdir/$pkgname-188.patch"

  # fix upstream issue #77
  patch -Np1 -i "$srcdir/$pkgname-fix_77-2.patch"

  # fix blank window
  patch -Np1 -i "$srcdir/$pkgname-197.patch"

  # fix issue with multisampling
  patch -Np1 -i "$srcdir/$pkgname-multisampling.patch"

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
  # if build directory exists, remove it first
  [ -d "$srcdir/build" ] && rm -r "$srcdir/build"
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
