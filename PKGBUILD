# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_pkgbase=studiomdl
pkgname=${_pkgbase}-git
pkgver=v0.1.0.r0.g90a285a
pkgrel=1
pkgdesc='A cross-platform compatible version of studiomdl for Half-Life.'
url='https://github.com/fnky/studiomdl'
arch=(i686 x86_64)
license=('custom:Half Life 1 SDK')
depends=('lib32-glibc')
makedepends=('git' 'gcc-multilib')
provides=($_pkgbase)
conflicts=($_pkgbase)

source=('git+https://github.com/fnky/studiomdl.git'
        'fix_getcwd.patch'
        'fix_memmove.patch'
        'fix_makefile.patch')
sha256sums=('SKIP'
            'a8c8f5d240c841282d037e5662b797227d702695bb88c543066d5c3df40afaea'
            '8ec92522fb9013233e729fa98bec03fada44a5676adca49ac71c70edff967a86'
            'ff86f788e6961c29b572f91724b073e7708482a3911db877287bdd1f5121899c')

pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgbase"
  patch -Np1 <../fix_getcwd.patch
  patch -Np1 <../fix_memmove.patch
  patch -Np1 <../fix_makefile.patch
}

build() {
  cd "$_pkgbase"
  export LDFLAGS="$LDFLAGS -s"
  make
}

package() {
  cd "$_pkgbase"
  install -Dm755 build/bin-i386/studiomdl "$pkgdir/usr/bin/studiomdl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"  
}
