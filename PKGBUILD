# Maintainer: Devin Pohl <pohl.devin@gmail.com>

# -------------------------------------------------------
#                        PLUGINS
# -------------------------------------------------------
# If you'd like to compile in plugins, add the names here
# For a list of available plugins, see the git repo
#   or run `make plugins` in the cloned repo
PLUGINS=""


# -------------------------------------------------------
#                        DEPENDS
# -------------------------------------------------------
# If you want a super-minimal system, some of the following
# dependencies can be disabled
# Note: They are double-checked during compilation
# Always required:
depends=('libxft')
# Required for plugins which copy to clip perminantly
#   this includes: calc, spellcheck
depends+=('xclip')
# Requred for the spellcheck plugin
depends+=('aspell')
# Required for Xinerama (requires editing config.mk to disable)
depends+=('libxinerama')

makedepends=('rust' 'git' 'clang' 'sh' 'make' 'diffutils')

_pkgname=dmenu
_pkgbase=$_pkgname-rs
pkgname=$_pkgbase-git
pkgver=5.5.0.r328.3f07479
pkgrel=1
pkgdesc="The development branch of dmenu-rs. Likely has unstable features."
arch=('i686' 'x86_64')
url="https://github.com/Shizcow/dmenu-rs"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgbase}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  # first get the version number
  cat config.mk | grep "VERSION" | grep -Po '(\d+\.)?(\d+\.)?(\*|\d+)' | tr -d '\n'
  # then get the commit hash from development branch
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() (
  cd $_pkgbase
  git config pull.ff only
  git checkout develop > /dev/null
  git pull
)

build() (
  cd $_pkgbase
  make PLUGINS="$PLUGINS"
)

package() (
  cd $_pkgbase
  make PREFIX=/usr DESTDIR="$pkgdir" PLUGINS="$PLUGINS" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
)