# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=yarn-xdg
pkgver=1.22.19
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management - with xdg basedir patches'
arch=(any)
provides=('yarn')
conflicts=('yarn')
url='https://classic.yarnpkg.com/'
license=('BSD')
depends=('nodejs' 'gulp')
source=("git+https://github.com/yarnpkg/yarn.git"
        "https://github.com/yarnpkg/yarn/releases/download/v$pkgver/yarn-v$pkgver.tar.gz"
        "https://github.com/noahvogt/yarn-build-node_modules/releases/download/1.22.19-1/yarn-build-node_modules.tar.gz"
        "use-portable-yarn-executable-for-build.patch"
        "remove-legacy-yarnrc-path.patch")
sha512sums=('SKIP'
            'ff4579ab459bb25aa7c0ff75b62acebe576f6084b36aa842971cf250a5d8c6cd3bc9420b22ce63c7f93a0857bc6ef29291db39c3e7a23aab5adfd5a4dd6c5d71'
            '11b54551b63fc4047c51acf057c0a121a6957d646d8ac73076b9e43ea73f7145edf3e5cce90b49bbc559d7cbac73654c908ae8cc5720ab5b5f87298c9fe720b0'
            '15567201dc43d940633751645469d5660fe648643ee532dbfd96621ae4b34590685f4787f0af4a5a3a9b16d99c815e66056103ae41429cd6aa4c0b054349de34'
            '3090468d9b79114e89d62b96b5db5a9b019ea5ba5e01d03423b9722727fb7f276d16edb45f3bca4d09cd702e4dd77601d15627005f77ea3268dd9bbdb8582c74')

prepare() {
  cd yarn
  git checkout 1.22-stable
  mv "$srcdir/yarn-v$pkgver" "$srcdir/yarn-portable"
  mv "$srcdir/node_modules" .

  patch -p1 -i "$srcdir/use-portable-yarn-executable-for-build.patch"
  patch -p1 -i "$srcdir/remove-legacy-yarnrc-path.patch"
}

build() {
  cd yarn
  ./scripts/build-dist.sh
}

package() {
  cd "$srcdir/yarn"
  install -dm755  "$pkgdir"/usr/lib/node_modules/yarn
  cp -R * "$pkgdir"/usr/lib/node_modules/yarn

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarn
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarnpkg

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
