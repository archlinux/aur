# Maintainer: teraflops <me@priet.us>  
pkgname=iso2dsd
pkgver=0.1.0
pkgrel=2
pkgdesc="GUI to convert SACD ISO to DSD using iso2dsd, sacd_extract and 2064-byte.c patch for non compliant ISOS"
arch=('x86_64')
url="http://dsd.sonore.us/iso2dsd"
license=('GPL2' 'Custom: SimpleDesignLLC')
depends=('java-runtime' 'gcc' 'libxml2-legacy')

target_iso2dsd="iso2dsd_gui.jar.zip::http://dsd.sonore.us/iso2dsd_gui.jar.zip"
target_sacd="sacd_extract-0.3.9.3-117-linux.zip::https://github.com/EuFlo/sacd-ripper/releases/download/0.3.9.3/sacd_extract-0.3.9.3-117-linux.zip"
source=("${target_iso2dsd}" "${target_sacd}" '2064-byte.c')
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  mkdir -p iso2dsd
  bsdtar -xvf "$srcdir/${target_iso2dsd%%::*}" -C iso2dsd
  bsdtar -xvf "$srcdir/${target_sacd%%::*}" -C iso2dsd

  rm -rf iso2dsd/__MACOSX
  find iso2dsd -name '._*' -delete
}

build() {
  gcc "$srcdir/2064-byte.c" -o fix.broken.2064.sacd
  chmod +x fix.broken.2064.sacd
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r iso2dsd/* "$pkgdir/usr/share/$pkgname/"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  if [ -f "$srcdir/COPYING" ]; then
    install -m644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/GPL2.txt"
  else
    echo "SACD-Ripper: GNU GPL v2" > "$pkgdir/usr/share/licenses/$pkgname/GPL2.txt"
  fi
  echo "Java GUI: Copyright © Simple Design, LLC" > \
    "$pkgdir/usr/share/licenses/$pkgname/SimpleDesignLLC.txt"

  chmod -R a+rw "$pkgdir/usr/share/$pkgname"

  install -Dm755 fix.broken.2064.sacd "$pkgdir/usr/share/$pkgname/fix.broken.2064.sacd"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/fix.broken.2064.sacd" <<EOF
#!/bin/sh
exec "/usr/share/$pkgname/fix.broken.2064.sacd" "$@"
EOF
  chmod +x "$pkgdir/usr/bin/fix.broken.2064.sacd"

  cat > "$pkgdir/usr/bin/iso2dsd" <<EOF
#!/bin/sh
cd "/usr/share/$pkgname"
exec java -jar "iso2dsd_gui.jar" "$@"
EOF
  chmod +x "$pkgdir/usr/bin/iso2dsd"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/iso2dsd.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=iso2dsd
GenericName=ISO → DSD Converter
Comment=GUI to convert SACD ISO to DSD using iso2dsd, sacd_extract and 2064-byte.c patch for non compliant ISOS
Exec=iso2dsd %f
Icon=iso2dsd
Terminal=false
Categories=AudioVideo;Audio;Converter;
MimeType=application/x-iso9660-image;
EOF
}

