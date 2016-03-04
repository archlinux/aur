# Maintainer: nnnn20430 <nnnn20430@mindcraft.si.eu.org>
# Contributor: Jason PLum <jplum@archlinuxarm.org>

pkgname=citadel
_gitname=citadel
pkgver=v9.01.r0.ga845b4f
_gittag=v9.01
pkgrel=2
pkgdesc="Citadel/UX is a collaboration suite (messaging and groupware) that is descended from the Citadel family of programs which became popular in the 1980s and 1990s as a bulletin board system platform."
arch=('i686' 'x86_64')
url="http://www.citadel.org/"
license=('GPL')
depends=('libcitadel' 'libev' 'c-ares' 'curl' 'expat' 'libical' 'libsieve' 'perl-berkeleydb')
makedepends=('git' 'libcitadel' 'libev' 'c-ares' 'curl' 'expat' 'libical' 'libsieve' 'perl-berkeleydb' 'libtool' 'autoconf' 'make' 'gcc')
optdepends=('openssl: SSL support' 'shared-mime-info: filetype identification')
conflicts=()
changelog=""
source=("$_gitname::git://git.citadel.org/appl/gitroot/citadel.git#tag=$_gittag"
        'citadel.service'
        '001-libical2_support.patch')
install="$pkgname.install"
md5sums=('SKIP'
         '1dad4ebec773f08de372d794ed16d214'
         'ce32349cd9f646d41bb444c6cb47a033')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git apply "$srcdir/001-libical2_support.patch"
}

build() {
  cd "$srcdir/$_gitname/citadel"
  ./bootstrap
  ./configure --prefix=/usr/citadel
  make
}

package() {
  cd "$srcdir/$_gitname/citadel"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/citadel.service" "$pkgdir/usr/lib/systemd/system/citadel.service"	
}
