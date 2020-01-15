# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=hax11-git
pkgver=r149.ba694c6
pkgrel=4
pkgdesc="Hackbrary to Hook and Augment X11 protocol calls"
arch=('i686' 'x86_64')
url="https://github.com/CyberShadow/hax11"
license=('MIT')
depends=('glibc' 'lib32-glibc')
makedepends=('git' 'xorgproto' 'libx11' 'libxxf86vm' 'lib32-gcc-libs')
source=("git+https://github.com/CyberShadow/hax11"
	    "license.txt")
md5sums=('SKIP'
         '170e7077b627ff077e8a0716a49d9868')

pkgver() {
  cd "$srcdir/hax11"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/hax11"
  if [[ $CARCH == x86_64 ]]
  then
    make
  else
    make lib32/hax11.so
  fi
}

package() {
  # Libraries
  if [[ $CARCH == x86_64 ]]
  then
    mkdir -p "$pkgdir/usr/lib/hax11/lib"
    install -m644 -t "$pkgdir/usr/lib/hax11/lib" "$srcdir/hax11/lib64/hax11.so"

    mkdir -p "$pkgdir/usr/lib/hax11/lib32"
    install -m644 -t "$pkgdir/usr/lib/hax11/lib32" "$srcdir/hax11/lib32/hax11.so"
  else
    mkdir -p "$pkgdir/usr/lib/hax11/lib"
    install -m644 -t "$pkgdir/usr/lib/hax11/lib" "$srcdir/hax11/lib/hax11.so"
  fi

  # LD_PRELOAD profile.d script
  mkdir -p "$pkgdir/etc/profile.d"
  echo "export LD_PRELOAD=/usr/lib/hax11/\\\$LIB/hax11.so" > "$pkgdir/etc/profile.d/hax11.sh"
  chmod 755 "$pkgdir/etc/profile.d/hax11.sh"

  # License
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
}
