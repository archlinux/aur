# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix-git
pkgver=2.2.r4369.g9fe0343
pkgrel=1
pkgdesc="A purely functional package manager"
arch=(x86_64 i686)
url="https://github.com/NixOS/${pkgname%-git}"
license=(LGPL2)
depends=(boost
         brotli
         bzip2
         curl
         editline
         gc
         libseccomp
         libsodium
         openssl
         sqlite)
makedepends=(autoconf-archive
             git
             gtest
             jq
             libcpuid
             lowdown)
backup=("etc/${pkgname%-git}/${pkgname%-git}.conf")
install="${pkgname%-git}.install"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        nix.conf
        sysusers.conf
        tmpfiles.conf
        user.environment.conf
        user.tmpfiles.conf)
sha256sums=('SKIP'
            'cf3c7a3a24ac0f553b6fd8ba6adb8f1375d8675911af12c4db94918a799f688e'
            'cf6caa02e0b5224332c5945ba6fa08b1517802898290e6c2eb96046cad9598d8'
            'f078cb60bdd549e9cb3b9af3dfacd33e1b7f16a7e7c02904f50f08bfc8c0d952'
            'e45e45394a119a4ef2046a4a39403dda2df2af820c2d116763031c4689fc5717'
            'c353524861487ef7f7e862bdaaa70e2a3a29e08d2ee31947ebf9e01237c5c50d')

prepare() {
	cd "$pkgname"
  ./bootstrap.sh
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  CXXFLAGS='-D_GLIBCXX_USE_CXX11_ABI=0' \
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/nix \
    --sysconfdir=/etc \
    --localstatedir=/nix/var \
    --enable-gc
  make builddir="$srcdir/$pkgname-$pkgver"
}

package() {
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname-daemon.conf"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname-daemon.conf"
  install -vDm644 user.tmpfiles.conf "$pkgdir/usr/share/user-tmpfiles.d/$pkgname-daemon.conf"
  install -vDm644 user.environment.conf "$pkgdir/usr/lib/environment.d/$pkgname-daemon.conf"
  install -vDm644 nix.conf -t "$pkgdir/etc/$pkgname"
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

}
