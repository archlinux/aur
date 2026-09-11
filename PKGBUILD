# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>
# Adopted from: Jens Staal <staal1978@gmail.com>

pkgname=dash-static-musl
_pkgbase=dash
pkgver=0.5.13.5
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible"
arch=('x86_64' 'aarch64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
makedepends=('musl' 'gcc' 'make') #we are static. The Arch libedit package has stopped to ship the static library :(
optdepends=('dashbinsh')
install=dash.install
source=("http://gondor.apana.org.au/~herbert/dash/files/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('ae326c110713a9da6b7afb977ca6fd931793b03011f0a7aa2c42e873f116ed09448deea9ef5ca4515fe3afe24e210e0aaa580f7de89934edda9cf31ee44c94dd')
b2sums=('cef313ea867c45393b4739b71ff5320ca365cb15b3a7772c7c1a9cf2a2663a2c7b86cfe49d12076144152364e6411a7c5a8bbfd74f20400416c9cee9351eb049')

build() {
  cd "${_pkgbase}-${pkgver}"
  export CC="gcc"
  export CFLAGS="$CFLAGS -mmusl -Os -mno-outline-atomics"
  export LDFLAGS="$LDFLAGS -fno-link-libatomic -fno-inline-atomics"
  ./configure \
    --enable-static \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix=""
#    --with-libedit # disabled libedit for now
  make V=1
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING
}
