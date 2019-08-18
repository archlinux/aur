# Maintainer: Manish Munikar <munikarmanish@gmail.com>>

pkgname="photocrypt-git"
pkgver=0.7.r0.g0ba79b5
pkgrel=1
pkgdesc="A text-to-image steganography tool"
arch=("any")
url="https://github.com/munikarmanish/photocrypt"
license=("BSD")
groups=()
depends=("gtkmm3" "opencv" "openssl" "vtk" "hdf5")
makedepends=("gcc" "make" "pkg-config")
provides=("photocrypt")
conflicts=("photocrypt")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/munikarmanish/photocrypt"
        "photocrypt.desktop"
        "photocrypt.png")
noextract=()
sha256sums=("SKIP"
            "cb94a180ac7dcd527679b71a1a64a178ad8785f4f2d865f2f3cb0ee7fc70d735"
            "cc6d04e2e570918209184d8c5d9cb10361ee899c6c4f4b678942728c7deee270")

_gitname="photocrypt"
_gitroot="https://github.com/munikarmanish/photocrypt"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed "s|-|-r|; s|-|\.|g"
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
  install -Dm 644 "${srcdir}/photocrypt.png" "${pkgdir}/opt/photocrypt/photocrypt.png"
}

# vim:set ts=2 sw=2 et:
