# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=libbobcat
pkgver=4.01.01
pkgrel=1
pkgdesc="Bobcat (Brokken's Own Base Classes And Templates) library"
arch=('i686' 'x86_64')
url="https://fbb-git.github.io/bobcat/"
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('openssl' 'libx11>=1.6.2')
makedepends=('icmake>=7.22.01' 'openssl' 'readline' 'libmilter>=8.14.4' 
             'libx11>=1.6.2' 'yodl>=3.05.00' 'python')
optdepends=()
source=("https://github.com/fbb-git/bobcat/archive/${pkgver}.tar.gz")
md5sums=('ad6d9aa566f2edd75307d82e7d5cdbf7')

build() {
  cd "$srcdir/bobcat-${pkgver}/bobcat"
  CXXFLAGS="$CXXFLAGS --std=c++11 -pthread"
  LDFLAGS="$LDFLAGS -pthread"
  ./build libraries all
  ./build man
}

package() {
  cd "$srcdir/bobcat-${pkgver}/bobcat"

  # There seems to be a bug in the install function that causes the package
  # directory to be used as a relative path from the current directory for
  # gzip commands. I have found no other way to work around this issue than to
  # make the package directory relative; the easiest way to do that is using
  # Python (which is I think a reasonable dependency).
  relpkgdir=$(python -c "import os.path; print(os.path.relpath('$pkgdir', '.'))")
  ./build install "$relpkgdir" "$relpkgdir"
  # Normal version:
  #./build install "$pkgdir" "$pkgdir"
}

