#
# Maintainer: Grey Christoforo <firstname@lastname.net>
#
pkgname=linux-wsl
_tag=4.19.81-microsoft-standard 
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
md5sums=('e2784adf1f52ff428a6b965cf49e214d')

_kernelname=${_tag##*-}-grey
_src_prefix="WSL2-Linux-Kernel-"
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
  #make KCONFIG_CONFIG=Microsoft/config-wsl image modules
}

package() {
  cd "$_src_prefix$_tag"
  # modules
  make ARCH=x86_64 INSTALL_MOD_PATH="${pkgdir}" modules_install

  # zimage
  make ARCH=x86_64 INSTALL_PATH="${pkgdir}" install
}

# vim:set ts=8 sts=2 sw=2 et:
