# Maintainer: Lance Chen <cyen0312@gmail.com>

pkgname=enjarify
pkgver=r23.ff815da
pkgrel=1
pkgdesc="Translating Dalvik bytecode to Java bytecode"
arch=(any)
url="https://github.com/google/enjarify"
license=('Apache')
depends=("python")
makedepends=('git')
source=('enjarify::git+https://github.com/google/enjarify'
        'pythonpath.patch')
sha256sums=('SKIP'
            'be411711026be0b8fc6dfb77fb46c350ff8920f882651d6667b253ab8eedef1e')

pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/pythonpath.patch"
}

package() {
	cd "$srcdir/$pkgname"
        mkdir -p "${pkgdir}/usr/lib/"
        cp -R enjarify "${pkgdir}/usr/lib/"
        install -m755 -D enjarify.sh "${pkgdir}/usr/bin/enjarify"
}
