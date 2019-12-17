#
# Maintainer: Grey Christoforo <firstname@lastname.net>
#
pkgname=linux-wsl
_tag=4.19.84-microsoft-standard 
pkgver=${_tag%%-*}
pkgrel=1
arch=(x86_64)
url="https://github.com/microsoft/WSL2-Linux-Kernel"
license=(GPL2)
makedepends=(
  xmlto kmod inetutils bc libelf git python-sphinx python-sphinx_rtd_theme
  graphviz imagemagick
)
options=('!strip')

source=(https://github.com/microsoft/WSL2-Linux-Kernel/archive/${_tag}.tar.gz)
md5sums=('7de558b96bad270e64aa1fa589f0ed90')

_kernelname=${_tag##*-}-grey
_src_prefix="WSL2-Linux-Kernel-"
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd "$_src_prefix$_tag"
  scripts/setlocalversion --save-scmversion
  echo "$_kernelname" > localversion.20-pkg
  cp Microsoft/config-wsl arch/x86/x86_64_defconfig
  make ARCH=x86_64 defconfig
}

build() {
  cd "$_src_prefix$_tag"
  make ARCH=x86_64 bzImage modules
}

package() {
  cd "$_src_prefix$_tag"
  # modules
  make ARCH=x86_64 INSTALL_MOD_PATH="${pkgdir}/usr" modules_install

  # image
  mkdir -p "${pkgdir}/opt/wsl-kernel"
  make ARCH=x86_64 INSTALL_PATH="${pkgdir}/opt/wsl-kernel" install
  cp arch/x86/boot/bzImage "${pkgdir}/opt/wsl-kernel/."

  # headers
  make ARCH=x86_64 INSTALL_HDR_PATH="${pkgdir}/usr" headers_install
}

# vim:set ts=8 sts=2 sw=2 et:
