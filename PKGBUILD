# Maintainer: Dedicatus5457 <moe@shinka.top>
pkgname=uyou-todo-snap
pkgver=1.2.4
pkgrel=1
pkgdesc="This is a todo list with electron  (snap release)"
arch=('x86_64')
url="https://github.com/tonylu110/uyou-todo-electron"
license=('MIT')
depends=('gtk3' 'libsecret' 'nss')
makedepends=('squashfs-tools')
options=('!strip')
provides=('uyoutodo')
_snapid="00CQ2MvSr0Ex7zwdGhCYTa0ZLMw3H6hf"
_snaprev=158
source=('https://github.com/tonylu110/uyou-todo-electron/releases/download/1.2.4/uyoutodo_1.2.4_amd64.snap')
sha256sums=('9943af91076490b3dc3d45e4a947ac4a8da05ae47c9173c067c4a71423e634fa')

prepare() {
  echo "Extracting snap file..."
  unsquashfs -q -f -d "${srcdir}/${pkgname}" "uyoutodo_1.2.4_amd64.snap"
}

package() {
  # Install files
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

  # Desktop Entry
   sed -i 's|${SNAP}/meta/gui/icon.png|uyoutodo|g' \
	  "${pkgdir}/opt/${pkgname}/meta/gui/uyoutodo.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/uyoutodo.desktop" \
	  -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" \
	  "${pkgdir}/usr/share/pixmaps/uyoutodo.png"

  # Clean up unnecessary files
  rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

  # Symlink binary to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/uyoutodo" "${pkgdir}/usr/bin"

  # Install license
  # https://my.nordaccount.com/legal/terms-of-service/
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
