# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname='grub2-filemanager'
_vcssuffix='-git'
pkgname="${_pkgname}${_vcssuffix}"
epoch=0
pkgver=2.11.r462.20220309.918524d
pkgrel=2
pkgdesc="A GRUB-based directory navigation and boot tool that also allows to boot EFI and ISO images."
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/a1ive/grub2-filemanager"
license=('GPL3')
depends=(
  # 'grub>=2'
  # 'grub<3'
)
makedepends=(
  'git'
  'gettext'
  'grub'
  'mtools'
  'xorriso'
)
conflicts=(
  "${_pkgname}"
)
provides=(
  "${_pkgname}=${pkgver}"
  "grubfm=${pkgver}"
)
source=(
  "${_pkgname}::git+${url}.git"                          # Official upstream git repository.
  "grub2-latest.tar.gz::https://github.com/a1ive/grub/releases/download/latest/grub2-latest.tar.gz"  # Modified GRUB for use as basis for grubfm.
  '79_grubfm'
)
sha256sums=(
  'SKIP'                                                              # Official upstream git repository.
  'SKIP'                                                              # grub2-latest.tar.gz
  '16887e65d8ac0af672713f8410d9e30eb02cf150f7419d8c0ce65d3bf21c84eb'  # 79_grubfm
)
options+=('!strip')


prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  if [ -h grub ]; then
    rm grub
  fi
  ln -s ../grub .

  if [ -d "releases" ]; then
    rm -r releases
  fi
  mkdir -p releases
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(./grub/grub-mkimage --version | awk '{print $3}')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  fi
  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  fi

  printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  printf '3\n' | ./build.sh # Echoing `3` into the script selects the language en_US.
  mv -v grubfm* loadfm "releases"/
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -dvm755 "${pkgdir}/boot/EFI/grubfm"
  install -dvm755 "${pkgdir}/boot/grubfm"
  case "$CARCH" in
    'aarch64')
      install -Dvm755 -t "${pkgdir}/boot/EFI/grubfm" releases/grubfmaa64.efi
    ;;
    'i386'|'i486'|'i586'|'i686')
      install -Dvm755 -t "${pkgdir}/boot/EFI/grubfm" releases/grubfmia32.efi
    ;;
    'x86_64')
      install -Dvm755 -t "${pkgdir}/boot/EFI/grubfm" releases/grubfmx64.efi
    ;;
  esac
  install -Dvm755 -t "${pkgdir}/boot/grubfm" releases/{loadfm,grubfm.elf}
  install -Dvm644 -t "${pkgdir}/boot/grubfm" releases/*.iso

  install -Dvm755 -t "${pkgdir}/etc/grub.d/" "${srcdir}/79_grubfm"

  install -D -m644 -v README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 -v THANKS.md "${pkgdir}/usr/share/doc/${_pkgname}/THANKS.md"

  install -D -m644 -v LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
