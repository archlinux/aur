# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ipt_ndpi'
pkgver=1.2_1.7.0.netfilter.231.f87fffb
pkgrel=1
pkgdesc='nDPI as netfilter extension.'
arch=('any')
url='https://github.com/vel21ripn/nDPI'
license=('GPL')
depends=('linux' 'iptables' 'conntrack-tools')
makedepends=('git' 'libtool' 'gcc' 'gzip' 'gawk' 'sed')
source=("${pkgname}::git+${url}"
	"nDPI_netfilter_Linux_4.13.patch")
sha256sums=('SKIP'
            'bb19cc451a7ab99507e41d65c4a5ba5d258e64d4a009afbab2d56bbfe16fd344')
install="${pkgname}.install"
_kernver="`pacman -Ql linux| awk '/(\/modules\/)([0-9.-])+-ARCH\/$/ {print $2}'`"

pkgver() {
  cd "${srcdir}/${pkgname}"
  ndpi_version=`gawk 'match($0, /pr_info\("xt_ndpi\sv([0-9.]+)\sndpi\s%s\s%s\\\n"/, a) {print a[1]}' ndpi-netfilter/src/main.c`
  package_version=`gawk 'match($0, /^(AC_INIT)\(\[(libndpi)\]\,\s\[([0-9.]+)\]\)$/, a) {print a[3]}' configure.ac`
  git_branch=`git rev-parse --abbrev-ref HEAD`
  git_num=`git log --pretty=oneline | wc -l | tr -d '[[:space:]]'`
  git_tag=`git log -1 --format=%h`
  echo -e "${ndpi_version}_${package_version}.${git_branch}.${git_num}.${git_tag}"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/nDPI_netfilter_Linux_4.13.patch"

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}/ndpi-netfilter"
  make KERNEL_DIR="${_kernver}build"
}

check() {
  cd "${srcdir}/${pkgname}/ndpi-netfilter"
  gzip --best -c "src/xt_ndpi.ko" > "src/xt_ndpi.ko.gz"
}

package() {
  cd "${srcdir}/${pkgname}/ndpi-netfilter"
  install -Dm755 "ipt/libxt_ndpi.so" "${pkgdir}/usr/lib/iptables/libxt_ndpi.so"
  install -Dm644 "src/xt_ndpi.ko.gz" "${pkgdir}${_kernver}/extra/xt_ndpi.ko.gz"
  install -Dm644 "INSTALL" "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp -ax "kernel-patch" "${pkgdir}/usr/share/ndpi"
}
