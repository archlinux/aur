# Maintainer: Brendan Abolivier <contact@brendanabolivier.com>
# Based on the work by: Benjamin Powers <ryexander@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

# Disclaimer: This is a maintained version of the package originaly created by Benjamin
# Powers. I do not intend to steal his work, only to provide a maintained and cleaner
# version of the package.

# Previously used version, please uncomment if you're experiencing problems with NPM
#_npmver=2.5.0
# Here's the latest version of npm as supported in the Arch repository
_npmver=2.14.1

pkgname=nodejs10
pkgver=0.10.40
pkgrel=1
pkgdesc='Evented I/O for V8 javascript, frozen in version 0.10.40'
arch=('any')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl')
provides=('nodejs' 'nodejs-node-gyp' 'npm')
conflicts=('nodejs' 'npm')
makedepends=('python2' 'git' 'procps-ng' 'make' 'gcc' 'pkg-config')
checkdepends=('curl')
options=('!emptydirs')
source=("http://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz"
        git+https://github.com/npm/npm.git#tag=v$_npmver)
sha256sums=('bae79c2fd959aebe1629af36077bebbb760128db753da226d2344cd91499149f'
            'SKIP')

prepare() {
  cd node-v$pkgver

  # We need newer version of npm to fix bugs
  rm -r deps/npm
  ln -s "$srcdir/npm" deps
  rm -rf "$srcdir/npm/.git"

  msg 'Fixing for python2 name'
  find -type f -exec sed \
    -e 's_^#!/usr/bin/env python$_&2_' \
    -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
    -e 's_^#!/usr/bin/python$_&2_' \
    -e "s_'python'_'python2'_" -i {} \;
  find test/ -type f -exec sed 's_python _python2 _' -i {} \;
}

build() {
  cd node-v$pkgver

  export PYTHON=python2
  ./configure \
    --prefix=/usr \
    --shared-openssl

  make

  cd ../npm
  ../node-v$pkgver/node cli.js install ronn marked
  PATH="$srcdir/node-v$pkgver:$PATH" make
  ../node-v$pkgver/node cli.js uninstall ronn marked marked-man
}

check() {
  cd node-v$pkgver
  make test || warning "Tests failed"
}

package() {
  cd node-v$pkgver

  make DESTDIR="$pkgdir" install

  # install docs as per user request
  install -d "$pkgdir"/usr/share/doc/nodejs
  cp -r doc/api/{*.html,assets} \
    "$pkgdir"/usr/share/doc/nodejs

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE

  install -d "$pkgdir"/usr/share/man/{man1,man3,man5,man7}
  for _dir in man1 man3 man5 man7; do
    cd "$pkgdir"/usr/lib/node_modules/npm/man/$_dir
    for _file in *; do
      ln -s /usr/lib/node_modules/npm/man/$_dir/$_file "$pkgdir"/usr/share/man/$_dir/
    done
  done

  ln -s /usr/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js "$pkgdir"/usr/bin/node-gyp
}

