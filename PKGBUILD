# Maintainer: caiye <ye dot jingchen at gmail dot com>

pkgname=shadowsocksr-libev-git
pkgver=2.4.1.368.ge2373d7
pkgrel=2
pkgdesc='A Shadowsocks fork'
arch=('i686' 'x86_64')
url='https://github.com/shadowsocksr-backup/shadowsocksr-libev'
license=('GPL3')
#conflicts=('shadowsocks-libev') # no more conflicts
depends=('openssl' 'libev' 'libsodium' 'udns' 'pcre')
makedepends=('git' 'zlib' 'asciidoc' 'xmlto')
optdepends=('mbedtls: another choice of SSL/TLS library') # choose this or openssl as you wish
options=('docs' '!strip')
source=(
        'git+https://github.com/shadowsocksr-backup/shadowsocksr-libev.git'
        shadowsocksr-libev-redir@.service
        shadowsocksr-libev-server@.service
        shadowsocksr-libev-tunnel@.service
        shadowsocksr-libev@.service
        )
sha256sums=('SKIP'
            '8d27cf80278bff1055ab208ccc9eab04193fea34a5c18b778647f46e87371153'
            '32ca7d65d78bf31d6787b19b22c8aed0d2fe2ad2790a5ca9f315033cbe23393d'
            '46fce883f20f705d346a8f1128ae31b421553d86045ef47eadafc96390f32c1a'
            '0e341beeeaef04c1ee952a33ac7db86b65cfd5867082c73c67f457a50a3d7fdd')

_gitname='shadowsocksr-libev'

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  ./configure --prefix=/opt/$_gitname \
              --enable-system-shared-lib \
              --program-transform-name='s/ss-/ssr-/' # \
            # --with-crypto-library=LIB # LIB=openssl|mbedtls, default=openssl
            # if you choose a crypto lib other than openssl, uncomment above line and the trailing slash
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install

  # systemd services
  for service in "@" "-redir@" "-server@" "-tunnel@"; do
	  install -Dm644 {"$srcdir","$pkgdir/usr/lib/systemd/system"}/shadowsocksr-libev"$service".service
  done

  # create symlink in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  for bin in "$pkgdir/opt/$_gitname/bin/"*; do
	  local basebin="$(basename $bin)"
	  ln -s "/opt/$_gitname/bin/$basebin" "$pkgdir/usr/bin/$basebin"
  done

  # move manpages
  install -dm755 "$pkgdir/usr/share/man/man"{1,8}
  for man in "$pkgdir/opt/$_gitname/share/man/man1/"*; do
	  mv "$man" "$pkgdir/usr/share/man/man1/"
  done
  mv "$pkgdir/opt/$_gitname/share/man/man8/shadowsocks-libev.8" "$pkgdir/usr/share/man/man8/shadowsocksr-libev.8"

  # remove empty man directories
  rm "$pkgdir/opt/$_gitname/share/man" -rf
}
