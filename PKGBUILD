# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: MattWoelk
# Contributor: xsmile <sascha_r gmx de>

pkgname=nessus
pkgver=7.2.1
pkgrel=1
pkgdesc="Nessus vulnerability scanner"
arch=('x86_64')
depends=('gnupg')
license=('custom')
url="https://www.nessus.org"
install=${pkgname}.install

# Note: I had to use ipfs because I don't want to redistribute the file on a known server.
source=("Nessus-7.2.1-fc20.x86_64.rpm::https://cloudflare-ipfs.com/ipfs/QmVf2aJEun4ek8y3eKaLVMGciV4q8NphgsD6CcD68kQAWz"
        nessus.desktop
        nessus.sh
        LICENSE)

sha256sums=('472236b873c1ec26b052dca9f1a85509e6d7da156f55b2a272701821087fa608'
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
