# Maintainer: Giovanni Harting

pkgname=zwave-js-ui
pkgver=8.0.2
pkgrel=4
pkgdesc="Full featured Z-Wave Control Panel UI and MQTT gateway"
arch=('any')
url="https://github.com/zwave-js/zwave-js-ui"
license=('MIT')
depends=(nodejs)
conflicts=(zwavejs2mqtt)
makedepends=(yarn node-gyp)
backup=("etc/zwave-js-ui/app.ts")
install=zwave-js-ui.install
source=("https://github.com/zwave-js/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles"
	"$pkgname.service"
	"$pkgname.install")
b2sums=('b4860e6f560b798a3ebe6f0dde849d488ddff3082eef019995874d7cd1a9e9c4670a1e90c50e3473ee85395c312b5d0a80d446033c1d5f6d981b732bde462a2e'
        '20fe5b3391e8ef54b7047c082b183e492bea4b6b9dac11ebfa69e98ca6f6889cfde7a55897f6a6a8d91a2753a3a316cde8c4802d4e23a65bf421eeac8a2725fe'
        'e2d3de5e1446f5b1f7c97581a0fa66022050993399d23afba63079ba6c690f995708dffca442170da44abc526103143fbecb94e95a9b7d85fcbf37b3fc49db5e'
        '8b2c0b4e3659297e311f7f3ae69d337cddfc6dc55a5edc4f39bf8a26bc728cfb7ca5fe56d89e253d17d74646336f53d5cacac5b18cc94f2be8fd29ff900615de'
        '834801b8e862c8962357865ae5403e9440be142e21f2560e27c59dc28f663d7d7e3111c324f1a3b133e85debfe82cc2ea7fbe9c1e4b45d3bd829709b503eae89')

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

  install -d "$pkgdir"/usr/share/webapps/$pkgname/dist/static "$pkgdir"/etc/$pkgname/ "$pkgdir"/usr/share/webapps/$pkgname/snippets
  cp -r {node_modules,bin,lib,server,app.ts,views} "$pkgdir"/usr/share/webapps/$pkgname
  cp -r dist/static/* "$pkgdir"/usr/share/webapps/$pkgname/dist/static
  cp -r snippets/* "$pkgdir"/usr/share/webapps/$pkgname/snippets
  cp -r config/* "$pkgdir"/etc/$pkgname/
  ln -s /etc/$pkgname/ "$pkgdir"/usr/share/webapps/$pkgname/config
  ln -s /var/lib/$pkgname "$pkgdir"/usr/share/webapps/$pkgname/store
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "${srcdir}"/$pkgname.sysusers "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 "${srcdir}"/$pkgname.service -t "$pkgdir"/usr/lib/systemd/system/
}
