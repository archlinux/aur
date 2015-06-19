# Maintainer: Sebastian Jug <sebastian.jug@gmail.com>
# Contributor: John Reese <jreese@noswap.com>
# Upstream URL: https://github.com/atom/atom
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/sjug/arch

pkgname=atom-editor
pkgver=0.210.0
pkgrel=1
pkgdesc='Chrome-based text editor from Github'
arch=('x86_64' 'i686')
url='https://github.com/atom/atom'
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
makedepends=('git' 'npm')
source=("https://github.com/atom/atom/archive/v${pkgver}.tar.gz"
        'atom-python.patch')
sha256sums=('d428e4093e8b3957206e35d03799aa95fb96a6d76e02d1f771d71a6051e561b1'
            '9a1f4e2efa7c0b2fb053d27979b0231f75f1f0d928e06413ddebeadd5d7ed46c')

_getref='17235e706b51114f51d31e788bf489bc3a6528ef'
_gitbranch='master'

prepare() {
  cd "atom-$pkgver"

  patch -Np0 -i "$srcdir/atom-python.patch"

  sed -i -e "/exception-reporting/d" \
      -e "/metrics/d" package.json

  sed -e "s/<%= description %>/$pkgdesc/" \
    -e "s|<%= executable %>|/usr/bin/atom|"\
    -e "s|<%= iconName %>|atom|"\
    resources/linux/atom.desktop.in > resources/linux/Atom.desktop
}

build() {
  cd "$srcdir/atom-$pkgver"

  export PYTHON=python2
  export JANKY_SHA1=$_gitref
  export JANKY_BRANCH=$_gitbranch
  script/build --build-dir "$srcdir/atom-build"
}

package() {
  cd "$srcdir/atom-$pkgver"

  script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"

  install -Dm644 resources/linux/Atom.desktop "$pkgdir/usr/share/applications/atom.desktop"
  install -Dm644 resources/atom.png "$pkgdir/usr/share/pixmaps/atom.png"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
