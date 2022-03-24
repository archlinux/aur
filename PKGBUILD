# Maintainer: Kevin Brodsky <corax26 at gmail dot com>
# Contributor: Anton Jongsma <anton@felrood.nl>
pkgname=libbobcat
pkgver=5.09.01
pkgrel=1
pkgdesc="Bobcat (Brokken's Own Base Classes And Templates) library"
arch=('i686' 'x86_64')
url="https://fbb-git.gitlab.io/bobcat/"
license=('GPL')
# Versions taken from the 'required' file in sources
depends=('openssl' 'libx11>=1.6.2')
makedepends=('icmake>=8.01.00' 'openssl' 'readline' 'libmilter>=8.14.4' 
             'libx11>=1.6.2' 'yodl>=3.07.01')
optdepends=()
source=("https://gitlab.com/fbb-git/bobcat/-/archive/${pkgver}/bobcat-${pkgver}.tar.gz")
md5sums=('096bc83cb572f24f64bfae25fd4febd8')

build() {
  cd "$srcdir/bobcat-${pkgver}/bobcat"

  # Since makepkg always defines CXXFLAGS, it overrides the default value
  # defined in the build system, which is problematic because it needs a
  # specific C++ version. Add it back here.
  CXXFLAGS="$CXXFLAGS -std=c++20"
  # Add the -P option not to use precompiled headers, which can be useful since
  # they require a lot of free space, compared to a normal compilation:
  # ./build -P libraries all
  ./build libraries all
  ./build man
}

package() {
  cd "$srcdir/bobcat-${pkgver}/bobcat"

  # Since 4.01.02, first argument to install is <what to install> (x = all),
  # and second is the base directory (absolute path, unlike 4.01.00)
  ./build install x "$pkgdir"
}

