# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=hax11-git
pkgver=r83.7214eca
pkgrel=1
pkgdesc="Hackbrary to Hook and Augment X11 protocol calls"
arch=('i686' 'x86_64')
url="https://github.com/CyberShadow/hax11"
license=('MIT')
depends=('glibc' 'lib32-glibc')
makedepends=('git')
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
  make
}

package() {
  # Libraries
  for arch in 32 64
  do
    mkdir -p "$pkgdir/usr/lib/hax11/lib$arch"
    install -m644 -t "$pkgdir/usr/lib/hax11/lib$arch" "$srcdir/hax11/lib$arch/hax11.so"
  done

  # LD_PRELOAD profile.d script
  mkdir -p "$pkgdir/etc/profile.d"
  echo "export LD_PRELOAD=/usr/lib/hax11/\\\$LIB/hax11.so" > "$pkgdir/etc/profile.d/hax11.sh"
  chmod 755 "$pkgdir/etc/profile.d/hax11.sh"

  # License
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
}
