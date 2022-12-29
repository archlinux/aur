# Maintainer: DingYuan Zhang <justforlxz@gmail.com>

pkgbase=deepin-anything-git
pkgname=(deepin-anything-git deepin-anything-dkms-git)
pkgver=6.0.3.r2.g68428b4
_extramodules=extramodules-ARCH
pkgrel=2
pkgdesc="Deepin Anything file search tool"
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/deepin-anything"
license=('GPL3')
makedepends=('git' 'dtkcore-git' 'udisks2-qt5')
source=("$pkgbase::git+https://github.com/linuxdeepin/deepin-anything"
        deepin-anything-server.sysusers)
sha512sums=('SKIP'
            '0ff6a6de1fbfb0c33eaac511b989da321a9e43ece92708af88aee34ad1a05e55572713b1290bc2705d70b91dc7bec4fb4abd3dc664a0abe01de27d88bd9e9c85')

pkgver() {
    cd $pkgbase
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgbase
  make VERSION=$pkgver
}

package_deepin-anything-dkms-git() {
  depends=('dkms')
  groups=('deepin-git')
  provides=('DEEPIN-ANYTHING-MODULE' 'deepin-anything-dkms')
  conflicts=('DEEPIN-ANYTHING-MODULE' 'deepin-anything-dkms')

  cd $pkgbase
  install -dm 755 "$pkgdir"/usr/src
  cp -r src/kernelmod "$pkgdir"/usr/src/deepin-anything-$pkgver
  install -m644 debian/deepin-anything-dkms.dkms "$pkgdir"/usr/src/deepin-anything-$pkgver/dkms.conf
}

package_deepin-anything-git() {
  depends=('DEEPIN-ANYTHING-MODULE' 'dtkcore-git' 'udisks2-qt5')
  groups=('deepin-git')
  provides=('deepin-anything')
  conflicts=('deepin-anything')

  cd $pkgbase
  make VERSION=$pkgver DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/src

  mv "$pkgdir"/etc/dbus-1/system.d "$pkgdir"/usr/share/dbus-1/system.d

  install -Dm644 ../deepin-anything-server.sysusers "$pkgdir/usr/lib/sysusers.d/deepin-anything-server.conf"
}
