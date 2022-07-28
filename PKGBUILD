gitname=fbpanel
pkgname="$gitname-git"
pkgver=44.478754b
pkgrel=3
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

    # Arch Linux packages python as python3 but these scripts are written in python2
    sed -i 's|/usr/bin/python$|/usr/bin/python2|' configure .config/repl.py

    # Make compilation pass despite GTK deprecation warnings
    sed -i 's/\-Werror//' .config/rules.mk

    # Remove unused definition that confuses the linker
    sed -i 's/struct\ \_plugin_instance \*stam\;//' panel/plugin.h
}

build(){
    cd "${srcdir}/${gitname}"

    ./configure --prefix=/usr --libexecdir=/usr/lib --mandir=/usr/share/man/man1
    make
}

package(){
    cd "${srcdir}/${gitname}"

    make DESTDIR="$pkgdir/" install

    # Add forgotten localization files
    cd po
    for mofile in *.mo;do
        install -Dm755 "$mofile" "$pkgdir/usr/share/fbpanel/locale/${mofile%%_*}/LC_MESSAGES/fbpanel.mo"
    done
}
