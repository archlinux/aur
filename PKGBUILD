# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=luabundler
pkgver=1.2.3
pkgrel=1
pkgdesc='CLI tool for bundling several Lua files into a single file'
arch=('any')
url='https://github.com/Benjamin-Dobell/luabundler'
license=('MIT')
groups=('lua')
depends=('nodejs')
makedepends=('npm')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Benjamin-Dobell/luabundler/archive/v${pkgver}.tar.gz"
)

sha512sums=('b61d918c8b31d18852ea73adb1bf4bff3c8e9b8b379f1be2d366e2eafe421ace5cf02e480fd0a0fca466df78e081a76267358a1d5f9d83a670b4ca51723c4737')

build() {
  cd "${pkgname}-${pkgver}"
  /usr/bin/npm install --cache "$srcdir"/npm-cache
  /usr/bin/npm run build
}

package() {
  cd "${pkgname}-${pkgver}"
  # removing unneeded files and directories
  find node_modules -type f \
          \( \
         -iname '*Makefile*' -o \
         -iname '*appveyor.yml' -o \
         -iname '*.babelrc' -o \
         -iname '*.bak' -o \
         -iname '*bower.json' -o \
         -iname '*.c' -o \
         -iname '*.cc' -o \
         -iname '*.cpp' -o \
         -iname '*.md' -o \
         -iname '*.markdown' -o \
         -iname '*.rst' -o \
         -iname '*.nycrc' -o \
         -iname '*.npmignore' -o \
         -iname '*.editorconfig' -o \
         -iname '*.el' -o \
         -iname '*.eslintignore' -o \
         -iname '*.eslintrc*' -o \
         -iname '*.fimbullinter.yaml' -o \
         -iname '*.gitattributes' -o \
         -iname '*.gitmodules' -o \
         -iname '*.h' -o \
         -iname '*.html' -o \
         -iname '*.jshintrc' -o \
         -iname '*.jscs.json' -o \
         -iname '*.log' -o \
         -iname '*logo.svg' -o \
         -iname '*.nvmrc' -o \
         -iname '*.o' -o \
         -iname '*package-lock.json' -o \
         -iname '*.travis.yml' -o \
         -iname '*.prettierrc' -o \
         -iname '*.sh' -o \
         -iname '*.tags*' -o \
         -iname '*.tm_properties' -o \
         -iname '*.wotanrc.yaml' -o \
         -iname '*tsconfig.json' -o \
         -iname '*yarn.lock' \
         \) \
         -delete
  find node_modules -type d \
          \( \
         -iwholename '*.github' -o \
         -iwholename '*.tscache' -o \
         -iwholename '*/man' -o \
         -iwholename '*/test' -o \
         -iwholename '*/scripts' -o \
         -iwholename '*/git-hooks' \
         \) \
         -exec rm -rvf {} +
  find node_modules -empty -type d -delete
  install -vdm 755 "$pkgdir/usr/lib/node_modules/$pkgname/"
  # copy vendored modules, lib and entry point
  cp -av {bin,lib,node_modules,package.json} "$pkgdir/usr/lib/node_modules/$pkgname/"
  # symlink to entry point
  mkdir -p "$pkgdir/usr/bin/"
  ln -s ../lib/node_modules/$pkgname/bin/run \
    "$pkgdir/usr/bin/luabundler"
  # docs
  install -vDm 644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
