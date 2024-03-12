# Maintainer:
# Contributor: slomomojo <slomomojo@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

_pkgname="wings3d"
pkgname="$_pkgname"
pkgver=2.3
pkgrel=2
pkgdesc='3D modeler using the winged edge data structure'
url='http://www.wings3d.com/' # https is not available
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  erlang
  erlang-cl
)
makedepends=(
  gendesk
  git
)
optdepends=(
  'povray: render scenes with POV-Ray'
)

_pkgsrc="${_pkgname%3d}-$pkgver"
_pkgext="tar.bz2"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"https://sourceforge.net/projects/wings/files/wings/$pkgver/wings-$pkgver.$_pkgext"
)
sha256sums=(
  '7447fa88f6cf08b98caaf5a3be0111395002656f120ac5ca8b74d696273e6f0b'
)

prepare() {
  cat > "$_pkgname.sh" <<'END'
#!/usr/bin/env bash
GDK_BACKEND=x11 exec /usr/bin/erl -noinput -smp \
  -pa /usr/lib/wings3d/ebin \
  -run wings_start start_halt "$@"
END

  local _gendesk_options=(
    -f
    -n
    --name 'Wings 3D'
    --pkgname "$pkgname"
    --pkgdesc "$pkgdesc"
    --genericname '3D Modeler'
    --categories 'Graphics;3DGraphics'
  )

  gendesk "${_gendesk_options[@]}"

  sed -e "/desktop-id/ s/com.wings3d.WINGS.desktop/$pkgname.desktop/" -i "$_pkgsrc/unix/wings.appdata.xml"

  sed -e '/material[0-9]/ s/""//g' -i "$_pkgsrc/plugins_src/import_export/wpc_yafaray.erl"
}

build() {
  export ERL_LIBS="$srcdir"
  make -C "$_pkgsrc" unix
}

package() {
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

  cd "$_pkgsrc"
  install -Dm644 "icons/wings_icon_379x379.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 unix/wings.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"

  cd build
  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  cp --reflink=auto -r "$_pkgsrc-linux/lib/$_pkgsrc"/* "$pkgdir/usr/lib/$_pkgname/"

  # fix permissions
  chmod -R u=rwX,go=rX,go-w "$pkgdir"
}
