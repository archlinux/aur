# Maintainer: Zarren Spry <zarrenspry at gmail dot com>

pkgname=nftlb-git
_pkgname=${pkgname%-git}
_reponame=${_pkgname}
pkgver=r488.e864b69
pkgrel=1
pkgdesc="nftlb stands for nftables load balancer, the next generation linux firewall that will replace iptables is adapted to behave as a complete load balancer and traffic distributor."
arch=('any')
url="https://github.com/zevenet/nftlb"
license=('AGPL3')
depends=('nftables' 'libev')
makedepends=('git' 'make' 'autoconf' 'binutils' 'automake' 'patch' 'gcc' 'pkgconf')
source=("git+https://github.com/zevenet/nftlb"
        "nftlb.service"
        "nftlb.conf"
        "01-add-server-key-env-var.patch")
md5sums=('SKIP'
         '6505beb5a8692489b7d73eee57719497'
         '5b1f2457ee4393f252798e346320f5e8'
         '610634775cd2d22c1c8db5266d980cb3')
validpgpkeys=('770E94A7B764C0D31AE2D33C34BCE0BCD665C5E9') # Zarren Spry <zarrenspry@gmail.com>
install="${_pkgname}.install"

pkgver() {
    cd ${srcdir}/${_reponame}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_reponame}
    patch -p0 --forward --input=${srcdir}/../01-add-server-key-env-var.patch
}

build() {
  cd ${srcdir}/${_reponame}
   autoreconf -fi
  ./configure --prefix=/usr
  make -j$(nproc)
}

package() {
    cd ${srcdir}
    install -Dm644 ${_reponame}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
    install -D -m755 ${_reponame}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -D -m644 ${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
    install -D -m600 ${_pkgname}.conf ${pkgdir}/etc/${_pkgname}.conf-paknew
}
