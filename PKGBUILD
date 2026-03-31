pkgname=rocket-mouse-git
_pkgname=rocket-mouse
_electron_pkg=electron39
pkgver=r50.c4bcdb0
pkgrel=1
pkgdesc='Space-themed activity manager and mouse jiggler'
arch=('x86_64')
url='https://github.com/willakins/rocket-mouse'
license=('ISC')
options=('!debug')
depends=("$_electron_pkg" 'libxtst')
makedepends=('cmake' 'git' 'npm' 'png++')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "${_pkgname}::git+${url}.git#branch=main"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)
sha256sums=(
  'SKIP'
  'c3ab16e0459b5ca8e6af712cddad3295fcb6b344d7acc5429ae8c6dd831b1e21'
  '6877f5191fd4e46a56fc5b126f553e496ee87c0d14291b994cdec779589e2930'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  local electron_version
  electron_version="$(< "/usr/lib/${_electron_pkg}/version")"

  npm pkg set "devDependencies.electron=${electron_version}"
}

build() {
  cd "$srcdir/$_pkgname"

  local npm_arch
  case "$CARCH" in
    x86_64)
      npm_arch='x64'
      ;;
    aarch64)
      npm_arch='arm64'
      ;;
    *)
      printf 'Unsupported architecture: %s\n' "$CARCH" >&2
      return 1
      ;;
  esac

  export HOME="$srcdir/.home"
  export npm_config_cache="$srcdir/npm-cache"
  npm_config_target="$(< "/usr/lib/${_electron_pkg}/version")" \
  npm_config_arch="$npm_arch" \
  npm_config_target_arch="$npm_arch" \
  npm_config_disturl='https://electronjs.org/headers' \
  npm_config_runtime='electron' \
  npm_config_build_from_source='true' \
    npm install --no-audit --no-fund
  npm run build
  npm prune --omit=dev
}

package() {
  cd "$srcdir/$_pkgname"

  local appdir="$pkgdir/usr/lib/$_pkgname"

  install -dm755 "$appdir"
  cp -r main.js package.json src node_modules "$appdir/"

  install -Dm755 \
    "$srcdir/${_pkgname}.sh" \
    "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 \
    "$srcdir/${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 \
    src/renderer/assets/icon.png \
    "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
