# Maintainer:

_module="karousel"
_pkgname="kwin-scripts-$_module"
pkgname="$_pkgname-git"
pkgver=0.17.r2.g28099b5
pkgrel=1
pkgdesc="KWin tiling script with scrolling"
url="https://github.com/peterfajdiga/karousel"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  'qt6-declarative'
  'knotifications'
)
makedepends=(
  'git'
  'nodejs'
  'typescript'
)

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  'kwin-karousel'
)

_pkgsrc="$_module"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  sed -e '/"compilerOptions":/a "rootDir": ".",' \
    -e '/"compilerOptions":/a "ignoreDeprecations": "6.0",' \
    -i "$_pkgsrc/src/tsconfig.json"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  tsc -p src/main --outFile package/contents/code/main.js
  tsc -p src/generators/config --outFile run-ts-tmp.js

  mkdir -p package/contents/config
  node run-ts-tmp.js > package/contents/config/main.xml
}

package() {
  cd "$_pkgsrc"
  mkdir -pm755 "$pkgdir/usr/share/kwin/scripts/karousel"
  cp -r package/* "$pkgdir/usr/share/kwin/scripts/karousel/"
}
