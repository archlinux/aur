# Maintainer: Sebastian Jug <seb@stianj.ug>
# Contributor: Samuel Henrique <samueloph@gmail.com>
# Upstream URL: https://github.com/atom/atom
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/sjug/atom-editor

pkgname=atom-editor
pkgver=1.11.2
pkgrel=1
pkgdesc='Chrome-based text editor from Github'
arch=('x86_64' 'i686')
url='https://github.com/atom/atom'
license=('MIT')
depends=('alsa-lib' 'desktop-file-utils' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support'
            'ctags: symbol indexing support')
makedepends=('git' 'npm')
conflicts=('atom' 'atom-editor-bin' 'atom-editor-git')
source=("https://github.com/atom/atom/archive/v${pkgver}.tar.gz")
sha256sums=('b7c09d03d950b0a6aca82225f072d9005d5681887e3a7c466b0504bf64d7c5cd')

prepare() {
  cd "atom-$pkgver"

  sed -i -e "/exception-reporting/d" \
      -e "/metrics/d" package.json

  sed -e "s/<%= description %>/$pkgdesc/" \
    -e "s|<%= appName %>|Atom|"\
    -e "s|<%= installDir %>/share/<%= appFileName %>|/usr/bin|"\
    -e "s|<%= iconPath %>|atom|"\
    resources/linux/atom.desktop.in > resources/linux/Atom.desktop
}

build() {
  cd "$srcdir/atom-$pkgver"

  export PYTHON=python2
  script/build
}

package() {
  cd "$srcdir/atom-$pkgver"

  # supporting files
  install -Dm755 atom.sh "$pkgdir/usr/bin/atom"
  install -Dm644 resources/linux/Atom.desktop "$pkgdir/usr/share/applications/atom.desktop"
  install -Dm644 resources/app-icons/stable/png/1024.png "$pkgdir/usr/share/pixmaps/atom.png"

  # navigate to build directory
  _arch=''
  if [ "$CARCH" = 'x86_64' ]; then
    _arch='amd64'
  else
    _arch='i386'
  fi

  cd "$srcdir/atom-$pkgver/out/atom-$pkgver-$_arch"

  # core files
  install -d "$pkgdir/usr/share/atom"
  cp -R * "$pkgdir/usr/share/atom/"

  # apm
  ln -s ../share/atom/resources/app/apm/node_modules/.bin/apm "$pkgdir/usr/bin/apm"

  # license
  rm "$pkgdir/usr/share/atom/LICENSE"
  rm "$pkgdir/usr/share/atom/LICENSES.chromium.html"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
