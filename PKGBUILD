# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=modrinth-enhanced-bin
pkgver=0.21.11
pkgrel=1
pkgdesc="Modrinth App without ads or telemetry, with offline and Ely.by accounts and Linux fixes (upstream binary)"
arch=('x86_64')
url="https://github.com/Felitendo/Modrinth-Enhanced"
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libdrm' 'libgcc' 'libsoup3' 'webkit2gtk-4.1'
         # loaded by Minecraft, not by the launcher
         'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm')
optdepends=('xorg-xrandr: for older Minecraft versions')
provides=('modrinth-enhanced')
conflicts=('modrinth-enhanced')
options=('!strip' '!debug')
# A new revision of the patches on the same Modrinth App release is tagged
# v0.21.2-2, which pkgver spells 0.21.2.r2; see pkg.sh.
_tag="v0.21.11"
_asset="Modrinth.Enhanced_0.21.11_amd64.deb"
# With the NVIDIA driver WebKitGTK paces the app with a 60 fps timer whatever
# the monitor's refresh rate. vblank-shim.c, preloaded by modrinth-enhanced.sh,
# paces it at the monitor's rate instead and keeps the app on X11, the only
# place that works; it is not part of upstream's release.
source=("${pkgname}-${pkgver}.deb::https://github.com/Felitendo/Modrinth-Enhanced/releases/download/${_tag}/${_asset}"
        "vblank-shim.c"
        "modrinth-enhanced.sh")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('473684765f64f3c4e1db2929ed0c18d82942c355c2e3286e9d18b96343eb8e26' '0190921b8ff2fb1deec3209cba71c01541ca1f013e3ba41680f1636e185fd455' 'b24872f82645c52ee4804599cd678d138876fb193c754403fa9c5cf92bd745b9')

build() {
  # GLib for its headers only: the shim looks GTK and GLib up at run time
  gcc $CPPFLAGS $CFLAGS $LDFLAGS -shared -fPIC -o libwebkit-vblank-shim.so vblank-shim.c \
    $(pkg-config --cflags glib-2.0) $(pkg-config --cflags --libs libdrm)
}

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" usr

  # the binary moves behind the script that preloads the shim
  install -d "$pkgdir/usr/lib/modrinth-enhanced"
  mv "$pkgdir/usr/bin/ModrinthEnhanced" "$pkgdir/usr/lib/modrinth-enhanced/"
  install -Dm755 libwebkit-vblank-shim.so -t "$pkgdir/usr/lib/modrinth-enhanced/"
  install -Dm755 modrinth-enhanced.sh "$pkgdir/usr/bin/ModrinthEnhanced"
  ln -s ModrinthEnhanced "$pkgdir/usr/bin/modrinth-enhanced"
}
