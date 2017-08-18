# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ipt_iftag'
pkgver=6.04d141a
pkgrel=1
pkgdesc='Netfilter extension that can operate on groups of interfaces.'
arch=('any')
url="https://github.com/vel21ripn/${pkgname}"
license=('GPL')
depends=('linux' 'iptables')
makedepends=('git' 'libtool' 'gcc' 'gzip' 'gawk' 'sed')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
install="${pkgname}.install"
_kernver="`pacman -Ql linux| awk '/(\/modules\/)([0-9.-])+-ARCH\/$/ {print $2}'`"

pkgver() {
  cd "${srcdir}/${pkgname}"
  git_num=`git log --pretty=oneline | wc -l | tr -d '[[:space:]]'`
  git_tag=`git log -1 --format=%h`
  echo -e "${git_num}.${git_tag}"
}

build() {
  cd "${srcdir}/${pkgname}"
  make KERNEL_DIR="${_kernver}build"
}

check() {
  cd "${srcdir}/${pkgname}"
  gzip --best -c "kernel/${pkgname}.ko" > "kernel/${pkgname}.ko.gz"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "iptables/lib${pkgname}.so" "${pkgdir}/usr/lib/iptables/lib${pkgname}.so"
  install -Dm644 "kernel/${pkgname}.ko.gz" "${pkgdir}${_kernver}/extra/${pkgname}.ko.gz"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
