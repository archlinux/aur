# Maintainer: Kars Wang <jaklsy AT gmail.com>

nameservers=(223.5.5.5 223.6.6.6)


_pkgname=accelerated-domains-china-list
pkgname=$_pkgname-git
pkgver=r2.f513e25.r60374.448a97509
pkgrel=1
pkgdesc="convert dnsmasq-china-list to dnsmasq, unbound and bind format, with multiple nameservers support"
arch=('any')
url="https://github.com/JaHIY/accelerated-doamins-china-list"
license=('')
makedepends=('git' 'php')
source=("git+https://github.com/felixonmars/dnsmasq-china-list.git"
        "git+https://github.com/JaHIY/$_pkgname.git")
md5sums=("SKIP"
         "SKIP")

pkgver() {
  local result=''

  for i in "$srcdir/$_pkgname" "$srcdir/dnsmasq-china-list"; do
    cd "${i}"
    result="${result:+${result}.}$(printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
  done

  echo "$result"
}

prepare() {
  cd "$srcdir/$_pkgname"

  ./generate-raw-list-from-dnsmasq-conf "$srcdir/dnsmasq-china-list/accelerated-domains.china.conf"
}

build() {
  cd "$srcdir/$_pkgname"

  ./generate-confs-from-raw-list "${nameservers[@]}"
}

package() {
  for i in bind dnsmasq unbound; do
    install -Dm644 "$srcdir/$_pkgname/$i.conf" "$pkgdir/etc/$_pkgname/$i.conf"
  done
}

# vim:set ts=2 sw=2 et:
