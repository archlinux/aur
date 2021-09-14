# Maintainer: Siddhartha <dev@sdht.in>

pkgname=zotero-git
pkgver=r11712.20210914.f0a8c9ada
pkgrel=1
pkgdesc='Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources.'
arch=('x86_64')
url='https://www.zotero.org'
license=('AGPL3')
depends=('dbus-glib' 'gtk3' 'nss' 'libxt')
makedepends=('npm' 'wget' 'zip' 'unzip' 'python2' 'python' 'rsync' 'git')
conflicts=('zotero')
provides=('zotero')
_src_dir_1=zotero-client
_src_dir_2=zotero-build
_src_dir_3=zotero-standalone-build
source=(zotero.desktop
    "${_src_dir_1}::git+https://github.com/zotero/zotero"
    "${_src_dir_2}::git+https://github.com/zotero/zotero-build"
    "${_src_dir_3}::git+https://github.com/zotero/zotero-standalone-build")
sha256sums=('2e700ebe97d332a894be80d232b037b0117d84b38c5fa99dffc727cb10918228'
            'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd ${_src_dir_1}
    printf "r%s.%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --date=format:"%Y%m%d" --format="%ad")" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_src_dir_1}
    git submodule init && git submodule update
    cd ../${_src_dir_2}
    git submodule init && git submodule update
    cd ../${_src_dir_3}
    git submodule init && git submodule update

    cd ../${_src_dir_1}
    npm i
    npm run build
    
    cd ../${_src_dir_3}
    ./fetch_xulrunner.sh -p l
    ./fetch_pdftools
    scripts/dir_build
}

package() {
    local builddir="${_src_dir_3}"/staging/Zotero_linux-x86_64
    install -dDm755 "$pkgdir"/usr/{bin,lib/zotero}
    mv "$builddir"/* "$pkgdir"/usr/lib/zotero
    ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
    install -Dm644 "$srcdir"/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop
    # Copy zotero icons to a standard location
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png
    # Copy license
    install -Dm644 "${_src_dir_3}"/COPYING "$pkgdir"/usr/share/licenses/zotero/LICENSE
    # Disable APP update
    sed -i '/pref("app.update.enabled", true);/c\pref("app.update.enabled", false);' "$pkgdir"/usr/lib/zotero/defaults/preferences/prefs.js
}
