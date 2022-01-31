# Maintainer: zan <zan@420blaze.it>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sonnet-git
_name=${pkgname%-git}
pkgver=v5.90.0.671.e9fa9bc
pkgrel=1
pkgdesc='Spelling framework for Qt'
arch=(x86_64)
url='https://invent.kde.org/frameworks/sonnet'
license=(LGPL)
depends=(qt5-declarative qt5-base)
makedepends=(extra-cmake-modules git qt5-tools)
optdepends=('hunspell: spell checking via hunspell'
	    'aspell: spell checking via aspell'
	    'hspell: spell checking for Hebrew'
	    'libvoikko: spell checking for Finnish via Voikko')
groups=(kf5)
conflicts=(sonnet)
provides=(sonnet)
source=('git+https://invent.kde.org/frameworks/sonnet.git')
md5sums=('SKIP')

pkgver() {
  cd $_name
  # Tags are messed up, commiterdate is oldest first while taggerdate is accurate
  refcount=$(git rev-list HEAD --count)
  git for-each-ref refs/tags --sort=-taggerdate --format="%(refname:short)-$refcount-%(objectname:short)" --count=1 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
