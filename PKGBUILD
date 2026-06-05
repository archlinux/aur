pkgname=complex-dwm-slock-git
_pkgname=Complex_DWM_SLock
pkgver=0.r14.g3f8e6b4
pkgrel=1
pkgdesc="An enhanced, secure, and visually appealing screen locker for DWM and other X11 environments."
arch=('x86_64')
url="https://github.com/fam007e/Complex_DWM_SLock"
license=('MIT')
install=complex-dwm-slock-git.install
options=(!debug)
depends=(
  'libx11'
  'libxext'
  'libxrandr'
  'libxrender'
  'libxft'
  'fontconfig'
  'imlib2'
  'pam'
)
makedepends=('git' 'make' 'gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/fam007e/Complex_DWM_SLock.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  # Override DATADIR to /usr/share/slock to match Arch filesystem standards
  make DATADIR=/usr/share/slock
}

package() {
  cd "$_pkgname"

  # PREFIX=/usr ensures standard /usr/bin and /usr/share paths
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  # PAM service file — required; pam_start("slock",...) looks for /etc/pam.d/slock
  install -Dm644 /dev/stdin "$pkgdir/etc/pam.d/slock" << 'PAM'
auth include system-auth
account include system-auth
PAM

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Documentation (referenced in the post-install message)
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
