# Maintainer: igo95862 <address at domain dot tld>
pkgname=bubblejail-git
pkgver=0.8.3.r534.fd731b2
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3')
depends=(
    'python'
    'python-pyxdg'
    'bubblewrap'
    'python-tomli-w'
    'python-cattrs'
    'xdg-dbus-proxy'
    'hicolor-icon-theme'
    'python-pyqt6'
    'desktop-file-utils'
    'libnotify'
)
provides=('bubblejail')
conflicts=('bubblejail')
optdepends=(
  'bash-completion: completions for bash shell'
  'fish: completions for fish shell'
  'slirp4netns: Namespaced networking stack'
)
makedepends=(
  'git'
  'meson'
  'python-jinja'
  'scdoc'
  # For python-lxns
  'gcc'
  'linux-headers'
)
source=(
  "$pkgname"::"git+https://github.com/igo95862/bubblejail"
  "python-lxns"::"git+https://github.com/igo95862/python-lxns"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.subprojects/python-lxns.url "$srcdir/python-lxns"
  git -c protocol.file.allow=always submodule update
}

build () {
  arch-meson "$srcdir/$pkgname" build \
    -Duse-vendored-python-lxns=enabled \
    -Dversion_display="AUR-git $pkgver" \
    --wipe
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
