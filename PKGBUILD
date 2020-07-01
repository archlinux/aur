# Maintainer: Devin Pohl <pohl.devin@gmail.com>

# -------------------------------------------------------
#                        PLUGINS
# -------------------------------------------------------
# If you'd like to compile in plugins, add the names here
# For a list of available plugins, see the git repo
#   or run `make plugins` in the cloned repo
PLUGINS=""

_pkgname=dmenu
pkgname=$_pkgname-rs
pkgver=5.2.2
pkgrel=1
pkgdesc="A 1:1 port of dmenu, rewritten in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Shizcow/dmenu-rs"
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
makedepends=('rust' 'git' 'clang')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags
}

prepare() (
    cd dmenu-rs
    git config advice.detachedHead false
)

build() (
    cd dmenu-rs
    git checkout $pkgver
    make PLUGINS="$PLUGINS"
)

package() (
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" PLUGINS="$PLUGINS" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
)