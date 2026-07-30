# Maintainer:
# Contributor: Jan Buchar <Teyras@gmail.com>

_gitname="krohnkite"
_pkgname="kwin-scripts-$_gitname"
pkgname="$_pkgname-git"
pkgver=0.9.9.2.r97.g7b53860
pkgrel=1
pkgdesc="A dynamic tiling extension for KWin"
url="https://codeberg.org/anametologin/Krohnkite"
license=('MIT')
arch=('any')

makedepends=(
  'git'
  'typescript'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="codeberg.krohnkite"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  sed -e '/"compilerOptions":/a "rootDir": "src",' \
    -e '/"compilerOptions":/a "ignoreDeprecations": "6.0",' \
    -i "$_pkgsrc/tsconfig.json"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  mkdir -p pkg

  # krohnkite.js
  tsc
  install -Dm644 krohnkite.js pkg/contents/code/script.js

  # metadata.json
  sed -E -e 's&\$VER&'${pkgver}'&' \
    -e 's&\$REV&'${pkgver}'&' \
    res/metadata.json > pkg/metadata.json

  # config
  install -Dm644 res/config.xml pkg/contents/config/main.xml

  # other files
  install -Dm644 res/*.js -t pkg/contents/code/
  install -Dm644 res/*.{qml,ui} -t pkg/contents/ui/
}

package() {
  depends+=(
    'kwin'
  )

  mkdir -pm755 "$pkgdir/usr/share/kwin/scripts/$_gitname"
  cp -r "$_pkgsrc"/pkg/. "$pkgdir/usr/share/kwin/scripts/$_gitname/"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
