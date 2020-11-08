# Maintainer: DingYuan Zhang <justforlxz@gmail.com>

pkgbase=deepin-anything-git
pkgname=(deepin-anything-git deepin-anything-dkms-git)
_pkgname=deepin-anything
pkgver=0.1.0.r3.g344c3f7
_extramodules=extramodules-ARCH
pkgrel=1
pkgdesc="Deepin Anything file search tool"
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-anything"
license=('GPL3')
makedepends=('git' 'dtkcore-git' 'udisks2-qt5')
source=("$_pkgname::git://github.com/linuxdeepin/deepin-anything"
        '0001-linux-5.6.patch'
        deepin-anything-server.sysusers)
sha512sums=('SKIP'
            '5ddbd2d968bc5b01dbc99648cec81ea072675d7fe7198835649d5b581997945d32bd842dd7ebf60185aa84722b94575ac7aeb5e4616945e22fae53272907305b'
            '0ff6a6de1fbfb0c33eaac511b989da321a9e43ece92708af88aee34ad1a05e55572713b1290bc2705d70b91dc7bec4fb4abd3dc664a0abe01de27d88bd9e9c85')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  patch -Np1 < ../0001-linux-5.6.patch
  sed -i 's|^systemd_service.path.*|systemd_service.path = /usr/lib/systemd/system|' server/monitor/src/src.pro server/tool/tool.pro
}

build() {
	cd $_pkgname
  make VERSION=$pkgver
}

package_deepin-anything-dkms-git() {
  depends=('dkms')
  provides=('DEEPIN-ANYTHING-MODULE' 'deepin-anything')
  conflicts=('DEEPIN-ANYTHING-MODULE' 'deepin-anything')

  cd $_pkgname
  install -dm 755 "$pkgdir"/usr/src
  cp -r kernelmod "$pkgdir"/usr/src/deepin-anything-$pkgver
  install -m644 debian/deepin-anything-dkms.dkms "$pkgdir"/usr/src/deepin-anything-$pkgver/dkms.conf
}

package_deepin-anything-git() {
  depends=('DEEPIN-ANYTHING-MODULE' 'dtkcore-git' 'udisks2-qt5')
  groups=('deepin-git')

  cd $_pkgname
  make VERSION=$pkgver DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/src

  mv "$pkgdir"/etc/dbus-1/system.d "$pkgdir"/usr/share/dbus-1/system.d

  install -Dm644 ../deepin-anything-server.sysusers "$pkgdir/usr/lib/sysusers.d/deepin-anything-server.conf"
}
