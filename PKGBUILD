# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ipt_ndpi'
pkgver=1.2_4.9.0.4970.61f4d586c
pkgrel=1
pkgdesc='nDPI as netfilter extension.'
arch=('any')
url='https://github.com/vel21ripn/nDPI'
license=('GPL')
depends=('iptables')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
# define '-lts' for linux-lts package
_linux_custom=""
_kernver="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"

pkgver() {
  cd "${pkgname}"
  ndpi_version=`gawk 'match($0, /pr_info\("xt_ndpi\sv([0-9.]+)\sndpi\s%s\"$/, a) {print a[1]}' ndpi-netfilter/src/main.c`
  git_version=`gawk 'match($0, /^(#define)\s(NDPI_GIT_RELEASE)\s(\")([a-z0-9.-]+)(\")$/, a) {print a[4]}' src/include/ndpi_config.h | sed -e 's/-/./g'`
  echo -e "${ndpi_version}_${git_version}"
}

prepare() {
  cd "${pkgname}"
  git checkout flow_info-4
  ./autogen.sh
}

build() {
  cd "${pkgname}/ndpi-netfilter"
  make KERNEL_DIR="${_kernver}build"
}

check() {
  cd "${pkgname}/ndpi-netfilter"
  gzip --best -c "src/xt_ndpi.ko" > "src/xt_ndpi.ko.gz"
}

package() {
  cd "${pkgname}/ndpi-netfilter"
  install -Dm755 "ipt/libxt_ndpi.so" "${pkgdir}/usr/lib/xtables/libxt_ndpi.so"
  install -Dm644 "src/xt_ndpi.ko.gz" "${pkgdir}${_kernver}/extra/xt_ndpi.ko.gz"
  install -Dm644 "INSTALL" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
