#
# Maintainer: Neonn <neonn@users.noreply.github.com>
# 
# This PKGBUILD is forked from atom-editor, which was eventually added
# into the community repo under the name 'atom'.
#
# For any improvements/suggestions/fixes, make an issue/pull request under  

pkgname=atom-notracking
pkgver=1.10.0
pkgrel=1
pkgdesc='Chrome-based text editor from GitHub, with tracking packages removed.'
arch=('x86_64' 'i686')
url='https://github.com/atom/atom'
license=('MIT')
depends=('alsa-lib' 'desktop-file-utils' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support'
            'ctags: symbol indexing support')
makedepends=('git' 'npm')
conflicts=('atom' 'atom-editor' 'atom-editor-bin' 'atom-editor-git')
source=("https://github.com/atom/atom/archive/v${pkgver}.tar.gz")
sha256sums=('5fce9b85bbd27c5e2cb71c3316c563edb0a666120e7ad0dc73817d28e1e1faec')

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
  script/build --build-dir "$srcdir/atom-build"
}

package() {
  cd "$srcdir/atom-$pkgver"

  script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"

  install -Dm644 resources/linux/Atom.desktop "$pkgdir/usr/share/applications/atom.desktop"
  install -Dm644 resources/app-icons/stable/png/1024.png "$pkgdir/usr/share/pixmaps/atom.png"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
