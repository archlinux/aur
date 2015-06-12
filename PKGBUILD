# Maintainer: Manish Munikar <munikarmanish@gmail.com>>

pkgname="photocrypt-git"
pkgver=0.6.r1.gf7d0927
pkgrel=1
pkgdesc="A text-to-image steganography tool"
arch=('any')
url="https://github.com/munikarmanish/photocrypt"
license=('BSD')
groups=()
depends=()
makedepends=('git' 'opencv' 'gtkmm' 'openssl')
provides=('photocrypt')
conflicts=('photocrypt')
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/munikarmanish/photocrypt" "photocrypt.desktop")
noextract=()
sha256sums=('SKIP' '0614b31b3a1e6e80c737c6711a983be6889e70f78374318b4848f23442cd6801') #generate with 'makepkg -g'

_gitname="photocrypt"
_gitroot="https://github.com/munikarmanish/photocrypt"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's|-|-r|; s|-|\.|g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin master
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting build..."
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "$srcdir/$_gitname"

  msg "Installing..."
  make DESTDIR="$pkgdir" install

  msg "Installing desktop entry..."
  install -Dm644 "${srcdir}/photocrypt.desktop" "${pkgdir}/usr/share/applications/photocrypt.desktop"
}

# vim:set ts=2 sw=2 et:
