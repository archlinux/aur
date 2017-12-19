# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgname=nix-git
pkgver=1.11.20160112
pkgrel=2
pkgdesc="The Purely Functional Package Manager"
arch=('i686' 'x86_64')
depends=('bzip2'
         'curl'
         'dblatex'
         'gc'
         'graphviz'
         'libsodium'
         'libxml2'
         'libxslt'
         'nlohmann-json'
         'openssl'
         'patch'
         'perl'
         'perl-dbi'
         'perl-dbd-sqlite'
         'perl-www-curl'
         'pv'
         'sqlite'
         'xz')
makedepends=('autoconf'
             'automake'
             'bison'
             'flex'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config')
url="https://github.com/NixOS/nix"
license=('LGPL2')
source=(git+https://github.com/NixOS/nix)
sha256sums=('SKIP')
provides=('nix')
conflicts=('nix')

pkgver() {
  cd ${pkgname%-git}
  _last_commit_date=$(git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g")
  _version=$(cat ./version)
  echo "${_version}.${_last_commit_date}"
}

prepare() {
  cd ${pkgname%-git}

  # https://github.com/NixOS/nix/issues/506
  msg2 'Removing xml --nonet...'
  sed -i "s/--nonet\s//g" doc/manual/local.mk
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./bootstrap.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/nix \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/nix \
    --localstatedir=/var/lib/nix \
    --disable-init-state \
    --enable-gc
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
