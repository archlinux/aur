#
# Maintainer: Grey Christoforo <firstname@lastname.net>
#
pkgname=linux-wsl
_tag=4.19.84-microsoft-standard 
pkgver=${_tag%%-*}
pkgrel=1
arch=(x86_64)
url="https://github.com/microsoft/WSL2-Linux-Kernel"
pkgdesc="Microsoft's Windows Subsystem for Linux 2 (WSL2) kernel"
license=(GPL2)
makedepends=(
  xmlto kmod inetutils bc libelf git python-sphinx python-sphinx_rtd_theme
  graphviz imagemagick
)
options=('!strip')

source=(https://github.com/microsoft/WSL2-Linux-Kernel/archive/${_tag}.tar.gz)
md5sums=('7de558b96bad270e64aa1fa589f0ed90')

_src_prefix="WSL2-Linux-Kernel-"
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=grey
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd "${_src_prefix}${_tag}"

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  #echo "${pkgbase#linux}" > localversion.20-pkgname

  msg2 "Setting config..."
  cp Microsoft/config-wsl .config
  make ARCH=x86_64 olddefconfig
  
  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"
}

build() {
  cd "${_src_prefix}${_tag}"
  make ARCH=x86_64 bzImage modules
}

package() {
  cd "${_src_prefix}${_tag}"
  
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"
  local builddir="$pkgdir/usr/lib/modules/$kernver/build"
  
  msg2 "Installing modules..."
  make ARCH=x86_64 INSTALL_MOD_PATH="${pkgdir}/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  # headers
  msg2 "Installing headers..."
  make ARCH=x86_64 INSTALL_HDR_PATH="${builddir}" headers_install
  find "${builddir}" -name "..install.cmd" -type f -delete

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  msg2 "Installing boot image..."
  make ARCH=x86_64 INSTALL_PATH="${modulesdir}" install
  mkdir -p "${pkgdir}/opt/linux-wsl/"
  cp -a "${modulesdir}/vmlinuz" "${pkgdir}/opt/linux-wsl/bzImage"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

# vim:set ts=8 sts=2 sw=2 et:
