# Maintainer: Kars Wang <jaklsy AT gmail.com>

nameservers=(114.114.114.114 114.114.115.115)


_pkgname=accelerated-domains-china-list
pkgname=$_pkgname-git
pkgver=r1.666a96a.r33418.252343a
pkgrel=1
pkgdesc="convert dnsmasq-china-list to dnsmasq, unbound and bind format, with multiple nameservers support"
arch=('any')
url="https://github.com/JaHIY/accelerated-doamins-china-list"
license=('')
depends=('')
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
