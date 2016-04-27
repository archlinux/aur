# Maintainer: Shalygin Konstantin <k0ste@cn.ru>
# Contributor: Shalygin Konstantin <k0ste@cn.ru>

pkgname='ipt_ndpi'
pkgver=1.2_1.7.0.netfilter.212.56eacee
pkgrel=1
pkgdesc='nDPI as netfilter extension'
arch=('any')
url='https://github.com/vel21ripn/nDPI/tree/netfilter'
license=('GPL')
depends=('linux' 'iptables' 'xtables-addons' 'conntrack-tools')
makedepends=('git' 'libtool' 'gcc' 'gzip' 'gawk' 'sed')
source=("${pkgname}::git+https://github.com/vel21ripn/nDPI")
sha256sums=('SKIP')
install="${pkgname}.install"
_kernver="`pacman -Ql linux| awk '/(\/modules\/)([0-9.-])+-ARCH\/$/ {print $2}'`"

pkgver() {
  cd "${srcdir}/${pkgname}"
  git checkout netfilter >/dev/null 2>&1
  ndpi_version=`gawk 'match($0, /pr_info\("xt_ndpi\sv([0-9.]+)\sndpi\s%s\s%s\\\n"/, a) {print a[1]}' ndpi-netfilter/src/main.c`
  package_version=`gawk 'match($0, /^(AC_INIT)\(\[(libndpi)\]\,\s\[([0-9.]+)\]\)$/, a) {print a[3]}' configure.ac`
  git_branch=`git rev-parse --abbrev-ref HEAD`
  git_num=`git log --pretty=oneline | wc -l | tr -d '[[:space:]]'`
  git_tag=`git log -1 --format=%h`
  echo -e "${ndpi_version}_${package_version}.${git_branch}.${git_num}.${git_tag}"
}

prepare() {
  pushd "${srcdir}/${pkgname}"
  git checkout netfilter
  ./autogen.sh
  popd
}

build() {
  pushd "${srcdir}/${pkgname}/ndpi-netfilter"
  make KERNEL_DIR="${_kernver}/build"
  gzip --best -c "src/xt_ndpi.ko" > "src/xt_ndpi.ko.gz"
  popd
}

package() {
  pushd "${srcdir}/${pkgname}/ndpi-netfilter"
  install -Dm755 "ipt/libxt_ndpi.so" "${pkgdir}/usr/lib/iptables/libxt_ndpi.so"
  install -Dm644 "src/xt_ndpi.ko.gz" "${pkgdir}${_kernver}/extra/xt_ndpi.ko.gz"
  install -Dm644 "INSTALL" "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp -ax "kernel-patch" "${pkgdir}/usr/share/ndpi"
  popd
}
