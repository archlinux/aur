# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=circa-git
pkgver=20121202
pkgrel=1
pkgdesc='Programming language designed for live coding'
arch=('x86_64' 'i686')
url='http://circa-lang.org/'
license=('MIT')
makedepends=('make')
sha256sums=('b764966421087ea21211570465ce1a6cfa10423e4f679bade558a362a12879e8'
            'f0dbcc5d80bf03d706aa8b28a322aa7f169a40813848c2d1505691f6e2c7ef00')
_gitroot='git://github.com/paulhodge/circa.git'
_gitname='circa'

build() {
  cd "$srcdir"

  msg "Connecting to the $_gitname git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf "$srcdir/$_gitname-build"
  git clone "$_gitname" "$_gitname-build"

  cd "$_gitname-build"

  sed -i 's/-lcirca/-ldl -lcirca/g' src/unit_tests.make src/command_line.make
  LDFLAGS='-ldl' make config=release PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 "build/$_gitname" "$pkgdir/usr/bin/$_gitname"
  mkdir -p "$pkgdir//usr/share/doc/$_gitname/"
  cp -r docs/* "$pkgdir/usr/share/doc/$_gitname/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}

# vim:set ts=2 sw=2 et:
