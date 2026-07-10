# Maintainer: Kira <[@kira](https://dev.kira-linux.org/kira)>

pkgbase=linux-kira-lts
pkgver=6.18.38
pkgrel=1
pkgdesc='Kira LTS Linux'
url='https://www.kernel.org'
_bcachefs_ver=1.38.8
arch=(x86_64)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  rust
  rust-bindgen
  rust-src
  tar
  xz
  gzip
  zstd
  graphviz
  imagemagick
  python-sphinx
  python-yaml
  texlive-latexextra
)
options=(
  !debug
)
_bcahcefs_src_dir=bcachefs-tools-$_bcachefs_ver
_srcname=linux-$pkgver
_srctag=v$pkgver
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  https://github.com/koverstreet/bcachefs-tools/archive/refs/tags/v${_bcachefs_ver}.tar.gz
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-drm-amdgpu-avoid-memory-allocation-in-the-critical-code-path-v3.patch
  0003-drm-amdgpu-use-GFP_ATOMIC-instead-of-NOWAIT-in-the-critical-path.patch
  kira_config_x86_64_base
  kira_config_x86_64_smol.fragment
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
sha256sums=('ac26e508abd56e9f8b89872b6e10c49fc823bcc70d8068a5d8504c1a7c4ff045'
            'SKIP'
            'b1c516bd0da3c4f879748d4cd0cdbd1eb5e7734d54421fb743d16e63a2e015bb'
            'e5bda61fa4405571a0267cd8812329bb8a432a37efb50459461628d371849906'
            'c31b8c0ace123f5c1a0012a1254272eea9ac9cdd0d3e5d538ca6b11830dd01b0'
            '0f482368b62c3cece941e2d3ba497bf322db59315df5c2f72500fc1318e4768e'
            'c45f1823c4011f4b18b4898699cbe629365f7fe835603ce14b106d62b7740169'
            '5fa3529f53791795b47636dd92b5f6418e7569b9b7f738dbe53df9e0b2143985')
b2sums=('3260a9de3db1291f8240c75c94f386ca36b6334a89cee9bc27e3b3de8ecbd5886c2bae7ba4c1d3d75fb633b85dc3192fabd806c56d04128d568dd078c3757211'
        'SKIP'
        '3dd8bbe1b3306e5f20d9c04d7e8f775e9be73e36b4b81868d1336969a24d143219db6b6d6580786761c2e7c5b129bfedb9dd3a9025d648acc35727cb3dba4695'
        '5b3597cab8b174ff41b3f17aae6d1376a155356f781542e2e176d66c5a6dee53f7a1db8e2b9540ce8246efac4e27476c882fc8cc8063f0f514ae09230b5aef0a'
        'a71f78bea42d158fc9383f2bbb985dafa71274d2032876b67f84602c8085b1c53f3d36965e54e5fdbab5c0d7537c98d917bd7743d3cf373c1dcb6da3bc19f4e7'
        'c9d4ec8fac86a9b6f0567c57f6d5be04d56f8efbc9dc1b183981dad38387d750b53c17fcdd295cb68a874bf50f81d117cfe94bd3a8d9e08e1918644ae8daa3e5'
        '65277c7fe73094a79f18a5f9d1c9992f4d1add2f5b2bc9600e6283c0c7d64bd79d9e198df6a599d561e0f8f52436c9685f23e028a30827b4555cb8a9e085937a'
        'a9edc6d69d305addd57f94b5e3e826c40a4266a5df06844deeb5f6678487848edc0f2c41846f8d375165e368df8f6702fb9c836f8382bcd10ded9bac12f12ab2')
export KBUILD_BUILD_HOST=kiralinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {

  cd $_bcahcefs_src_dir
  echo "Copy BCACHEFS sources"
  sh scripts/install-to-kernel.sh $srcdir/$_srcname
  echo "Done."
  cd $srcdir

  cd $_srcname
  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  # make defconfig

  echo "doing make olddefconfig for base config..."
  cp ../kira_config_x86_64_base .config
  make olddefconfig
  diff -u ../kira_config_x86_64_base .config || :
  echo "################## DONE make olddefconfig for base config #####################"
  echo ""


  # No need to apply this unless something changes
  #
  # echo "Apply kira_config_x86_64_smol.fragment"
  # ./scripts/kconfig/merge_config.sh .config "$srcdir/kira_config_x86_64_smol.fragment"
  # #diff -u ../kira_config_x86_64_base .config || :
  # echo "################## DONE Apply kira_config_x86_64_smol.fragment #####################"
  # echo ""
  
  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname

  echo "Building docs..."
  make htmldocs SPHINXOPTS=-QT &
  local pid_docs=$!

  echo "Building all"
  make all

  # BPF stuff that makes world a worse place
  # make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1

  wait "${pid_docs}"
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  license=(
    'Apache-2.0 OR MIT'

    'BSD-2-Clause OR GPL-2.0-or-later'

    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'
    'BSD-3-Clause OR GPL-2.0-or-later'
    BSD-3-Clause-Clear

    GPL-1.0-or-later
    'GPL-1.0-or-later OR BSD-3-Clause'

    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'
    'GPL-2.0-or-later WITH GCC-exception-2.0'

    ISC

    LGPL-2.0-or-later
    'LGPL-2.1-only'
    'LGPL-2.1-only OR BSD-2-Clause'

    LGPL-2.1-or-later

    MIT
    MPL-1.1
    X11
    Zlib
  )
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    wireguard-lts
    bcachefs-dkms
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build

  # licenses
  install -vDm 644 LICENSES/deprecated/{GPL-1.0,ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD,MIT}* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  license=(
    BSD-3-Clause
    'BSD-3-Clause OR GPL-2.0-only'

    GPL-1.0-or-later
    'GPL-1.0-or-later WITH Linux-syscall-note'

    GPL-2.0-only
    'GPL-2.0-only OR Apache-2.0'
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR CDDL-1.0'
    'GPL-2.0-only OR Linux-OpenIB'
    'GPL-2.0-only OR Linux-OpenIB OR BSD-2-Clause'
    'GPL-2.0-only OR MIT'
    'GPL-2.0-only OR MPL-1.1'
    'GPL-2.0-only OR X11'
    'GPL-2.0-only WITH Linux-syscall-note'
    '(GPL-2.0-only WITH Linux-syscall-note) AND MIT'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-2-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-only WITH Linux-syscall-note) OR CDDL-1.0'
    '(GPL-2.0-only WITH Linux-syscall-note) OR Linux-OpenIB'
    '(GPL-2.0-only WITH Linux-syscall-note) OR MIT'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR BSD-3-Clause'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later WITH Linux-syscall-note'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR BSD-3-Clause'
    '(GPL-2.0-or-later WITH Linux-syscall-note) OR MIT'
    'LGPL-2.0-or-later OR BSD-2-Clause'
    'LGPL-2.0-or-later WITH Linux-syscall-note'

    ISC

    'LGPL-2.0-or-later WITH Linux-syscall-note'
    'LGPL-2.0-or-later OR BSD-2-Clause'

    LGPL-2.1-only
    'LGPL-2.1-only OR BSD-2-Clause'
    'LGPL-2.1-only OR MIT'
    'LGPL-2.1-only WITH Linux-syscall-note'

    LGPL-2.1-or-later
    'LGPL-2.1-or-later OR BSD-2-Clause'
    'LGPL-2.1-or-later WITH Linux-syscall-note'

    MIT
    Zlib
  )
  depends=(pahole)
  provides=(LINUX-HEADERS)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  # install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
  #   localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  # install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Installing Rust files..."
  install -Dt "$builddir/rust" -m644 rust/*.rmeta
  install -Dt "$builddir/rust" rust/*.so

  echo "Installing unstripped VDSO..."
  make INSTALL_MOD_PATH="$pkgdir/usr" vdso_install \
    link=  # Suppress build-id symlinks

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
    case "$(file -Sib "$file")" in
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

  # licenses
  install -vDm 644 LICENSES/deprecated/{ISC,Linux-OpenIB,X11,Zlib} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/exceptions/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"
  license=(
    BSD-3-Clause

    GFDL-1.1-no-invariants-or-later

    GPL-2.0-only
    'GPL-2.0-only OR BSD-2-Clause'
    'GPL-2.0-only OR BSD-3-Clause'
    'GPL-2.0-only OR GFDL-1.1-no-invariants-or-later'
    'GPL-2.0-only OR GFDL-1.2-no-invariants-only'
    'GPL-2.0-only OR MIT'

    GPL-2.0-or-later
    'GPL-2.0-or-later OR BSD-2-Clause'
    'GPL-2.0-or-later OR CC-BY-4.0'
    'GPL-2.0-or-later OR MIT'
    'GPL-2.0-or-later OR X11'

    'LGPL-2.1-only OR BSD-2-Clause'

    MIT
  )

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

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

  # licenses
  install -vDm 644 LICENSES/deprecated/X11 -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 LICENSES/preferred/{BSD*,MIT} -t "$pkgdir/usr/share/licenses/$pkgname/"
}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
  "$pkgbase-docs"
)

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
