## Maintainer: Moses Narrow <moe_narrow@skycoin.com>
_projectname=cogentcore
pkgname=cogentcore
_pkgname=${pkgname//cogent}
pkgdesc="Command line tools for compiling apps using the Cogent Core framework. Code Once, Run Everywhere."
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver='0.3.0'
pkgrel='1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' 'riscv64' )
url="https://www.cogentcore.org/core"
license=('BSD 3-Clause License')
makedepends=("go")
optdepends=("vulkan-intel: intel graphics support"
"vulkan-swrast: graphics support"
"vulkan-tools: graphics support"
)

build() {
  _build ${_tag_ver}
}
#_build function - used in build variants
_build() {
  mkdir -p ${srcdir}/go/bin
  echo "export GOPATH=\"${srcdir}/go\" ; export GOBIN=\"${GOPATH}/bin\" ; go install --ldflags=\"-s -w\" cogentcore.org/core/cmd/core@${1}"
  export GOPATH="${srcdir}/go" ; export GOBIN="${GOPATH}/bin" ; go install --ldflags="-s -w" cogentcore.org/core/cmd/core@${1}
  echo "${GOBIN}/core --help"
  ${GOBIN}/core --help || (echo 'error on test execution' ; exit 1)
}

package() {
_package
if command -v tree &> /dev/null ; then
echo 'package tree'
cd ${pkgdir}
tree -a .
fi
}
#_package function - used in build variants
_package() {
install -Dm755 "${GOBIN}/core" "${pkgdir}/usr/bin/core"
}
