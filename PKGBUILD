# Maintainer: Alfredo Palhares <alfredo at palhares dot me>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

# Please contribute to:
# https://github.com/alfredopalhares/arch-pkgbuilds

pkgname=excalidraw-desktop-git
pkgver=r162.2e70a8c
pkgrel=1
pkgdesc="Excalidraw Desktop - Git Version"
arch=('x86_64' 'i686')
dependes=('nodejs' 'electron')
makedepends=('git' 'yarn' 'asar' )
url=""
license=('MIT')
source=("excalidraw.sh" "excalidraw.desktop" "git+https://github.com/excalidraw/excalidraw-desktop.git")
sha256sums=('a1def7fb363218763bc21df048eeb79d4b3140c7d70394e94e7d28e6363ac9ee'
            '2ea68cdc03344fb8dbdda8f04242f931c89ce90b4715a684e7b3e89bbe2d4fbf'
            'SKIP')

pkgver() {
  cd "${srcdir}/excalidraw-desktop"
  # Version is a count of the commits and the HEAD
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  # Remove husky (git hooks) from dependencies
  cd "${srcdir}/excalidraw-desktop"

  export LANG=en_US.utf8

  yarn install
  yarn build:app
  rm dist/excalidraw.asar


}

package() {

  cd "${srcdir}/excalidraw-desktop"
  install -d "${pkgdir}/usr/share/excalidraw-desktop"
  cp -R dist/* "${pkgdir}/usr/share/excalidraw-desktop/"
  cp -R build/* "${pkgdir}/usr/share/excalidraw-desktop/"

  install -Dm755 "${srcdir}/excalidraw.sh" -T "${pkgdir}/usr/bin/excalidraw"
  install -Dm644 "${srcdir}/excalidraw.desktop" -t "${pkgdir}/usr/share/applications/"

}
