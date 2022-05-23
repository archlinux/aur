# Maintainer: cruggs_mutt <aur dot 125rc at aleeas dot com>
pkgname=yam-git
pkgver=2.6.3.r19.gc9cbf48
pkgrel=1
pkgdesc="Game manager for F95zone"
arch=('x86_64')
url="https://github.com/MillenniumEarl/YAM"
license=('MIT')
source=("git+https://github.com/MillenniumEarl/YAM.git")
depends=('npm')
conflicts=('yam')
provides=('yam-git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/YAM"
  _tag="$(git describe --tags --match 'v*' --abbrev=0 $(git rev-list --tags) --always | head -n 1 | sed 's/v//')"
  _numcommits="$(git rev-list  `git rev-list --tags --no-walk --max-count=1`..HEAD --count)"
  _hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

prepare() {
  cd "${srcdir}/YAM"
  npm install
}

build() {
  cd "${srcdir}/YAM"
  npm run dist:linux
  cd dist
  ./YAM-*.AppImage --appimage-extract &>/dev/null
}

package() {
  cd "${srcdir}/YAM/dist"
# directories
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/yam/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/

# icon
  install -m644 squashfs-root/yam.png "$pkgdir"/usr/share/icons/

# .desktop file
  sed -i 's/Exec=AppRun/Exec=yam/' squashfs-root/yam.desktop
  install -m644 squashfs-root/yam.desktop "$pkgdir"/usr/share/applications

# application
  chmod 755 -R squashfs-root
  mv squashfs-root/* "$pkgdir"/usr/lib/yam/
  ln -s /usr/lib/yam/yam "$pkgdir"/usr/bin/yam
}
