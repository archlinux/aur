gitname=fbpanel
pkgname="$gitname-git"
pkgver=44.478754b
pkgrel=1
pkgdesc="NetWM compliant desktop panel (git)"
license=(GPL)
arch=(i686 x86_64)
provides=('fbpanel' 'fbpanel-svn')
conflicts=('fbpanel' 'fbpanel-svn')
depends=('gtk2' 'python2')
makedepends=('automake' 'autoconf')
url="https://github.com/aanatoly/$gitname"
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}

prepare() {
    cd "${srcdir}/${gitname}"
    sed -i 's|/usr/bin/python$|/usr/bin/python2|' configure
    ./configure --prefix=/usr --libexecdir=/usr/lib --mandir=/usr/share/man/man1
    echo "LDFLAGSX += -lX11 -lm" >>config.mk
    sed -i 's|/usr/bin/python$|/usr/bin/python2|' repl.py
}
build(){
    cd "${srcdir}/${gitname}"
    ionice -c 3 nice -n 19 make
}
package(){
    cd "${srcdir}/${gitname}"
    make DESTDIR="$pkgdir/" install
}
