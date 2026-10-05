# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ipt_ndpi'
_name='ndpi-netfilter'
pkgver=1.2_5.1.0.6501.63880be
pkgrel=1
pkgdesc='nDPI as netfilter extension'
arch=('x86_64' 'aarch64')
url='https://github.com/vel21ripn/nDPI'
license=('GPL')
depends=('iptables')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
# define '-lts' for linux-lts package
_linux_custom=""
_kernver="$(pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1)"

pkgver() {
  cd "${pkgname}"
  ndpi_version=`gawk 'match($0, /pr_info\("xt_ndpi\sv([0-9.]+)\sndpi\s%s"$/, a) {print a[1]}' "${_name}/src/main.c"`
  git_version=`gawk 'match($0, /^(#define\s)(NDPI_GIT_RELEASE)(\s")([a-z0-9.-]+)"$/, a) {print a[4]}' "src/include/ndpi_config.h" | sed -e 's/-/./g'`
  echo -e "${ndpi_version}_${git_version}"
}

prepare() {
  cd "${pkgname}"
  git checkout flow_info-4
  export CFLAGS="${CFLAGS} ${DEBUG_CFLAGS} -Wno-error=format-security"
  export CXXLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}"
  export LDFLAGS="${LDFLAGS}"
  ./autogen.sh
  ./configure

  sed --in-place \
    --expression 's|CFLAGS =|CFLAGS +=|g' \
  "${_name}/ipt/Makefile"
}

build() {
  cd "${pkgname}/${_name}"
  make KERNEL_DIR="${_kernver}build"
}

check() {
  cd "${pkgname}/${_name}"
  gzip --best -c "src/xt_ndpi.ko" > "src/xt_ndpi.ko.gz"
}

package() {
  cd "${pkgname}/${_name}"
  install -Dm0755 "ipt/libxt_ndpi.so" "${pkgdir}/usr/lib/xtables/libxt_ndpi.so"
  install -Dm0644 "src/xt_ndpi.ko.gz" "${pkgdir}${_kernver}/extra/xt_ndpi.ko.gz"
  install -Dm0644 "INSTALL" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
