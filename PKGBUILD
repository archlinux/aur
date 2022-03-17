# Contributor: dreieck
# Contributor: BlackIkeEagle

pkgname=kvirtual-git
_gitname="kvirtual"
pkgver=1.1.1+4+r82.20170125.d14e0c5
pkgrel=4
pkgdesc="KDE4 GUI-frontend for kvm/qemu emulator"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KVirtual?content=150682"
license=('GPL2')
depends=('kde-cli-tools' 'kdelibs' 'qemu')
makedepends=('git' 'cmake' 'automoc4')
provides=("kvirtual=${pkgver}")
conflicts=('kvirtual')
source=("$_gitname::git+https://github.com/didier13150/kvirtual.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  _ver="$(git describe --tags --always | sed 's|^[vV]||' | sed -E 's|\-g?[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi

}

build() {
  msg "creating build directory"
  cd "$srcdir"
  [ -d $_gitname-build ] && rm -rf $_gitname-build
  mkdir $_gitname-build

  msg "Starting make..."
  cd $_gitname-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ../$_gitname
  make
}
package() {
  cd "$_gitname-build"
  make DESTDIR="$pkgdir" install
}
