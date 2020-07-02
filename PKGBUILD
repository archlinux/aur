# Maintainer: Devin Pohl <pohl.devin@gmail.com>

# -------------------------------------------------------
#                        PLUGINS
# -------------------------------------------------------
# If you'd like to compile in plugins, add the names here
# For a list of available plugins, see the git repo
#   or run `make plugins` in the cloned repo
PLUGINS=""

_pkgname=dmenu
_pkgbase=$_pkgname-rs
pkgname=$_pkgbase-git
pkgver=5.2.3.r211.7b324f7
pkgrel=1
pkgdesc="The development branch of dmenu-rs. Likely has unstable features."
arch=('i686' 'x86_64')
url="https://github.com/Shizcow/dmenu-rs"
license=('GPL')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('rust' 'git' 'clang')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgbase}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  # first get the most recent tag from master
  git checkout master > /dev/null
  git describe --tags | tr -d '\n'
  # then get the commit hash from development branch
  git checkout develop > /dev/null
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() (
  cd $_pkgbase
  git config advice.detachedHead false
)

build() (
  cd $_pkgbase
  git checkout develop
  make PLUGINS="$PLUGINS"
)

package() (
  cd $_pkgbase
  make PREFIX=/usr DESTDIR="$pkgdir" PLUGINS="$PLUGINS" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
)