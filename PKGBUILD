# Maintainer: caiye <ye dot jingchen at gmail dot com>

pkgname=shadowsocksr-libev-git
pkgver=2.4.1.368.ge2373d7
pkgrel=1
pkgdesc='A Shadowsocks fork'
arch=('i686' 'x86_64')
url='https://github.com/shadowsocksr/shadowsocksr-libev'
license=('GPL3')
#conflicts=('shadowsocks-libev') # no more conflicts
depends=('openssl' 'libev' 'libsodium' 'udns' 'pcre')
makedepends=('git' 'gcc' 'autoconf' 'libtool' 'automake' 'make' 'zlib' 'openssl' 'asciidoc' 'xmlto')
options=('docs' '!strip')
install=shadowsocksr-libev.install
source=(
        'git+https://github.com/shadowsocksr-backup/shadowsocksr-libev.git'
        shadowsocksr-libev-redir@.service
        shadowsocksr-libev-server@.service
        shadowsocksr-libev-tunnel@.service
        shadowsocksr-libev@.service
		shadowsocksr-libev.sh
        )
sha256sums=('SKIP'
            '3d5a42a98f0b342cee40d9295da55e37768ced74c18b51f8e144c79e7c804b4c'
            '0ca36847f4d02a36ab793c15f1abf95d19aea27455d9738a45b50d4906bba317'
            'f186d164d99d9e32cd72554aafbd5fae86066a19be09fadf68b2c95e4f395637'
            'ee78d9c3b2568afea2a61f6d466710bc70672941bd507b0fd3e9654b3d29304a'
            'bd281bca7de8d64e1812e1f385fe094aea0ffb99aaa4e43f64222e990dce271d')

_gitname='shadowsocksr-libev'

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  ./configure --prefix=/opt/$_gitname --enable-system-shared-lib --program-transform-name=s/ss-/ssr-/
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 {"$srcdir/","$pkgdir/usr/lib/systemd/system/"}shadowsocksr-libev-redir@.service
  install -Dm644 {"$srcdir/","$pkgdir/usr/lib/systemd/system/"}shadowsocksr-libev-server@.service
  install -Dm644 {"$srcdir/","$pkgdir/usr/lib/systemd/system/"}shadowsocksr-libev-tunnel@.service
  install -Dm644 {"$srcdir/","$pkgdir/usr/lib/systemd/system/"}shadowsocksr-libev@.service

  # PATH
  install -Dm755 {"$srcdir/","$pkgdir/etc/profile.d/"}$_gitname.sh

  # move manpages
  install -dm755 "$pkgdir/usr/share/man/man"{1,8}
  for bin in ssr-{nat,manager,redir,server,local,tunnel}; do
      mv "$pkgdir/"{opt/$_gitname,usr}"/share/man/man1/$bin.1"
  done
  mv "$pkgdir/opt/$_gitname/share/man/man8/shadowsocks-libev.8" "$pkgdir/usr/share/man/man8/shadowsocksr-libev.8"

  # remove empty directories
  rm "$pkgdir/opt/$_gitname/share/man" -rf
}
