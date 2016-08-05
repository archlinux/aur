# Maintainer: nnnn20430 <nnnn20430@mindcraft.si.eu.org>
# Contributor: Jason PLum <jplum@archlinuxarm.org>

pkgbase=citadel
pkgname=('citadel' 'libcitadel' 'webcit')
_gitname=citadel
pkgver=902
_gittag=Release_902
pkgrel=1
pkgdesc="Citadel/UX is a collaboration suite (messaging and groupware) that is descended from the Citadel family of programs which became popular in the 1980s and 1990s as a bulletin board system platform."
arch=('i686' 'x86_64')
url="http://www.citadel.org/"
makedepends=('git' 'libev' 'c-ares' 'curl' 'expat' 'libical' 'libsieve' 'perl-berkeleydb' 'glibc' 'zlib' 'libtool' 'autoconf' 'make' 'gcc')
license=('GPL')
conflicts=()
changelog=""
source=("$_gitname::git://git.citadel.org/appl/gitroot/citadel.git#tag=$_gittag"
        'citadel.service'
        'webcit.service'
        'webcits.service'
        '001-libical2_support_citadel.patch'
        '001-libical2_support_webcit.patch')
md5sums=('SKIP'
         '1dad4ebec773f08de372d794ed16d214'
         '3904b1795a552fd2f2bc8f9741f6dc58'
         'cae0cfa8f42e1f0e96fbf0e4aff0ba56'
         'ce32349cd9f646d41bb444c6cb47a033'
         '916e66109a16d94a712ab8372ac98719')

prepare() {
  cd "$srcdir/$_gitname"
  git apply "$srcdir/001-libical2_support_citadel.patch"
  git apply "$srcdir/001-libical2_support_webcit.patch"
}

build() {
  cd "$srcdir/$_gitname/libcitadel"
  ./bootstrap
  ./configure --prefix=/usr
  make
  
  (
    cd "$srcdir/$_gitname/citadel"
    export CFLAGS="${CFLAGS} -I ../libcitadel/lib"
    export LDFLAGS="${LDFLAGS} -L../libcitadel/.libs"
    ./bootstrap
    ./configure --prefix=/usr/citadel
    make
  )
  
  (
    cd "$srcdir/$_gitname/webcit"
    export CFLAGS="${CFLAGS} -I ../libcitadel/lib"
    export LDFLAGS="${LDFLAGS} -L../libcitadel/.libs"
    ./bootstrap
    ./configure --prefix=/usr/citadel/webcit
    make
  )
}

package_citadel() {
  depends=('libcitadel' 'libev' 'c-ares' 'curl' 'expat' 'libical' 'libsieve' 'perl-berkeleydb')
  optdepends=('openssl: SSL support' 'shared-mime-info: filetype identification')
  install="citadel.install"

  cd "$srcdir/$_gitname/citadel"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/citadel.service" "$pkgdir/usr/lib/systemd/system/citadel.service"	
}

package_libcitadel() {
  depends=('glibc' 'zlib')
  optdepends=()

  cd "$srcdir/$_gitname/libcitadel"
  make DESTDIR="$pkgdir" install
}

package_webcit() {
  depends=('citadel')
  optdepends=('openssl: SSL support' 'shared-mime-info: filetype identification')
  install="webcit.install"

  cd "$srcdir/$_gitname/webcit"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/webcit.service" "$pkgdir/usr/lib/systemd/system/webcit.service"
  install -Dm644 "$srcdir/webcits.service" "$pkgdir/usr/lib/systemd/system/webcits.service"
}
