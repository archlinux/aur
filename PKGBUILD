# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Maintainer: Elia s. <elia.defcon7@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=pencil-git
pkgver=r1540.043ca48
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
        "pencil.desktop"
        "pencil.sh")
md5sums=('SKIP'
         '25b8e3921c596da71720cd5feb9c04b7'
         'e72976807104a384ed291f239df2d77f')

pkgver() {
  cd "$srcdir/pencil"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/pencil"
  npm install --cache "${srcdir}/npm-cache"
}

package() {
  cd "$srcdir/pencil"

  install -d -m755 "$pkgdir/usr/lib"
  cp -r app "$pkgdir/usr/lib/pencil"

  install -D -m755 "$srcdir/pencil.sh" "$pkgdir/usr/bin/pencil"
  install -D -m644 "$srcdir/pencil.desktop" "$pkgdir/usr/share/applications/pencil.desktop"
  for ICON in build/icons/* ; do
    install -D -m644 "$ICON" \
      "$pkgdir"/usr/share/icons/hicolor/`basename $ICON .png`/apps/pencil.png
  done
}

