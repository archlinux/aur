pkgname=npm4
pkgver=4.6.1
pkgrel=1
pkgdesc='A package manager for javascript'
arch=('any')
url='https://www.npmjs.com/'
license=('custom:Artistic')
depends=('nodejs' 'semver')
provides=('nodejs-node-gyp' 'npm')
conflicts=('npm')
makedepends=('procps-ng' 'marked-man')
optdepends=('python2: for node-gyp')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/npm/npm/archive/v$pkgver.tar.gz")
sha512sums=('1e10d3ad89de1aecfce34c670a7008b6f2864f3dedc7e43679d67ac1c878d7678317977396149b50adeb6a7948aff062c8bea4be93d3854603f5ff51638d95c9')

prepare() {
  cd npm-$pkgver
  ln -s /usr/bin/marked{,-man} node_modules/.bin/
}

build() {
  cd npm-$pkgver
  make
}

package() {
  cd npm-$pkgver
  make NPMOPTS="--prefix=\"$pkgdir/usr\"" install

  # Why 777? :/
  chmod -R u=rwX,go=rX "$pkgdir"

  # Fix files owned by nobody:
  chown -R root "$pkgdir"/usr/lib/node_modules

  # Fix wrong symlinks
  for _dir in man1 man5 man7; do
    mkdir -p "$pkgdir"/usr/share/man/$_dir
    cd "$pkgdir"/usr/lib/node_modules/npm/man/$_dir
    for _file in *; do
      ln -s /usr/lib/node_modules/npm/man/$_dir/$_file "$pkgdir"/usr/share/man/$_dir/
    done
  done

  # Provide node-gyp executable
  cp "$pkgdir"/usr/lib/node_modules/npm/bin/node-gyp-bin/node-gyp "$pkgdir"/usr/bin/node-gyp
  sed -i 's|"`dirname "$0"`/../../|"`dirname "$0"`/../lib/node_modules/npm/|' "$pkgdir"/usr/bin/node-gyp

  # Experimental dedup
  cd "$pkgdir"/usr/lib/node_modules/npm/node_modules
  for dep in semver; do
    rm -r $dep;
    node "$srcdir"/npm-$pkgver/cli.js link $dep;
  done

  install -Dm644 "$srcdir"/npm-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
