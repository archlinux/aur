# Maintainer: Alexis Belmonte <alexbelm48@gmail.com>
pkgname="notify-git"
pkgrel=2
pkgdesc="ntfy.sh client application to receive everyday's notifications"
pkgver=0.1.6_94d6286
arch=('x86_64')
url="https://github.com/ranfdev/Notify"
license=('GPL3')
depends=(gtk4 gtksourceview5 libadwaita openssl)
makedepends=(grep git meson ninja cargo blueprint-compiler capnproto)
optdepends=(
  'gnome-keyring: Required on GNOME-based desktops to launch the program'
  'kwalletmanager: Required on KDE-based desktops to launch the program'
)
source=("git+https://github.com/ranfdev/Notify")
sha256sums=('SKIP')
options=('!lto')
_reponame="Notify"
_repodir="${pkgdir}/${_reponame}"

pkgver() {
  echo "$(grep -oP '(\d+\.){2}\d+' "${_reponame}/Cargo.toml" | head -n1)_$(cd "${_reponame}" && git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}" && \
    arch-meson "${_reponame}" build ${meson_options[@]} ||
    meson setup --reconfigure ||
    meson setup --wipe;
}

build() {
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

check() {
  meson test -C build
}
