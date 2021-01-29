# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname="wireless-ids-git"
_gitname="wireless-ids"
pkgver=26.7dfd2fc
pkgrel=3
pkgdesc="This tool will sniff your surrounding air traffic for suspicious activities such as WEP/WPA/WPS attacking packets"
url="https://github.com/SYWorks/wireless-ids"
license=("custom")
arch=('any')
provides=("wireless-ids")
depends=('python2' 'aircrack-ng' 'wireshark-cli' 'mlocate')
options=('!strip')
source=("git+https://github.com/GIJack/${_gitname}.git" "wids.default" "wireless-ids.service")
sha256sums=('SKIP'
            '6eb645517297a7131f2a5a1c57ce239c885db11261ff0c87cac97e6e503505a1'
            '09d6ac0003650d5b6b4cca37d216a33469bde4f9b099c5e74628b59973055aa9')
install=${_gitname}.install

pkgver() {
  cd "${srcdir}/${_gitname}"
  local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s" "${ver//-/.}"
}

build(){
  cd "${srcdir}/${_gitname}"
  local logfile="/var/log/wids.log"
  sed -i '1s/python/python2/' "wids.py"
  python2 -m compileall *.py
}

package() {
  cd "${srcdir}"
  # The database
  #chmod -R 644 "$srcdir/${_gitname}"
  #chmod -R a+X "$srcdir/${_gitname}"
  install -dm 755 "$pkgdir/usr/share"
  cp -r "$srcdir/${_gitname}" "$pkgdir/usr/share/${_gitname}"
  rm -rf "$pkgdir/usr/share/${_gitname}/.git"
  chmod +x "${pkgdir}/usr/share/wireless-ids/wids.py"

  #and now for .service file
  install -Dm644 wireless-ids.service "${pkgdir}/usr/lib/systemd/system/wireless-ids.service"
  install -Dm644 wids.default "${pkgdir}/etc/default/wids"
}

