# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_limit='ipt-ratelimit'
pkgname='ipt_ratelimit'
pkgver='0.3.3'
pkgrel='2'
pkgdesc='Rate Policer as netfilter extension.'
arch=('any')
url="https://github.com/aabc/${_limit}"
license=('GPL')
depends=('linux' 'iptables')
makedepends=('gcc')
source=("${url}/archive/v${pkgver}.tar.gz"
	"${url}/pull/27.patch")
sha256sums=('3e478600585a14f004fb72765f5da4b64c65fe53d2a5a211a96392fd65fb5243'
            '35bf984dca74487bd31a4c60b025aaa842dd9f2362f618626448d1f163a82101')
# define '-lts' for linux-lts package
_linux_custom=""
_kdir="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"
_kver="`pacman -Ql linux${_linux_custom} | gawk 'match($0, /(\/usr\/lib\/modules\/)([0-9\.\-a-z]+)\/$/, a) {print a[2]}'`"

build() {
  cd "${_limit}-${pkgver}"
  # Fix builds on iptables version 1.8.9 or newer #27
  patch -p1 -i "../27.patch"
  make KVER="${_kver}" KDIR="${_kdir}build"
}

check() {
  cd "${_limit}-${pkgver}"
  gzip --best -c "xt_ratelimit.ko" > "xt_ratelimit.ko.gz"
}

package() {
  cd "${_limit}-${pkgver}"
  install -Dm755 "libxt_ratelimit.so" "${pkgdir}/usr/lib/xtables/libxt_ratelimit.so"
  install -Dm644 "xt_ratelimit.ko.gz" "${pkgdir}${_kdir}/extra/xt_ratelimit.ko.gz"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "CREDITS" "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
}
