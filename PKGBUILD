# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname=berry
pkgname=berry-git
_pkgver=e5bcb3
pkgver=r345.fb375bf
pkgrel=2
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
provides=('berry')
conflicts=('berry')
license=('MIT')
makedepends=('gcc' 'make' 'git')
depends=('libx11' 'libxft' 'libxinerama')
source=(
	"git+https://github.com/JLErvin/berry.git"
	berry.desktop
)
sha256sums=('SKIP'
            'e1801d7429f8b0c213cb2026ab56ad3e313dcde033a3db176a94b0ef3daa75a6')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
  cd "$srcdir/$_pkgname"

  # These variables are used in the Makefile to create the file directories.
  PREFIX="/usr/local/"
  EXAMPLEPREFIX="/etc/xdg/berry/"

  # Set the variables and install the files.  
  ./configure --prefix=/usr

  # Compile the window manager
  make
}


package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  # Install the examples (sample configuration files)
  install -vDm0644 -t "$pkgdir/etc/xdg/berry" \
    examples/*

  # Install LICENSE
  install -vDm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  # Install berry.desktop
  install -vDm0644 "$srcdir/berry.desktop" -t "$pkgdir/usr/share/applications"
}

