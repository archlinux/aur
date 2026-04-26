# Maintainer: Roman Mia <mail.romanmia@gmail.com>
pkgname=quasar-mips-ide-bin
_pkgname=Quasar
_pkgname_lower=quasar
pkgver=1.6.0
pkgrel=1
pkgdesc="A modern, high-performance IDE for MIPS32 R2000 assembly (Pre-built binary)"
arch=('x86_64')
url="https://github.com/rmia46/quasar"
license=('custom:QUASAR NON-COMMERCIAL LICENSE')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
provides=('quasar-mips-ide')
conflicts=('quasar-mips-ide' 'quasar-mips-ide-git')
source=("https://github.com/rmia46/quasar/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/rmia46/quasar/main/LICENSE")
sha256sums=('f374f4e327022370378689ba3b6a1d057b9c4f36b843ebefca91875add7b71f4'
            '2c685bb9160a30c7c88334530378ae1dfd3c393af72efe3e48a322ee5fe53e28')

prepare() {
  # Extract the data archive from the debian package
  # bsdtar (used by makepkg) already extracts the .deb (ar archive) into the srcdir.
  # We just need to extract the actual data partition which can be .xz, .gz, or .zst
  msg2 "Extracting data archive..."
  tar -xf data.tar.*
}

package() {
  # Install the extracted files
  cp -r usr "$pkgdir/"
  
  # Ensure binary is lowercase for terminal convenience but desktop name remains Quasar
  if [ -f "$pkgdir/usr/bin/$_pkgname" ]; then
    mv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_quasar" 2>/dev/null || true
  fi

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
