# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: William Grieshaber <me@zee.li>
# Contributor: Michal Kowalski <kowalski TOD michal TA gmail TOD com>

pkgname=achilles
pkgver=2.10
pkgrel=1
pkgdesc="An artificial life and evolution simulator that uses Hebbian neural networks and OpenGL/SDL to simulate life in a simplified environment. It is based on Larry Yaeger's PolyWorld idea"
arch=('i686' 'x86_64')
# originally there, still has 1st version's tarball, do not remove
#url="http://achilles.sourceforge.net/"
url="http://packages.debian.org/achilles"
# resolves to
#url="http://packages.debian.org/search?keywords=achilles"
# really but looks better in -Qi and should be the stable one
license=('GPL2')
depends=('glu' 'libgl' 'libpng' 'sdl' 'zlib')
backup=()
options=()
install=
changelog=
# see url comment above...
#source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
source=("http://ftp.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_2-10.debian.tar.xz"
        "http://ftp.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_2.orig.tar.gz")
sha512sums=('88762d7f3180fc1b6c02ea117783072796829f687600d10907c20a63ef4cc0efe4fc3338f0c7d394d343d5d35c22ef8df0e35951408eed9baac6a45d47091500'
            '3be21d55aea094fa32536348d29f5fe45f9681d1ee2627d146c8595303d70219a38946435b0f83446ff039d5133a5efc946749378c86c0cc93091c0ebaaa1185')
noextract=()

build() {
  cd "$srcdir/$pkgname-2"

  patch -p1 -i "../debian/patches/010_previous.patch"
  ./configure --prefix=/usr
  make CXXFLAGS="${CXXFLAGS} -I/usr/include/SDL"
}

package() {
  pushd "$srcdir/$pkgname-2"
    make DESTDIR="${pkgdir}/" install
    for d in usr/share/{doc/$pkgname-2,pixmaps,applications,man/man1} ; do
      install -dm755 "${pkgdir}/$d" ;
    done
    
    install -m644 -t "${pkgdir}/usr/share/doc/$pkgname-2" README NEWS ChangeLog AUTHORS
  popd
  
  install -m644 "debian/$pkgname.1" "${pkgdir}/usr/share/man/man1"
  install -m644 "debian/$pkgname.desktop" "${pkgdir}/usr/share/applications"
  install -m644 "debian/$pkgname.svg" "${pkgdir}/usr/share/pixmaps"
}

# vim:set ts=2 sw=2 et:
