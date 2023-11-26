# Maintainer: Jack Baines <jackbaines6 at google email>
pkgname=prevodb-git
pkgver=0.2.r12.ee4b73e
pkgrel=1
pkgdesc="Tools for building and reading Reta Vortaro (Esperanto dictionary) databases."
arch=('x86_64')
url="https://www.busydoingnothing.co.uk/prevo/"
license=('GPL-2.0-only')

depends=('glibc'
         'glib2'
         'expat')
makedepends=('git')
optdepends=('prevodb-databases-git')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/bpeel/prevodb.git')
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/${pkgname%-git}"
   printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
   cd "$srcdir/${pkgname%-git}"
   mkdir -p $(pwd)/build

   ./autogen.sh --prefix=$(pwd)/build
   make -j
}

package() {
   cd "$srcdir/${pkgname%-git}"
   make install

   cd ./build

   install -Dm 755 bin/prevo -t "$pkgdir/usr/bin"
   install -Dm 755 bin/prevodb -t "$pkgdir/usr/bin"
   install -Dm 644 etc/bash_completion.d/prevo-completion \
      "${pkgdir}/usr/share/bash-completion/completions/prevo"
   install -Dm 644 share/locale/eo/LC_MESSAGES/* \
      -t "${pkgdir}/usr/share/locale/eo/LC_MESSAGES"
}
