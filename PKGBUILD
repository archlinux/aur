_pkgname=gnome-keyring
pkgname="${_pkgname}-git"
pkgver=50.0+5+g947a85a2
pkgrel=1
epoch=1
pkgdesc="Stores passwords and encryption keys"
url="https://wiki.gnome.org/Projects/GnomeKeyring"
arch=(x86_64)
license=(
  GPL
  LGPL)
depends=(
  'gcr-4'
  'libcap-ng'
  'pam'
  'openssh')
makedepends=(
  'git'
  'docbook-xsl'
  'python'
  'meson'
)
provides=(
  'gnome-keyring'
  'org.freedesktop.secrets')
conflicts=(
  'gnome-keyring')
groups=(
  'gnome')
install="${_pkgname}.install"
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-keyring.git"
  add-cinnamon.diff)
sha256sums=('SKIP'
            'd05210f5b0a7d4b22c0dff2854854af2eb5708aa2b296095e070dca68e9f815a')

pkgver() {
  cd \
   "${_pkgname}"
  git \
    describe \
    --tags | \
      sed \
        's/-/+/g'
}

prepare() {
  cd "${_pkgname}"

  # Autolaunch in Cinnamon
  git \
    apply \
    -3 \
    ../add-cinnamon.diff
}

build() {
  arch-meson gnome-keyring build -Dselinux=disabled -Dsystemd=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
