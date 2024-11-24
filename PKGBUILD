# Maintainer: envolution
# Contributor: Jerry Jia <jerryjiahaha@gmail.com>
# Contributor: <clu@eeviac>
# Contributor: <janak@astronomie.cz>

pkgname=(montage-git python-montagepy-git)
basename=montage-git
_pyname="MontagePy"
pkgver=6.1+r414+ga8bde0bef
pkgrel=1
pkgdesc="An astronomical image mosaic engine"
arch=('i686' 'x86_64')
url="http://montage.ipac.caltech.edu/"
license=('BSD-3-Clause')
depends=('freetype2' 'wcslib')
makedepends=(git gcc grep sed)
makedepends+=(python-build python-installer python-wheel)
source=("${basename}::git+https://github.com/Caltech-IPAC/Montage.git")
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd $pkgname
  grep -q '^#include <string.h>$' grid/Pegasus/mPresentation.c ||
    sed -i '17i #include <string.h>' grid/Pegasus/mPresentation.c &&
    msg2 "applying string include fix as per https://github.com/Caltech-IPAC/Montage/issues/79"
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make

  #parse.py script has some really poor hardcoding
  cd "python/${_pyname}"
  rm -rf src/$_pyname #for rebuilds
  mkdir -p src/$_pyname
  python parse.py
  cp src/$_pyname/* .
  mkdir -p src/$_pyname/archive
  python -m build --wheel --no-isolation
}

package_montage-git() {
  provides=(montage)
  conflicts=(montage)
  cd $pkgname

  mkdir -p $pkgdir/usr/bin
  install -Dm755 bin/* $pkgdir/usr/bin
  # this file is provided by wcslib which is a dependancy
  mv $pkgdir/usr/bin/HPXcvt $pkgdir/usr/bin/mHPXcvt || msg2 "skipping HPXcvt rename"

  #custom license...
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  msg2 "Find docs at: http://montage.ipac.caltech.edu/docs/"
}

package_python-montagepy-git() {
  conflicts=(python-montagepy)
  provides=(python-montagepy)
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 ${basename}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd "${basename}/python/${_pyname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  msg2 "Find docs at: http://montage.ipac.caltech.edu/docs/"
}
