# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher
pkgver=1.3.1
pkgrel=2
pkgdesc='Burn images to SD cards & USB drives, safe & easy'
arch=(x86_64)
url='https://www.etcher.io/'
license=(apache)
depends=(electron gtk2 libxtst libxss gconf nss alsa-lib)
makedepends=(npm python2 git)
optdepends=('libnotify: for notifications'
            'speech-dispatcher: for text-to-speech')
source=("https://github.com/resin-io/$pkgname/archive/v$pkgver.tar.gz"
        'etcher-electron')
sha256sums=('a6d08e8e4cf37c233e47317967e29e637e3d1ed72861ae5b239828ffbf312921'
            '70b2eb283cbf03a03232ceefeaa0be2dffd6253ab6a9cd1834dee674ee1e3ab7')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/python$/python2/' scripts/build/dependencies-npm.sh
}

build() {
  cd "$pkgname-$pkgver"

  export PATH="$(pwd)/node_modules/.bin:$PATH"
  ./scripts/build/dependencies-npm.sh \
    -s linux \
    -r x64 \
    -t electron \
    -v "$(pacman -Q electron | sed 's/electron \(.\+\)-.\+/\1/')" \
    -p
}

package() {
  cd "$pkgname-$pkgver"

  _appdir="$pkgdir"/usr/share/$pkgname
  install -d "$_appdir"

  install package.json "$_appdir"
  cp -a lib "$_appdir"
  cp -a build "$_appdir"
  cp -a assets/icon.png "$_appdir"
  cp -a node_modules/ "$_appdir"

  install -Dm755 "$srcdir"/etcher-electron "$pkgdir"/usr/bin/etcher-electron
}

# vim:set ts=2 sw=2 et:
