# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer : Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer : Truocolo <truocolo@aol.com>
# Contributor : Christian Hesse <mail@eworm.de>
# Contributor : Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="1"

[[ "${CARCH}" == 'x86_64' ]] && _EFI_ARCH='x86_64'
[[ "${CARCH}" == 'i686' ]] && _EFI_ARCH='i386'

[[ "${CARCH}" == 'x86_64' ]] && _EMU_ARCH='x86_64'
[[ "${CARCH}" == 'i686' ]] && _EMU_ARCH='i386'

_pkg="grub"
pkgbase="${_pkg}-emu"
pkgname=(
  "${pkgbase}"
)
pkgdesc='GNU GRand Unified Bootloader (2)'
epoch=2
_tag='03e6ea18f6f834f177cad017279bedbb0a3de594' # git rev-parse grub-${_pkgver}
_pkgver=2.12
_unifont_ver='15.1.05'
pkgver=${_pkgver/-/}
pkgrel=1
url="https://www.gnu.org/software/${_pkg}"
arch=(
  'x86_64'
)
license=(
  'GPL-3.0-or-later'
)
backup=(
  "etc/default/${_pkg}"
  "etc/${_pkg}.d/40_custom"
)
install="${_pkg}.install"
options=(
  '!makeflags'
)
makedepends=(
  'git'
  'rsync'
  'xz'
  'freetype2'
  'ttf-dejavu'
  'python'
  'autogen'
  'texinfo'
  'help2man'
  'gettext'
  'device-mapper'
  'fuse3'
)
depends=(
  'sh'
  'xz'
  'gettext'
  'device-mapper'
  'grub-common'
)
optdepends=(
  'freetype2: For grub-mkfont usage'
  'fuse3: For grub-mount usage'
  'dosfstools: For grub-mkrescue FAT FS and EFI support'
  'lzop: For grub-mkrescue LZO support'
  'efibootmgr: For grub-install EFI support'
  'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
  'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
  'mtools: For grub-mkrescue FAT FS support'
)
if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
  makedepends+=(
    'libusb'
    'sdl'
  )
  optdepends+=(
    'libusb: For grub-emu USB support'
    'sdl: For grub-emu SDL support'
  )
fi
validpgpkeys=(
  # Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
  'E53D497F3FA42AD8C9B4D1E835A93B74E82E4209'
  # Daniel Kiper <dkiper@net-space.pl>
  'BE5C23209ACDDACEB20DB0A28C8189F1988C2166'
  # Paul Hardy <unifoundry@unifoundry.com>
  '95D2E9AB8740D8046387FD151A09227B1F435A33'
  )
_gnu_git="https://git.savannah.gnu.org/git"
_gnu_ftp="https://ftp.gnu.org/gnu"
source=(
  "git+${_gnu_git}/grub.git#tag=${_tag}?signed"
  "git+${_gnu_git}/gnulib.git"
  "${_gnu_ftp}/unifont/unifont-${_unifont_ver}/unifont-${_unifont_ver}.bdf.gz"{,.sig}
  '0001-00_header-add-GRUB_COLOR_-variables.patch'
  '0002-10_linux-detect-archlinux-initramfs.patch'
  '0003-support-dropins-for-default-configuration.patch'
  'grub.default'
  'sbat.csv'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '8ea5b5a14d71e3353d1fea373f5d88d198ad1e285cedd8294655926ee11fd91d'
  'SKIP'
  '5dee6628c48eef79812bb9e86ee772068d85e7fcebbd2b2b8d1e19d24eda9dab'
  '8488aec30a93e8fe66c23ef8c23aefda39c38389530e9e73ba3fbcc8315d244d'
  'b5d9fcd62ffb3c3950fdeb7089ec2dc2294ac52e9861980ad90a437dedbd3d47'
  '7df3f5cb5df7d2dfb17f4c9b5c5dedc9519ddce6f8d2c6cd43d1be17cecb65cb'
  'f34c2b0aa2ed4ab9c7e7bcab5197470c30fedc6c2148f337839dd24bceae35fd'
)
_backports=(
)
_reverts=(
)
_configure_options=(
  PACKAGE_VERSION="${epoch}:${pkgver}-${pkgrel}"
  FREETYPE="pkg-config freetype2"
  BUILD_FREETYPE="pkg-config freetype2"
  --enable-nls
  --enable-device-mapper
  --enable-cache-stats
  --enable-grub-mkfont
  --enable-grub-mount
  --prefix="/usr"
  --bindir="/usr/bin"
  --sbindir="/usr/bin"
  --mandir="/usr/share/man"
  --infodir="/usr/share/info"
  --datarootdir="/usr/share"
  --sysconfdir="/etc"
  --program-prefix=""
  --with-bootdir="/boot"
  --with-grubdir="grub"
  --disable-silent-rules
  --disable-werror
)
prepare() {
  cd \
    "${srcdir}/grub/"
  echo \
    "Apply backports..."
  local \
    _c
  for _c in "${_backports[@]}"; do
    git \
      log \
        --oneline \
        -1 \
        "${_c}"
    git \
      cherry-pick \
        -n \
          "${_c}"
  done
  echo "Apply reverts..."
  local _c
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done
  echo \
    "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
  # Based on 
  # http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
  patch \
    -Np1 \
    -i \
    "${srcdir}/0001-00_header-add-GRUB_COLOR_-variables.patch"
  echo \
    "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
  patch \
    -Np1 \
    -i \
    "${srcdir}/0002-10_linux-detect-archlinux-initramfs.patch"
  echo \
    "Patch to support dropins for default configuration..."
  patch \
    -Np1 \
    -i \
    "${srcdir}/0003-support-dropins-for-default-configuration.patch"
  echo \
    "Fix DejaVuSans.ttf location so that grub-mkfont" \
    "can create *.pf2 files for starfield theme..."
  sed \
    's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' \
    -i \
    "configure.ac"
  echo \
    "Fix mkinitcpio 'rw' FS#36275..."
  sed \
    's| ro | rw |g' \
    -i \
    "util/grub.d/10_linux.in"
  echo \
    "Fix OS naming FS#33393..."
  sed \
    's|GNU/Linux|Linux|' \
    -i \
    "util/grub.d/10_linux.in"
  echo \
    "Pull in latest language files..."
  ./linguas.sh
  echo \
    "Avoid problem with unifont during compile of grub..."
  # http://savannah.gnu.org/bugs/?40330
  # and 
  # https://bugs.archlinux.org/task/37847
  gzip \
    -cd \
    "${srcdir}/unifont-${_unifont_ver}.bdf.gz" > \
    "unifont.bdf"
  
  echo \
    "Run bootstrap..."
  ./bootstrap \
    --gnulib-srcdir="${srcdir}/gnulib/" \
    --no-git
  echo \
    "Make translations reproducible..."
  sed \
    -i \
    '1i /^PO-Revision-Date:/ d' \
    po/*.sed
}

_build_grub-emu() {
  local \
    _emu_options=()
  _emu_options=(
    --with-platform="emu"
    --target="${_EMU_ARCH}"
    --enable-grub-emu-usb=no
    --enable-grub-emu-sdl=no
    --disable-grub-emu-pci
  )
  echo \
    "Copy the source for building the emu part..."
  cp \
    -r \
    "${srcdir}/grub/" \
    "${srcdir}/grub-emu/"
  cd \
    "${srcdir}/grub-emu/"
  echo \
    "Unset all compiler FLAGS for emu build..."
  unset \
    CFLAGS \
    CPPFLAGS \
    CXXFLAGS \
    LDFLAGS \
    MAKEFLAGS
  echo \
    "Run ./configure for emu build..."
  ./configure \
    "${_emu_options[@]}" \
    "${_configure_options[@]}"
  echo \
    "Run make for emu build..."
  make
}

build() {
  cd \
    "${srcdir}/grub/"
  if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    echo \
      "Build grub emu stuff..."
    _build_grub-emu
  fi
}

_rm_man() {
  mv \
    "${pkgdir}/usr/share/man/man1/${pkgbase}.1.gz" \
    "${srcdir}"
  rm \
    -f \
    "${pkgdir}/usr/share/man" || \
    true
  install \
    -Dm \
      755 \
    "${srcdir}/${pkgbase}.1.gz" \
    "${pkgdir}/usr/share/man/man1/${pkgbase}.1.gz"
}

_remove_rest_of_grub() {
  local \
    _the_rest_of_grub=()
  _the_rest_of_grub=( 
    /etc/grub.d/00_header
    /etc/grub.d/10_linux
    /etc/grub.d/20_linux_xen
    /etc/grub.d/25_bli
    /etc/grub.d/30_os-prober
    /etc/grub.d/30_uefi-firmware
    /etc/grub.d/40_custom
    /etc/grub.d/41_custom
    /etc/grub.d/README
    /usr/bin/grub-bios-setup
    /usr/bin/grub-editenv
    /usr/bin/grub-file
    /usr/bin/grub-fstest
    /usr/bin/grub-glue-efi
    /usr/bin/grub-install
    /usr/bin/grub-kbdcomp
    /usr/bin/grub-macbless
    /usr/bin/grub-menulst2cfg
    /usr/bin/grub-mkconfig
    /usr/bin/grub-mkfont
    /usr/bin/grub-mkimage
    /usr/bin/grub-mklayout
    /usr/bin/grub-mknetdir
    /usr/bin/grub-mkpasswd-pbkdf2
    /usr/bin/grub-mkrelpath
    /usr/bin/grub-mkrescue
    /usr/bin/grub-mkstandalone
    /usr/bin/grub-mount
    /usr/bin/grub-ofpathname
    /usr/bin/grub-probe
    /usr/bin/grub-reboot
    /usr/bin/grub-render-label
    /usr/bin/grub-script-check
    /usr/bin/grub-set-default
    /usr/bin/grub-sparc64-setup
    /usr/bin/grub-syslinux2cfg
    /usr/share/bash-completion/completions/grub
    /usr/share/grub/ascii.h
    /usr/share/grub/ascii.pf2
    /usr/share/grub/euro.pf2
    /usr/share/grub/grub-mkconfig_lib
    /usr/share/grub/themes/starfield/COPYING.CC-BY-SA-3.0
    /usr/share/grub/themes/starfield/README
    /usr/share/grub/themes/starfield/blob_w.png
    /usr/share/grub/themes/starfield/boot_menu_c.png
    /usr/share/grub/themes/starfield/boot_menu_e.png
    /usr/share/grub/themes/starfield/boot_menu_n.png
    /usr/share/grub/themes/starfield/boot_menu_ne.png
    /usr/share/grub/themes/starfield/boot_menu_nw.png
    /usr/share/grub/themes/starfield/boot_menu_s.png
    /usr/share/grub/themes/starfield/boot_menu_se.png
    /usr/share/grub/themes/starfield/boot_menu_sw.png
    /usr/share/grub/themes/starfield/boot_menu_w.png
    /usr/share/grub/themes/starfield/dejavu_10.pf2
    /usr/share/grub/themes/starfield/dejavu_12.pf2
    /usr/share/grub/themes/starfield/dejavu_14.pf2
    /usr/share/grub/themes/starfield/dejavu_16.pf2
    /usr/share/grub/themes/starfield/dejavu_bold_14.pf2
    /usr/share/grub/themes/starfield/slider_c.png
    /usr/share/grub/themes/starfield/slider_n.png
    /usr/share/grub/themes/starfield/slider_s.png
    /usr/share/grub/themes/starfield/starfield.png
    /usr/share/grub/themes/starfield/terminal_box_c.png
    /usr/share/grub/themes/starfield/terminal_box_e.png
    /usr/share/grub/themes/starfield/terminal_box_n.png
    /usr/share/grub/themes/starfield/terminal_box_ne.png
    /usr/share/grub/themes/starfield/terminal_box_nw.png
    /usr/share/grub/themes/starfield/terminal_box_s.png
    /usr/share/grub/themes/starfield/terminal_box_se.png
    /usr/share/grub/themes/starfield/terminal_box_sw.png
    /usr/share/grub/themes/starfield/terminal_box_w.png
    /usr/share/grub/themes/starfield/theme.txt
    /usr/share/grub/unicode.pf2
    /usr/share/grub/widthspec.h
    /usr/share/info/grub-dev.info.gz
    /usr/share/info/grub.info-1.gz
    /usr/share/info/grub.info-2.gz
    /usr/share/info/grub.info.gz
    /usr/share/locale/en@arabic/LC_MESSAGES/grub.mo
    /usr/share/locale/en@cyrillic/LC_MESSAGES/grub.mo
    /usr/share/locale/en@greek/LC_MESSAGES/grub.mo
    /usr/share/locale/en@hebrew/LC_MESSAGES/grub.mo
    /usr/share/locale/en@piglatin/LC_MESSAGES/grub.mo
    /usr/share/locale/en@quot/LC_MESSAGES/grub.mo
    /usr/share/man/man1/grub-editenv.1.gz
    /usr/share/man/man1/grub-file.1.gz
    /usr/share/man/man1/grub-fstest.1.gz
    /usr/share/man/man1/grub-glue-efi.1.gz
    /usr/share/man/man1/grub-kbdcomp.1.gz
    /usr/share/man/man1/grub-menulst2cfg.1.gz
    /usr/share/man/man1/grub-mkfont.1.gz
    /usr/share/man/man1/grub-mkimage.1.gz
    /usr/share/man/man1/grub-mklayout.1.gz
    /usr/share/man/man1/grub-mknetdir.1.gz
    /usr/share/man/man1/grub-mkpasswd-pbkdf2.1.gz
    /usr/share/man/man1/grub-mkrelpath.1.gz
    /usr/share/man/man1/grub-mkrescue.1.gz
    /usr/share/man/man1/grub-mkstandalone.1.gz
    /usr/share/man/man1/grub-mount.1.gz
    /usr/share/man/man1/grub-render-label.1.gz
    /usr/share/man/man1/grub-script-check.1.gz
    /usr/share/man/man1/grub-syslinux2cfg.1.gz
    /usr/share/man/man8/grub-bios-setup.8.gz
    /usr/share/man/man8/grub-install.8.gz
    /usr/share/man/man8/grub-macbless.8.gz
    /usr/share/man/man8/grub-mkconfig.8.gz
    /usr/share/man/man8/grub-ofpathname.8.gz
    /usr/share/man/man8/grub-probe.8.gz
    /usr/share/man/man8/grub-reboot.8.gz
    /usr/share/man/man8/grub-set-default.8.gz
    /usr/share/man/man8/grub-sparc64-setup.8.gz
  )
  for _each_thing \
    in "${_the_rest_of_grub}"; do
    rm \
      -rf \
      "${_file}"
  done
}

_package_grub-emu() {
  cd \
    "${srcdir}/grub-emu/"
  echo \
    "Run make install for emu build..."
  make \
    DESTDIR="${pkgdir}/" \
    bashcompletiondir="/usr/share/bash-completion/completions" \
    install
  echo \
    "Remove gdb debugging related files for emu build..."
  rm \
    -f \
    "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.module || \
    true
  rm \
    -f \
    "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.image || \
    true
  rm \
    -f \
    "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/{kernel.exec,gdb_grub,gmodule.pl} || \
    true
  _rm_man
  rm \
    -f \
    "${pkgdir}/usr/share/info" || \
    true
  rm \
    -f \
    "${pkgdir}/usr/share/info" || \
    true
  _rm_rest_of_grub
}

package() {
  cd \
    "${srcdir}/grub/"
  if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    echo \
      "Package grub emu stuff..."
    _package_grub-emu
  fi
}

# vim:set sw=2 sts=-1 et:
