# Maintainer: nnnn20430 <nnnn20430@mindcraft.si.eu.org>
# Contributor: Jason Plum <jplum@archlinuxarm.org>

pkgname=webcit
_gitname=citadel
pkgver=v9.01.r0.ga845b4f
_gittag=v9.01
pkgrel=2
pkgdesc="Citadel/UX is a collaboration suite (messaging and groupware) that is descended from the Citadel family of programs which became popular in the 1980s and 1990s as a bulletin board system platform."
arch=('i686' 'x86_64')
url="http://www.citadel.org/"
license=('GPL')
depends=('citadel')
makedepends=('git' 'citadel' 'libtool' 'autoconf' 'make' 'gcc')
optdepends=('openssl: SSL support' 'shared-mime-info: filetype identification')
conflicts=()
changelog=""
source=("$_gitname::git://git.citadel.org/appl/gitroot/citadel.git#tag=$_gittag"
        'webcit.service'
        'webcits.service'
        '001-libical2_support.patch')
install="webcit.install"
md5sums=('SKIP'
         '68b3f2fd649aaf2f8795803e24211f75'
         '18e24f3a976a09f5265d1b20a7e852e6'
         '916e66109a16d94a712ab8372ac98719')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git apply "$srcdir/001-libical2_support.patch"
}

build() {
  cd "$srcdir/$_gitname/webcit"
  ./bootstrap
  ./configure --prefix=/usr/webcit
  make
}

package() {
  cd "$srcdir/$_gitname/webcit"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/webcit.service" "$pkgdir/usr/lib/systemd/system/webcit.service"
  install -Dm644 "$srcdir/webcits.service" "$pkgdir/usr/lib/systemd/system/webcits.service"
}
