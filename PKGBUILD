# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: MattWoelk
# Contributor: xsmile <sascha_r gmx de>

pkgname=nessus
pkgver=7.2.0
pkgrel=1
pkgdesc="Nessus vulnerability scanner"
arch=('x86_64')
depends=('gnupg')
license=('custom')
url="https://www.nessus.org"
install=${pkgname}.install

# Note: I had to use ipfs because I don't want to redistribute the file on a known server.
source=("Nessus-7.2.0-fc20.x86_64.rpm::https://gateway.ipfs.io/ipfs/QmbZj2Nkhtug2uhvm1A1KsqvUXqiGQZG7FdHAY1w2ndq29"
        nessus.desktop
        nessus.sh
        LICENSE)

sha256sums=('879fed652b2bf6d3ec58292f2b34fcf5331ba3a8ae3438068607dc7b55a27587'
            '8c5e82d609a7290c34cbfa5635012cb66820e4e2c1db2bf5808fc306fcefdc30'
            '9b8e2c15d86ce7b83806a27bd6685f009ad339f3ea52022b87a75fbd2802ec5a'
            '089073d03bf83e101b50da858348ace6bb2a553ce2249532d6f5d7ed29182dac')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"

  mkdir -p "$pkgdir/etc/ld.so.conf.d" "$pkgdir/usr/share" "$pkgdir/opt/nessus" \
           "$pkgdir/usr/lib"

  cp -a usr/lib "$pkgdir/usr"

  # path to libraries
  echo /opt/nessus/lib > "$pkgdir/etc/ld.so.conf.d/nessus.conf"

  # main files
  cp -a opt/nessus/{bin,com,etc,lib,sbin,var} "$pkgdir/opt/nessus"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nessus/LICENSE"

  # menu entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
