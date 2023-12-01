# Maintainer: Giovanni Harting

pkgname=zwave-js-ui
pkgver=9.3.1
pkgrel=1
epoch=1
pkgdesc="Full featured Z-Wave Control Panel UI and MQTT gateway"
arch=('any')
url="https://github.com/zwave-js/zwave-js-ui"
license=('MIT')
depends=(nodejs)
replaces=(zwavejs2mqtt)
makedepends=(yarn node-gyp)
backup=("etc/zwave-js-ui/app.ts")
install=zwave-js-ui.install
source=("https://github.com/zwave-js/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles"
	"$pkgname.service"
	"$pkgname.install")
b2sums=('6c26a1cf4c7a13db99879a6a87c21493317da5a8cc5b8a53e9537ea835399696fe31fceeb1080bbf329ef3f3e8d7ba0f934894e15ca601f505ebfbeaceed561a'
        '20fe5b3391e8ef54b7047c082b183e492bea4b6b9dac11ebfa69e98ca6f6889cfde7a55897f6a6a8d91a2753a3a316cde8c4802d4e23a65bf421eeac8a2725fe'
        'e2d3de5e1446f5b1f7c97581a0fa66022050993399d23afba63079ba6c690f995708dffca442170da44abc526103143fbecb94e95a9b7d85fcbf37b3fc49db5e'
        '8b2c0b4e3659297e311f7f3ae69d337cddfc6dc55a5edc4f39bf8a26bc728cfb7ca5fe56d89e253d17d74646336f53d5cacac5b18cc94f2be8fd29ff900615de'
        '81d0797c68818d8444181ff9d81646721d10dc44774e1deb564a172f118e7070236f7fca5cefca9830636f739aec479e3cf0c18b536e8a72eccd88f1444be10f')

build() {
  cd "$pkgname-$pkgver"
  yarn install
  yarn run build
}

package() {
  cd "$pkgname-$pkgver"

  # taken from hedgedoc in [community], thanks Mr. van der Waa :)
  # removing unneeded files and directories
  find node_modules -type f \
          \( \
         -iname '*Makefile*' -o \
         -iname '*.cache' -o \
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
         -iname '*.Dockerfile*' -o \
         -iname '*.tm_properties' -o \
         -iname '*.wotanrc.yaml' -o \
         -iname '*tsconfig.json' -o \
         -iname '*.py' -o \
         -iname '*yarn.lock' \
         \) \
         -delete

  find node_modules -type d \
          \( \
         -iwholename '*.github' -o \
         -iwholename '*.tscache' -o \
         -iwholename '*/man' -o \
         -iwholename '*/scripts' -o \
         -iwholename '*/git-hooks' -o \
         -iwholename '*/win32-ia32' -o \
         -iwholename '*/win32-x64' -o \
         -iwholename '*/__pycache__' -o \
         -iwholename '*/darwin-x64' \
         \) \
         -exec rm -rvf {} +

  install -d "$pkgdir"/usr/share/webapps/$pkgname/dist/ "$pkgdir"/etc/$pkgname/ "$pkgdir"/usr/share/webapps/$pkgname/snippets
  cp -r {node_modules,bin,lib,server,app.ts} "$pkgdir"/usr/share/webapps/$pkgname
  cp -r dist/* "$pkgdir"/usr/share/webapps/$pkgname/dist/
  cp -r snippets/* "$pkgdir"/usr/share/webapps/$pkgname/snippets
  cp -r config/* "$pkgdir"/etc/$pkgname/
  ln -s /etc/$pkgname/ "$pkgdir"/usr/share/webapps/$pkgname/config
  ln -s /var/lib/$pkgname "$pkgdir"/usr/share/webapps/$pkgname/store
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "${srcdir}"/$pkgname.sysusers "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
}
