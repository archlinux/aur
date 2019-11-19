# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=3.9.7
pkgrel=1
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
optdepends=('alsa-utils: sound notification support'
            'libnotify: notify support')
appimage=$pkgname-$pkgver-x86_64.AppImage
source=(
https://mikutter.hachune.net/bin/$appimage
mikutter.desktop
config.patch
)

prepare() {
  chmod +x "$srcdir/$appimage"
  ./$appimage --appimage-extract

  find squashfs-root -type d -exec chmod 755 {} \;
  cd squashfs-root/usr/share/mikutter
  patch -p1 < "$srcdir/config.patch"
}

package() {
  mkdir "$pkgdir/opt"
  cp -r "$srcdir/squashfs-root" "$pkgdir/opt/mikutter"

  mkdir -p "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mikutter"
#!/bin/sh
/opt/mikutter/AppRun
EOF
  chmod a+x "$pkgdir/usr/bin/mikutter"

  mkdir -p $pkgdir/usr/share/applications
  cp "$srcdir/mikutter.desktop" "$pkgdir/usr/share/applications"
  chmod +x $pkgdir/usr/share/applications/mikutter.desktop
}

md5sums=('8c812aacf376925901c29b0ae1c34d81'
         '82f7f4d37380871d3fde314fe51cf406'
         '54df9d2f1f19d3c27034cc1a97d1bc67')
