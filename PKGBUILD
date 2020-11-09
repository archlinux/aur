#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org> ---> For the base PKGBUILD and config file
#Credits: Andreas Radke <andyrtr@archlinux.org> ---> For the base PKGBUILD and config file
#Credits: Bartłomiej Piotrowski <bpiotrowski@archlinux.org> ---> For the base api-headers package
#Credits: Linus Torvalds ---> For the linux kernel

pkgbase=mainline-kernel
pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
pkgver=5.10_rc3
pkgrel=1
versiontag=5.10-rc3
modulestag=5.10.0-rc3
pkgdesc="Mainline linux kernel, modules, headers, api-headers and docs"
arch=(x86_64)
url="https://www.kernel.org/"
license=(GPL-2.0)
makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
            "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
            "clang" "lib32-clang" "bc" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc" "pahole" "patch" "gtk3"
            "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc" "rsync")
source=("https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-${versiontag}.tar.gz"
        "${pkgbase}.preset"
        "config")
md5sums=("SKIP"
        "SKIP"
        "SKIP")

prepare(){
  cd linux-${versiontag}

  # Apply any patch
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Copy "${srcdir}"/config to linux-${pkgver}/.config
  echo "Copy "${srcdir}"/config to linux-${pkgver}/.config"
  cp "${srcdir}"/config .config

  # make olddefconfig
  echo "make olddefconfig"
  make olddefconfig
}

build(){
  cd linux-${versiontag}

  # make -j$(nproc) all
  echo "make -j$(nproc) all"
  make -j$(nproc) all
}

_package(){
  pkgdesc="Mainline linux kernel and modules"
  depends=("coreutils" "kmod" "initramfs" "mkinitcpio")
  optdepends=("linux-firmware" "crda")
  makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
            "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
            "clang" "lib32-clang" "bc" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc" "pahole" "patch" "gtk3"
            "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc" "rsync")
  install=${pkgbase}.install

  # Create system tree
  echo "Create system tree"
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/boot
  install -dm755 "${pkgdir}"/etc/mkinitcpio.d

  cd linux-${versiontag}

  # Installing modules
  echo "Installing modules"
  make INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install

  # Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}
  echo "Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}"
  cp arch/x86/boot/bzImage "${pkgdir}"/boot/vmlinuz-${pkgbase}

  # Copy System.map to "${pkgdir}"/boot/System.map-${pkgbase}
  echo "Copy System.map to "${pkgdir}"/boot/System.map-${pkgbase}"
  cp System.map "${pkgdir}"/boot/System.map-${pkgbase}

  # Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz
  echo "Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz"
  cp arch/x86/boot/bzImage "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz

  # Copy mainline-kernel.preset to "${pkgdir}"/etc/mkinitcpio.d/
  echo "Copy mainline-kernel.preset to "${pkgdir}"/etc/mkinitcpio.d/"
  cp "${srcdir}"/${pkgbase}.preset "${pkgdir}"/etc/mkinitcpio.d/

  # Remove build dir and source dir
  echo "Remove build dir and source dir"
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}/build
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}/source
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the mainline-kernel package"

  # Create system tree
  echo "Create system tree"
  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}/build

  cd linux-${versiontag}

  local builddir="$pkgdir/usr/lib/modules/${modulestag}/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-api-headers(){
  pkgdesc="Mainline linux kernel api headers"
  makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
            "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
            "clang" "lib32-clang" "bc" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc" "pahole" "patch" "gtk3"
            "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc" "rsync")

  # Create system tree
  echo "Create system tree"
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/usr/include
  install -dm755 "${pkgdir}"/usr/include/$pkgbase-api-headers

  cd linux-${versiontag}

  # Create fakeinstall dir
  echo "Create fakeinstall dir"
  mkdir fakeinstall

  # Installing headers to fakeinstall dir
  echo "Installing headers to fakeinstall dir"
  make INSTALL_HDR_PATH="fakeinstall" -j$(nproc) headers_install

  # Move headers from fakeinstall dir to "${pkgdir}"/usr/include/$pkgbase-api-headers/
  echo "Move headers from fakeinstall dir to "${pkgdir}"/usr/include/$pkgbase-api-headers/"
  mv fakeinstall/include/* "${pkgdir}"/usr/include/$pkgbase-api-headers/
}

_package-docs() {
  pkgdesc="Documentation for the mainline-kernel package"
  makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
            "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
            "clang" "lib32-clang" "bc" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc" "pahole" "patch" "gtk3"
            "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc" "rsync")

  # Create system tree
  echo "Create system tree"
  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}/build

  cd linux-${versiontag}

  # make -j$(nproc) htmldocs
  echo "make -j$(nproc) htmldocs"
  make -j$(nproc) htmldocs

  local builddir="$pkgdir/usr/lib/modules/${modulestag}/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}
