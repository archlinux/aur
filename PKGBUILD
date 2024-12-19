# Maintainer: Renato L. de F. Cunha <renatocunha@acm.org>

pkgname=microsoft-azure-vpn-client-bin
_pkgname=microsoft-azurevpnclient
_serverbase=https://packages.microsoft.com
pkgver=3.0.0
pkgrel=2
pkgdesc='The official Azure VPN Client, supporting Entra ID and certificates'
arch=('x86_64')
url='https://learn.microsoft.com/en-us/azure/vpn-gateway/point-to-site-entra-vpn-client-linux'
license=('Proprietary')
provides=('microsoft-azurevpnclient' 'microsoft-azure-vpn-client')
install=${pkgname}.install
depends=(
  'gtk3'
  'xdg-utils'
  'resolvconf'
  'libepoxy'
  'libcap'
  'curl'
  'fontconfig'
  'gcc-libs'
  'glib2'
  'pango'
  'libsecret'
  'zenity'
  'sqlite'
  'zlib'
)

source=(
  "${_serverbase}/ubuntu/22.04/prod/pool/main/m/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
  'microsoft-azure-vpn-client-bin.install'
)

sha256sums=(
  '9e5d360433d1d374d9a1051bb29a65103e81ca74ebeaa35155d1f0e9fc94577b'
  '0d7150522a05145d31e7c8d492425b5b346ba57003fb4c8ed23249eec5d56b63'
)

package() {
  bsdtar -xf data.tar.zst -C "$pkgdir/"

  # Remove old policy action format file(s)
  rm -fr "${pkgdir}/var/lib/polkit-1"

  # Add rule to allow users from the "network" group to change DNS
  cat << EOF >> "$pkgdir/usr/share/polkit-1/rules.d/microsoft-azurevpnclient.rules"

polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.resolve1.set-domains" ||
         action.id == "org.freedesktop.resolve1.set-dns-servers") &&
        subject.isInGroup("network"))
    {
        return polkit.Result.YES;
    }
});
EOF
}
