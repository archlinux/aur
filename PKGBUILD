# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=nano-git
pkgver=20230514
pkgrel=1
pkgdesc="Pico editor clone with enhancements, git version"
arch=(x86_64)
license=('GPL')
url="http://www.nano-editor.org"
depends=('ncurses' 'file')
makedepends=('texinfo' 'git')
source=(git+https://git.savannah.gnu.org/git/nano.git
       fix-git-path.patch)
backup=('etc/nanorc')
provides=('nano')
conflicts=('nano')
replaces=('nano-svn')
sha512sums=('SKIP'
            '51a9ccc7b0be33f14c8fa355ed0df97a3c3a468e28815b3e7618aa19c2f0ffa13053f4b11619a98352803eac82dd0125cfc424884943f79b3653eed531fd69cc')

pkgver() {
    # Identify latest version.
    cd "$srcdir/nano"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
    # Running the configure script.
    cd "$srcdir/nano"
    patch -p 2 -i "${srcdir}/fix-git-path.patch"
    ./autogen.sh

    ./configure \
    --prefix=/usr \
      --sysconfdir=/etc \
      --enable-color \
      --enable-nanorc \
      --enable-multibuffer \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --disable-wrapping-as-root
}

build() {
    cd "$srcdir/nano"
    make
}

package() {
    # Moving everything to pkg/.
    cd "$srcdir/nano"
    make DESTDIR="$pkgdir" sbindir=/usr/bin install
    install -DTm644 "$srcdir/nano/doc/sample.nanorc" "$pkgdir/etc/nanorc"
}
