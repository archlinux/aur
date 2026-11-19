# Maintainer: fam007e
pkgname=complex-dwm-slock-git
_pkgname=Complex_DWM_SLock
pkgver=0.r17.g53935bf
pkgrel=1
pkgdesc="An enhanced, secure, and visually appealing screen locker for DWM and other X11 environments."
arch=('x86_64')
url="https://github.com/fam007e/Complex_DWM_SLock"
license=('MIT')
install=complex-dwm-slock-git.install
options=(!debug)
depends=(
  'fontconfig'
  'imlib2'
  'libx11'
  'libxft'
  'libxrandr'
  'libxrender'
  'pam'
)
makedepends=('git')
# The package installs /usr/bin/slock, so it provides and replaces the suckless one
provides=('slock')
conflicts=('slock')
# Keep a customised PAM stack across upgrades
backup=('etc/pam.d/slock')
source=("git+https://github.com/fam007e/Complex_DWM_SLock.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  # PREFIX=/usr makes DATADIR /usr/share/slock. The Makefile compiles DATADIR
  # into the binary (-DDATADIR), so build and package must use the same PREFIX.
  make PREFIX=/usr
}

package() {
  cd "$_pkgname"

  # Installs setuid /usr/bin/slock plus avatar.png and font.ttf in /usr/share/slock
  make PREFIX=/usr DESTDIR="$pkgdir" install

  # PAM service file: pam_start("slock", ...) looks for /etc/pam.d/slock
  install -Dm644 /dev/stdin "$pkgdir/etc/pam.d/slock" << 'PAM'
auth     include  system-auth
account  include  system-auth
PAM

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Documentation (referenced in the post-install message)
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
