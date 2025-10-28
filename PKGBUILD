# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# Contributor: neale

pkgname=nessus-agent
_pkgname=nessus_agent
pkgver=11.0.2
pkgrel=1
pkgdesc="Nessus vulnerability scanner agent"
arch=('x86_64')
depends=('gnupg')
makedepends=('inetutils' 'ruby' 'ruby-nokogiri')
license=('custom')
options=(!strip debug)
url="https://www.tenable.com/downloads/nessus-agents"
install="$pkgname.install"
# If wish there was a cleaner way to dynamically update $source and $sha256sums as pkgver() does for $pkgver
# Also the read -r mass variable assignment allows to run the script only once instead of running it 3 times with individual $(ruby get_nessus_link.rb <arg>)
read -r _filename _url _version _dl_id _sha256 <<<$(ruby get_nessus_link.rb all)
source=("NessusAgent-$pkgver-fc38.$arch.rpm::https://www.tenable.com/downloads/api/v1/public/pages/nessus-agents/downloads/$_dl_id/download?i_agree_to_tenable_license_agreement=true"
        'LICENSE'
        'get_nessus_link.rb')
sha256sums=('4b7639f4ebd9bd18a24d9bca7f136b82c5561e684ea48fcf4a1413f9a5aef13f'
            'd647aedd39d571faa3f1a9906db561eecbd9c41605ba7f562261ffb04877ba26'
            '191603f44668b2f7dbafde4faef75ace91590d5c07a7a146601834ebe65a4734')
conflicts=('nessus') # due to /etc/ld.so.conf.d/nessus.conf

pkgver() {
  # ruby get_nessus_link.rb version
  echo $_version
}

package() {
  mkdir -p "$pkgdir/etc/ld.so.conf.d" "$pkgdir/usr/share" "$pkgdir/opt/$pkgname" \
           "$pkgdir/usr/lib"

  cp -a usr/lib "$pkgdir/usr"

  # path to libraries
  echo /opt/${_pkgname}/lib > "$pkgdir/etc/ld.so.conf.d/nessus.conf"

  # main files
  cp -a opt/${_pkgname}/{bin,com,etc,lib,sbin,var} "$pkgdir/opt/$pkgname"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

