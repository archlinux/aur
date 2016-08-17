# $Id$
# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=npm2
pkgver=2.15.10
pkgrel=1
pkgdesc='A package manager for javascript'
arch=('any')
url='https://www.npmjs.com/'
license=('custom:Artistic')
depends=('nodejs')
provides=('nodejs-node-gyp' "npm=${pkgver}" 'semver')
conflicts=('npm' 'semver')
makedepends=('git' 'procps-ng')
optdepends=('python2: for node-gyp')
options=('!emptydirs')
source=("git+https://github.com/npm/npm.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd npm
  make
}

package() {
  cd npm
  make NPMOPTS="--prefix=\"$pkgdir/usr\"" install

  # Why 777? :/
  chmod -R u=rwX,go=rX "$pkgdir"

  # Fix files owned by nobody:
  chown -R root "$pkgdir/usr/lib/node_modules"

  # Fix wrong symlinks
  for _dir in man1 man3 man5 man7; do
    rm -f "$pkgdir"/usr/share/man/$_dir/*
    cd "$pkgdir"/usr/lib/node_modules/npm/man/$_dir
    for _file in *; do
      ln -s /usr/lib/node_modules/npm/man/$_dir/$_file "$pkgdir"/usr/share/man/$_dir/
    done
  done

  # Make symlink for node-gyp
  ln -s /usr/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js "$pkgdir"/usr/bin/node-gyp

  install -Dm644 "$srcdir/npm/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
