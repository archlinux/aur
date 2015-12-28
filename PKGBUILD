# Maintainer : Faerbit <faerbit at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=oclint-git
_pkgname=oclint
pkgver=0.10.2.r782.0b68641
_pkgver=0.10.2
pkgrel=1
pkgdesc="Static code analysis tool for improving quality and reducing defects"
arch=('i686' 'x86_64')
url="http://oclint.org/"
license=('BSD')
dependencies=('python2' 'zlib' 'ncurses')
makedepends=('cmake' 'git' 'llvm' 'python' 'clang')
provides=('oclint')
conflicts=('oclint')
source=("git+http://github.com/oclint/oclint.git"
        "git+http://github.com/oclint/oclint-json-compilation-database.git")
md5sums=("SKIP"
         "SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/oclint-scripts"
  ./build -llvm-root=/usr -use-system-compiler -release
}

package() {
	cd "$srcdir/$_pkgname"

  # Copy llvm LICENSE.txt
  mkdir -p llvm
  cp /usr/include/llvm/Support/LICENSE.TXT llvm

  # Run bundle scripts
  cd oclint-scripts
  ./bundle -llvm-root=/usr -release
  cd ..
  # Fix python path
  sed -i '1 s/^.*$/#!\/usr\/bin\/env python2/' "$srcdir/oclint-json-compilation-database/oclint-json-compilation-database"

  mkdir -p $pkgdir/usr/bin
  cp ./build/oclint-release/bin/oclint-$_pkgver $pkgdir/usr/bin/oclint
  cp "$srcdir/oclint-json-compilation-database/oclint-json-compilation-database" "$pkgdir/usr/bin/oclint-json-compilation-database"

  mkdir -p $pkgdir/usr/lib/oclint
  cp -r ./build/oclint-release/lib/oclint/* $pkgdir/usr/lib/oclint/
}
