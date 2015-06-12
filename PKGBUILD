# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Contributor: John Reese <john@noswap.com>
# Upstream URL: https://github.com/atom/atom

# Please do mind that it will automagically update
# to latest tagged release, there’s no need to manually change pkgver.
# Please don’t flag out-of-date!
pkgname=atom-editor-git
pkgver=0.198.0.r32.gf1f8c3d
pkgrel=1
pkgdesc="Chrome-based text editor from Github"
arch=('i686' 'x86_64')
url="https://github.com/atom/atom"
license=('MIT')
provides=('atom-editor')
conflicts=('atom-editor')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
makedepends=('git' 'npm')
source=("atom::git+git://github.com/atom/atom"
    "atom-python.patch")
md5sums=('SKIP'
         'd4e6137fbdea39d0abe2016d4640b0cf')

pkgver() {
  cd "$srcdir/atom"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "$srcdir/atom"

  patch -Np0 -i "$srcdir/atom-python.patch"

  sed -e "s/<%= description %>/$pkgdesc/" \
    -e "s|<%= executable %>|/usr/bin/atom|"\
    -e "s|<%= iconName %>|atom|"\
    resources/linux/atom.desktop.in > resources/linux/Atom.desktop
}

build() {
  cd "$srcdir/atom"

  export PYTHON=python2
  script/build --build-dir "$srcdir/atom-build"
}

package() {
  cd "$srcdir/atom"

  script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"
  install -Dm644 resources/linux/Atom.desktop "$pkgdir/usr/share/applications/atom.desktop"
  install -Dm644 resources/atom.png "$pkgdir/usr/share/pixmaps/atom.png"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
