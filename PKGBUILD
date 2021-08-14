# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Maintainer: Elia s. <elia.defcon7@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=pencil-git
pkgver=3.0.3.r167.g043ca48
pkgrel=1
pkgdesc="An open-source GUI prototyping tool"
arch=('i686' 'x86_64')
url="http://pencil.evolus.vn/"
license=('GPL2')
depends=('electron')
makedepends=('git' 'npm')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
replaces=('evolus-pencil-git' 'evolus-pencil-svn' 'evolus-pencil-devel-git' 'evolus-pencil-git-dev-branch')
source=("pencil::git+https://github.com/evolus/pencil.git#branch=development"
        'pencil.desktop'
        'pencil.sh')
md5sums=('SKIP'
         '25b8e3921c596da71720cd5feb9c04b7'
         'e72976807104a384ed291f239df2d77f')

pkgver() {
  cd "pencil"
  git describe --long --tags --abbrev=7 --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pencil"
  npm install --cache "$srcdir/npm-cache"
}

package() {
  cd "pencil"

  install -d -m755 "$pkgdir/usr/lib"
  cp -r app "$pkgdir/usr/lib/pencil"

  install -D -m755 "$srcdir/pencil.sh" "$pkgdir/usr/bin/pencil"
  install -D -m644 "$srcdir/pencil.desktop" "$pkgdir/usr/share/applications/pencil.desktop"
  for ICON in build/icons/* ; do
    install -D -m644 "$ICON" \
      "$pkgdir"/usr/share/icons/hicolor/`basename $ICON .png`/apps/pencil.png
  done
}

