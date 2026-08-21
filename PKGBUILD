# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: Aaron Keesing <agkphysics at gmail dot com>
# Contributor: Siddhartha <dev@sdht.in>

_name="zotero"
pkgname="$_name-git"
pkgver=11.0.r16727.77a3a88
pkgrel=1
pkgdesc="A free, easy-to-use tool to help you collect, organize, cite, and share your research sources"
arch=('x86_64' 'i686')
url="https://www.zotero.org"
license=('AGPL-3.0-or-later')
provides=("$_name")
conflicts=("$_name")
depends=(
  'dbus-glib'
  'gtk3'
  'nss'
  'libxt'
  'alsa-lib'
)
makedepends=(
  'npm'
  'git'
  'zip'
  'unzip'
  'perl'
  'python>=3'
  'curl'
  'wget'
  'rsync'
  'nodejs>=18'
  'tar'
)
_gh="git+https://github.com/zotero"
source=(
  "zotero.desktop"
  "zotero-client::$_gh/zotero"
  "zotero-translators::$_gh/translators"
  "zotero-styles::$_gh/bundled-styles"
  "zotero-pdf-worker::$_gh/pdf-worker"
  "zotero-note-editor::$_gh/note-editor"
  "zotero-reader::$_gh/reader"
  "zotero-schema::$_gh/zotero-schema"
  "zotero-SingleFile::git+https://github.com/gildas-lormeau/SingleFile"
  "zotero-utilities::$_gh/utilities"
  "zotero-translate::$_gh/translate"
  "zotero-csl::git+https://github.com/citation-style-language/locales"
  "zotero-libreoffice-integration::$_gh/zotero-libreoffice-integration"
  "zotero-pdf-js::$_gh/pdf.js"
  "zotero-epub-js::$_gh/epub.js"
  "zotero-sdt::$_gh/structured-document-text"
  "disable-updater.patch"
)
sha256sums=(
  '5bb36692ea4b3a6a2b9b1986eb13961e80beab498e27af30bbc0cbda555f9222'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'dc1894ac2e1520c3dae8e9cd5e09608f4bb3298bdede2891a77118187edffa9d'
)

pkgver() {
  cd zotero-client
  _tag="$(cat version | sed 's/.SOURCE//')"
  printf "%s.r%s.%s" "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd zotero-client

  patch -N -p1 < "$srcdir/disable-updater.patch"
  
  npm i --legacy-peer-deps

  git submodule init
  git submodule deinit --force app/modules/zotero-word-for-{mac,windows}-integration
  git config submodule.translators.url "$srcdir/zotero-translators"
  git config submodule.styles.url "$srcdir/zotero-styles"
  git config submodule.pdf-worker.url "$srcdir/zotero-pdf-worker"
  git config submodule.note-editor.url "$srcdir/zotero-note-editor"
  git config submodule.pdf-reader.url "$srcdir/zotero-reader"
  git config submodule.resource/schema/global.url "$srcdir/zotero-schema"
  git config submodule.resource/SingleFile.url "$srcdir/zotero-SingleFile"
  git config submodule.chrome/content/zotero/xpcom/utilities.url "$srcdir/zotero-utilities"
  git config submodule.chrome/content/zotero/xpcom/translate.url "$srcdir/zotero-translate"
  git config submodule.chrome/content/zotero/locale/csl.url "$srcdir/zotero-csl"
  git config submodule.app/modules/zotero-libreoffice-integration.url "$srcdir/zotero-libreoffice-integration"
  git -c protocol.file.allow=always submodule update

  cd "chrome/content/zotero/xpcom/utilities"
  git config submodule.resource/schema/global.url "$srcdir/zotero-schema"
  git -c protocol.file.allow=always submodule update

  cd "../translate"
  git config submodule.modules/utilities.url "$srcdir/zotero-utilities"
  git -c protocol.file.allow=always submodule update

  cd "modules/utilities"
  git config submodule.resource/schema/global.url "$srcdir/zotero-schema"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/zotero-client/reader"
  git submodule init
  git config submodule.pdfjs/pdf.js.url "$srcdir/zotero-pdf-js"
  git config submodule.epubjs/epub.js.url "$srcdir/zotero-epub-js"
  git config submodule.structured-document-text.url "$srcdir/zotero-sdt"
  git -c protocol.file.allow=always submodule update

  cd "../document-worker"
  git submodule init
  git config submodule.pdf.js.url "$srcdir/zotero-pdf-js"
  git config submodule.structured-document-text.url "$srcdir/zotero-sdt"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd zotero-client
  _NODE_OPTIONS="--openssl-legacy-provider"
  if (( $(vercmp "$(node --version)" "25.2.0") >= 0 )); then
    _NODE_OPTIONS+=" --no-experimental-webstorage"
  fi
  NODE_OPTIONS="$_NODE_OPTIONS" npm run build
  app/scripts/dir_build
}

package() {
  install -dm0755 "$pkgdir"/usr/{bin,lib/zotero}
  cp -r "zotero-client/app/staging/Zotero_linux-$CARCH"/* "$pkgdir/usr/lib/zotero"
  ln -s /usr/lib/zotero/zotero "$pkgdir/usr/bin/zotero"
  install -Dm0644 zotero.desktop -t "$pkgdir/usr/share/applications"
  install -Dm0644 zotero-client/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"

  # Copy zotero icons to a standard location
  for _s in 32 64 128; do
    install -Dm0644 "$pkgdir/usr/lib/zotero/icons/icon$_s.png" "$pkgdir/usr/share/icons/hicolor/${_s}x${_s}/apps/zotero.png"
  done
  install -Dm0644 "$pkgdir/usr/lib/zotero/icons/symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/zotero.svg"

  # Close shell when launching
  sed -i -r 's:^("\$CALLDIR/zotero-bin" -app "\$CALLDIR/application.ini" "\$@"):exec \1:' "$pkgdir/usr/lib/zotero/zotero"
}
# vim: ts=2 sw=2 et:
