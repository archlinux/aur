# Maintainer: perqin <perqinxie at gmail dot com>

pkgname=shadowsocksrr-libev-git
pkgver=2.5.3.r1584.ed6c9eb
pkgrel=1
pkgdesc='A ShadowsocksR fork'
# Removed i386 because the maintainer hasn't tested this package over it
arch=('x86_64')
url='https://github.com/shadowsocksrr/shadowsocksr-libev'
license=('GPL3')
depends=('openssl' 'libev' 'libsodium' 'udns' 'pcre')
makedepends=('git' 'zlib' 'asciidoc' 'xmlto')
optdepends=('mbedtls: another choice of SSL/TLS library') # choose this or openssl as you wish
options=('docs' '!strip')
source=(
        'shadowsocksrr-libev-git::git+https://github.com/shadowsocksrr/shadowsocksr-libev.git#branch=Akkariiin/develop'
        shadowsocksrr-libev-redir@.service
        shadowsocksrr-libev-server@.service
        shadowsocksrr-libev-tunnel@.service
        shadowsocksrr-libev@.service
        )
sha256sums=('SKIP'
            '037a2803047bb0800d5aa059e3331090d7b94d8fab5552f564b4ed7455b7efad'
            '8c086ee6988bcac34e85d2ec5c7487f92b3dd026bfa886fe8fec4aa484c61b9e'
            'c24d4d16291535015d30b274af466ffabf6cc02e0b7c61c206aa326746cfedc2'
            'c4d5f2dc5d4fce9680623de2a665e8f0df9783946162314cc5103d6c1f16d510')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "2.5.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  ./configure --prefix=/opt/$pkgname \
              --enable-system-shared-lib \
              --program-transform-name='s/ss-/ssrr-/' # \
            # --with-crypto-library=LIB # LIB=openssl|mbedtls, default=openssl
            # if you choose a crypto lib other than openssl, uncomment above line and the trailing slash
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install

  # systemd services
  for service in "@" "-redir@" "-server@" "-tunnel@"; do
	  install -Dm644 {"$srcdir","$pkgdir/usr/lib/systemd/system"}/shadowsocksrr-libev"$service".service
  done

  # create symlink in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  for bin in "$pkgdir/opt/$pkgname/bin/"*; do
	  local basebin="$(basename $bin)"
	  ln -s "/opt/$pkgname/bin/$basebin" "$pkgdir/usr/bin/$basebin"
  done

  # move manpages
  install -dm755 "$pkgdir/usr/share/man/man"{1,8}
  for man in "$pkgdir/opt/$pkgname/share/man/man1/"*; do
	  mv "$man" "$pkgdir/usr/share/man/man1/"
  done
  mv "$pkgdir/opt/$pkgname/share/man/man8/shadowsocks-libev.8" "$pkgdir/usr/share/man/man8/shadowsocksrr-libev.8"

  # remove empty man directories
  rm "$pkgdir/opt/$pkgname/share/man" -rf
}
