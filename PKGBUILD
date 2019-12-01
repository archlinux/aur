# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=bcalm-git
_pkgname=bcalm
pkgver=2.2.0.r49.g890ea4a
pkgrel=1
pkgdesc="constructs compacted de Bruijn graph from sequencing data"
arch=('i686' 'x86_64')
url="https://github.com/GATB/bcalm"
license=('custom')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('python')
makedepends=('cmake')
source=("git+https://github.com/GATB/bcalm.git"
        "git+https://github.com/GATB/gatb-core.git")
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.gatb-core.url "$srcdir/gatb-core"
  git submodule update
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  builddir="$srcdir/$_pkgname/build"
  mkdir -p "$builddir"
  cd "$builddir"
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=True
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 build/bcalm "$pkgdir/usr/bin/bcalm"
  install -Dm755 scripts/convertToGFA.py "$pkgdir/usr/bin/bcalm_convertToGFA"
  install -Dm755 scripts/pufferize.py "$pkgdir/usr/bin/bcalm_pufferize"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
