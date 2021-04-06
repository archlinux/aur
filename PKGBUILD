# AUR Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>
# The purpose of this package is to have a Signal-Desktop-compatible
# version of npm for building as it doesn't work with npm >= 7.x
# Issue: https://github.com/signalapp/Signal-Desktop/issues/5118
#
# Official AL repos npm maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=npm6
_pkgname=npm
pkgver=6.14.12
pkgrel=1
pkgdesc='A package manager for javascript.'
arch=('any')
url='https://www.npmjs.com/'
license=('custom:Artistic')
depends=('nodejs' 'node-gyp' 'semver')
# libgl: TODO
# libvips: for sharp (doc build) (disabled as current version of gatsby imports a broken sharp)
# libxi: for cwebp (doc build)
makedepends=('libgl' 'libxi' 'marked0.8' 'marked-man' 'procps-ng' 'python')
conflicts=('npm')
provides=('npm=6.14.11')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/npm/cli/archive/v$pkgver.tar.gz")
sha512sums=('56b931f069684a979bdbec3d4d49c78ccf3963b3b46d45b2c235118204d66b592fc3f5d43cb38d42c886104574ade68e187e6f46f535273034079f82a53470f6')

prepare() {
  cd cli-$pkgver
  mkdir -p node_modules/.bin
  ln -sf /usr/bin/marked{,-man} node_modules/.bin/

  # Use local marked/marked-man
  sed -i 's|node bin/npm-cli.js install marked|true |' Makefile

  # Don't build twice
  sed -i 's/install: all/install:/' Makefile

  mkdir -p man/man1
}

build() {
  cd cli-$pkgver

  # SHARP_IGNORE_GLOBAL_LIBVIPS=true to avoid https://github.com/gatsbyjs/gatsby/issues/20698
  # when you have the libvips package installed
  SHARP_IGNORE_GLOBAL_LIBVIPS=true NODE_PATH=/usr/lib/node_modules make
}

package() {
  cd cli-$pkgver
  make NPMOPTS="--prefix=\"$pkgdir/usr\"" install

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Experimental dedup
  _npmdir="$pkgdir"/usr/lib/node_modules/$_pkgname
  rm -r "$_npmdir"/node_modules/{,.bin/}semver
  rm -r "$_npmdir"/node_modules/{,.bin/}node-gyp
  sed -i '/node-gyp.js/c\  exec /usr/bin/node-gyp "$@"' \
    "$_npmdir"/node_modules/npm-lifecycle/node-gyp-bin/node-gyp \
    "$_npmdir"/bin/node-gyp-bin/node-gyp

  install -dm755 "$pkgdir"/usr/share/bash-completion/completions
  node "$srcdir"/cli-$pkgver/bin/npm-cli.js completion > "$pkgdir"/usr/share/bash-completion/completions/npm

  install -Dm644 "$srcdir"/cli-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

