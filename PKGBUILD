# Maintainer: TNT_TS <tnt_ts@qq.com>
pkgname=firefox-webhid-bridge
pkgver=0.2.3
pkgdesc="The server of firefox ADD-ONS WebHID for Firefox by Sainan"
pkgrel=3
arch=('any')
url=https://github.com/Sainan/WebHID-for-Firefox
license=('Unlicense')
depends=('glibc')
makedepends=('git' 'clang' 'lld' 'php')
provides=('firefox-webhid-bridge')
conflicts=('firefox-webhid-bridge')

source=("${pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=('214b50a5ea294a9c3542887a568b21d9')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname/server"
  sed -i 's/-DSOUP_STANDALONE")/-DSOUP_STANDALONE -frtti")/' Soup/build_lib.php
  php Soup/build_lib.php
  clang++ -o firefox-webhid-bridge main.cpp -I Soup/soup/ Soup/libsoup.a -std=c++17 -fuse-ld=lld -lm -lresolv -pthread
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm664 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 server/firefox-webhid-bridge "$pkgdir/usr/bin/firefox-webhid-bridge"
}
