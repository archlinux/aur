# Maintainer: MattWoelk
# Contributor: xsmile <sascha_r gmx de>

_retoken='.*hidden">(\w+)<.*'
pkgname=nessus
pkgver=6.10.2
pkgrel=1
_filename="${pkgname^}-${pkgver}-fc20.x86_64.rpm"
pkgdesc="Vulnerability scanner"
arch=('x86_64')
depends=('gnupg')
license=('custom')
url="https://www.nessus.org"
install=${pkgname}.install

_gettoken() {
  token=$(curl -s https://www.tenable.com/products/nessus/select-your-operating-system#tos | \
          sed -nr "s/${_retoken}/\1/p")

  if [[ "$token" == "" ]]; then
    echo
    echo "  -> Could not get the download token, '_retoken' might need an update"
    exit 1
  fi

  echo "$token"
}
_token=$(_gettoken)
_pkgurl="https://downloads.nessus.org/nessus3dl.php?file=${_filename}&licence_accept=yes&t=${_token}"

source=("${_filename}::${_pkgurl}"
        nessus.desktop
        nessus.sh
        LICENSE)

md5sums=('6d283bb4ddb150aacb757acddbe368ea'
         '388578bf980efe6e6d3f33fcc289543a'
         '8c5772ac63f97d94475fe03e80d6ba5c'
         '1db6df5a39009ace46c7ee40141ece1b')

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
