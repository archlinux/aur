# Maintainer: teraflops <me@priet.us>
pkgname=iso2dsd
pkgver=0.1.0
pkgrel=1
pkgdesc="GUI for ISO to DSD conversion using iso2dsd, sacd_extract and fix2064-byte.c patch"
arch=('x86_64')
url="http://dsd.sonore.us/iso2dsd"
license=('GPL')
depends=('java-runtime' 'gcc')

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
}


