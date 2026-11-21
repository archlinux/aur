# Maintainer: hypo <vyacheslav.mayorov@gmail.com>
pkgname=jacartauc
pkgver=3.3.6.3921
pkgrel=2
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
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
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
source=("https://www.aladdin-rd.ru/upload/downloads/JaCarta_UC/jacarta-${pkgver%.*}/lunix/distributions/jacartauc_${pkgver}_rpm_x64.tgz"
        "LICENSE")
sha256sums=("d62d97880b48c5f56afcd269d87d8917e672b76c434112d759ab5fb6087e8cc4"
            "2ec69bd9eae51ca29e96be8e88ad5ec5e92865515d4c207554c240fe8d8f34c3")
# Do NOT enable strip: GNU strip breaks the PT_LOAD size of the Aladdin
# middleware (libjcPKCS11-2, libASEP11, libjcPKCS11ds). They reserve zero-filled
# memory beyond .bss; strip recalculates p_memsz as equal to p_filesz, drops
# that area, and the PKCS#11 module segfaults during initialization.
options=(!strip !debug)

install="jacartauc.install"

package() {
  bsdtar -xvf "$srcdir"/jcsecurbio_*_x64.rpm -C "$pkgdir"
  bsdtar -xvf "$srcdir"/jcpkcs11-2_*_x64.rpm -C "$pkgdir"
  bsdtar -xvf "$srcdir"/jacartauc_*_x64.rpm -C "$pkgdir"

  # keep upstream's post-install helpers, but out of /tmp
  install -d "$pkgdir/usr/share/jacartauc"
  mv "$pkgdir/tmp" "$pkgdir/usr/share/jacartauc/scripts"

  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" # arch just symlinks /usr/lib64 to /usr/lib
  mv "$pkgdir/opt/jacartauc" "$pkgdir/usr/lib/jacartauc" # ELF files do not belong to /opt
  rm -rf "$pkgdir/opt"
  gunzip "$pkgdir/usr/lib/jacartauc/bin/JaCartaUC.gz" # unpack binary

  # package-provided polkit rules belong in /usr/share, /etc is for the admin
  install -Dm644 "$pkgdir/etc/polkit-1/rules.d/00-aladdin-pcsc.rules" \
    "$pkgdir/usr/share/polkit-1/rules.d/00-aladdin-pcsc.rules"
  rm -rf "$pkgdir/etc"

  # icons and desktop entry
  for size in 16 24 32 48 256 512; do
    install -Dm644 "$pkgdir/usr/lib/jacartauc/bin/jacartauc-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/jacartauc.png"
  done
  rm -f "$pkgdir"/usr/lib/jacartauc/bin/jacartauc-*.png
  sed -i -e 's|^Exec=.*|Exec=/usr/bin/jacartauc|' \
         -e 's|^Icon=.*|Icon=jacartauc|' \
         -e 's|^Path=.*|Path=/usr/lib/jacartauc/bin|' \
    "$pkgdir/usr/share/applications/jacartauc.desktop"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/jacartauc/bin/jacartauc.sh "$pkgdir/usr/bin/jacartauc"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # upstream binaries ship an absolute RPATH, replace it with a relative one
  patchelf --set-rpath '$ORIGIN/../lib' "$pkgdir/usr/lib/jacartauc/bin/JaCartaUC"
  for plugin in "$pkgdir"/usr/lib/jacartauc/bin/platforms/*.so; do
    patchelf --set-rpath '$ORIGIN/../../lib' "$plugin"
  done
  for lib in "$pkgdir"/usr/lib/jacartauc/lib/*.so.*.*; do
    patchelf --set-rpath '$ORIGIN' "$lib"
  done
}
