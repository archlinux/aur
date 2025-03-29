# Maintainer:
# Contributor: slomomojo <slomomojo@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

## links
# https://www.wings3d.com
# https://github.com/dgud/wings

_pkgname="wings3d"
pkgname="$_pkgname"
pkgver=2.4.1
pkgrel=3
pkgdesc='3D modeler using the winged edge data structure'
url="https://www.wings3d.com/"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'erlang'
  'erlang-cl'
)
makedepends=(
  'git'
)
optdepends=(
  'povray: render scenes with POV-Ray'
)

_pkgsrc="wings-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"https://github.com/dgud/wings/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('2a1c0dd340a994e81710b739a12db272b6aac2585127a5cc5f9eba2ed225774f')

prepare() {
  sed -e "/desktop-id/s&com.wings3d.WINGS.desktop&$pkgname.desktop&" -i "$_pkgsrc/unix/wings.appdata.xml"
  printf '%s' "v$pkgver" > "$_pkgsrc/version"
}

build() {
  export ERL_LIBS="$srcdir"
  make -C "$_pkgsrc" unix
}

package() {
  cd "$_pkgsrc"
  install -Dm644 "icons/wings_icon_379x379.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 unix/wings.appdata.xml "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"

  cd build
  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  cp --reflink=auto -a wings-*-linux/lib/"$_pkgsrc"/* "$pkgdir/usr/lib/$_pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash
GDK_BACKEND=x11 exec /usr/bin/erl -noinput -smp \
  -pa /usr/lib/wings3d/ebin \
  -run wings_start start_halt "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Wings 3D
GenericName=3D Modeler
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
StartupNotify=false
Categories=Graphics;3DGraphics;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
