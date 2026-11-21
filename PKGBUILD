pkgname=jacartauc
pkgver=3.3.6.3921
pkgrel=1
pkgdesc="JaCarta Unified Client"
arch=("x86_64")
url="https://www.aladdin-rd.ru/support/downloads/jacarta/"
license=("LicenseRef-Proprietary")

depends=(
  at-spi2-core
  bash
  cairo
  ccid
  dbus
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libdrm
  libx11
  libxcb
  libxext
  libxkbcommon
  libxkbcommon-x11
  libxrender
  pango
  pcsclite
  qt5-wayland
  systemd-libs
  zlib
)

makedepends=(patchelf)

# the vendor directory carries a 3-part version, the file name a 4-part one
source=("https://www.aladdin-rd.ru/upload/downloads/JaCarta_UC/jacarta-${pkgver%.*}/lunix/distributions/jacartauc_${pkgver}_rpm_x64.tgz")
sha256sums=("d62d97880b48c5f56afcd269d87d8917e672b76c434112d759ab5fb6087e8cc4")
options=(!strip !debug)

install="jacartauc.install"

package() {
  bsdtar -xvf "$srcdir"/jcsecurbio_*_x64.rpm -C "$pkgdir"
  bsdtar -xvf "$srcdir"/jcpkcs11-2_*_x64.rpm -C "$pkgdir"
  bsdtar -xvf "$srcdir"/jacartauc_*_x64.rpm -C "$pkgdir"

  mv "$pkgdir/tmp" "$pkgdir/opt/jacartauc/scripts" # keep installation scripts
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" # arch just symlinks /usr/lib64 to /usr/lib
  gunzip "$pkgdir/opt/jacartauc/bin/JaCartaUC.gz" # unpack binary

  # package-provided polkit rules belong in /usr/share, /etc is for the admin
  install -Dm644 "$pkgdir/etc/polkit-1/rules.d/00-aladdin-pcsc.rules" \
    "$pkgdir/usr/share/polkit-1/rules.d/00-aladdin-pcsc.rules"
  rm -rf "$pkgdir/etc"

  # upstream binaries ship an absolute RPATH, replace it with a relative one
  patchelf --set-rpath '$ORIGIN/../lib' "$pkgdir/opt/jacartauc/bin/JaCartaUC"
  for plugin in "$pkgdir"/opt/jacartauc/bin/platforms/*.so; do
    patchelf --set-rpath '$ORIGIN/../../lib' "$plugin"
  done
  for lib in "$pkgdir"/opt/jacartauc/lib/*.so.*.*; do
    patchelf --set-rpath '$ORIGIN' "$lib"
  done
}
