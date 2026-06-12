# Maintainer: eeeeei <2187409610@qq.com>
# Co-Maintainer: Capricornus007 <sihaogang at gmail dot com>
# Contributor: "huyz" on aur.archlinux.org, E-Mail hidden.
# Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

if [ -z ${Microarchitecture+x} ]; then
  Microarchitecture=CONFIG_GENERIC_CPU
fi
pkgbase=linux-zencjk
pkgver=7.0.12.zen1
pkgrel=1
pkgdesc='Linux ZEN (with cjktty patch)'
url="https://github.com/zen-kernel/zen-kernel"
arch=(x86_64 aarch64)
license=(GPL-2.0-ONLY)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  tar
  xz
)
options=(
  !strip
  !debug
)
_srcname=linux-${pkgver%.*}
_srctag=v${pkgver%.*}-${pkgver##*.}
_zen_pkgrel=1
source=(
  https://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  $url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  "config::https://gitlab.archlinux.org/archlinux/packaging/packages/linux-zen/-/raw/${pkgver}-${pkgrel}/config.x86_64"   # the main kernel config file
  "0001-cjktty.patch::https://github.com/bigshans/cjktty-patches/raw/master/v7.x/cjktty-7.0.11.patch"
  "0002-cjktty-32.patch::https://github.com/bigshans/cjktty-patches/raw/master/cjktty-add-cjk32x32-font-data.patch"
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)
b2sums=('2c53f205a940b0f9f68653b92ef46d49f828cbef3cfa8cf94d050c8e6df05c4fcaa4f9b9681b9130b14e3c790d31208eb244d123249a93e35e8e6165f3d858c9'
        'SKIP'
        'cd7c108e648faff3dc0c8fd2ac4ccced27432ef78a0b5876c413bc414f01ff2cedb90cc2d329bc9ef9f44966dcd5c829aad8842200d56d94b3916a5baadd725a'
        'SKIP'
        'aba10f48f3a57864aa6e51adcc013ec9121444c62dfaa510d71be1a0502b2e5d801517bb40f1c7aad2596c2540898bd0ddf85ee9d69c0244b8997119da848213'
        '1126d744a95275b147927eded508150212f03e32b65433c0981b85411342cb4becb814f00871c6d8e6ec1f710acc17dbcb50e9a4bcd6e7f2cc75a6cde06bf78c'
        '101996793aeede5e456b23b35c2fd4af5c38fd363473dcdda0bce6e21d110a9f88a67e325b1ebf8efef4a7511f135c4f64ff1fc54b8ef925a5df8d6292ba7678')




export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
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
    patch -Np1 -F3 < "../$src" || echo "Patch $src failed but continuing..."
  done
  
  # --- 加入這行：強制覆蓋 Zen 內核中衝突的文件 ---
  #echo "Applying manual fix for Zen fbcon.c..."
  #cp "$startdir/fbcon.c.backup" drivers/video/fbdev/core/fbcon.c
  # ------------------------------------------

  echo "Setting config..."
  echo "Setting microarchitecture $Microarchitecture..."
  sed -e "s|^# $Microarchitecture is not set|$Microarchitecture=y|g" -i ../config
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )
  provides=(
    KSMBD-MODULE
    UKSMD-BUILTIN
    VHBA-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
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
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

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
}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)

exec 3>&1 4>&2
exec > /dev/null 2>&1
echo "开始校验文件，防止文件冲突"
get_source_filenames() {
    local names=()
    for entry in "${source[@]}"; do
        # 处理 `newname::url` 形式
        local basename="${entry%%::*}"
        # 如果 basename 就是整个 entry（即没有 ::），那么 basename 可能是 URL
        if [[ "$basename" == "$entry" ]]; then
            # 普通 URL，去除协议和路径
            basename="${basename##*/}"
            # 去除 ? 后面的查询参数（如果有）
            basename="${basename%%\?*}"
        fi
        # 如果 basename 是空（比如 url 以 / 结尾?），跳过
        if [[ -n "$basename" ]]; then
            names+=("$basename")
        fi
    done
    # printf '%s\n' "${names[@]}"
    echo "${names[@]}"
}

filenames=($(get_source_filenames))
num=0
for file in "${filenames[@]}"; do
    # echo "$file"
    # 判断文件是否存在且b2sums不为SKIP
    if [ -f "$file" ] && [ "${b2sums[$num]}" != "SKIP" ]; then
        file_b2sums=($(b2sum "$file"))
        if [ "${file_b2sums[0]}" = "${b2sums[$num]}" ]; then
            echo "$file : 文件检验成功"
        else
            echo "$file : 文件检验失败，删除文件"
            rm "$file"
            echo "删除文件成功"
        fi
    else
        echo "$file : 文件不存在或b2sums为SKIP，跳过..."
    fi
    num=$((num+1))
done
echo "校验文件结束"
exec 1>&3 2>&4
exec 3>&- 4>&-


for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
