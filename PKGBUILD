# Maintainer: justforlxz <justforlxz@gmail.com>

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgbase=deepin-wallpapers-git
pkgname=(deepin-wallpapers-git deepin-community-wallpapers-git)
pkgver=1.7.7.r9.ga579405
pkgrel=1
epoch=1
pkgdesc='Deepin Wallpapers'
arch=('any')
license=('GPL')
url="https://github.com/linuxdeepin/deepin-wallpapers"
makedepends=('deepin-api-git')
groups=('deepin-git')
source=("$pkgname::git://github.com/linuxdeepin/deepin-wallpapers/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgbase
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgbase
  cp -a "$srcdir"/$pkgbase{,-community}
}

build() {
  cd "$srcdir"/$pkgbase
  for _pic in deepin/*; do
    make PICS=$_pic
  done

  cd "$srcdir"/$pkgbase-community
  for _pic in deepin-community/*; do
    make PICS=$_pic
  done
}

package_deepin-wallpapers-git() {
  pkgdesc='Default wallpapers for DDE'
  groups=('deepin-git')

  cd $pkgbase
  install -dm755 "$pkgdir"/usr/share/wallpapers
  cp -r deepin "$pkgdir"/usr/share/wallpapers/

  install -dm755 "$pkgdir"/var/cache
  cp -r image-blur "$pkgdir"/var/cache/

  # Suggested by upstream
  install -dm755 "$pkgdir"/usr/share/backgrounds/deepin
  ln -s ../../wallpapers/deepin/Hummingbird_by_Shu_Le.jpg "$pkgdir"/usr/share/backgrounds/deepin/desktop.jpg
  ln -s $(echo -n /usr/share/wallpapers/deepin/Hummingbird_by_Shu_Le.jpg | md5sum | cut -d " " -f 1).jpg \
        "$pkgdir"/var/cache/image-blur/$(echo -n /usr/share/backgrounds/deepin/desktop.jpg | md5sum | cut -d " " -f 1).jpg
}

package_deepin-community-wallpapers-git() {
  pkgdesc='Community wallpapers for DDE'
  groups=('deepin-git')

  cd $pkgbase-community
  install -dm755 "$pkgdir"/usr/share/wallpapers/deepin
  cp deepin-community/* "$pkgdir"/usr/share/wallpapers/deepin/

  install -dm755 "$pkgdir"/var/cache
  cp -r image-blur "$pkgdir"/var/cache/
}
