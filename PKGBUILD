# Maintainer: SoftExpert <softexpert at gmail dot com>
# Contributor: Joan Figueras <ffigue at gmail dot com>

_arch=x64v2
_pkgbase=linux-xanmod-edge
_major=7.1
_minor=1
_branch=7.x
_xanmodrel=1
_xanmodrev=
pkgrel=1

check_psabi() {
  awk 'BEGIN {
      while (!/flags/) if (getline < "/proc/cpuinfo" != 1) exit 1
      if (/lm/&&/cmov/&&/cx8/&&/fpu/&&/fxsr/&&/mmx/&&/syscall/&&/sse2/) level = 1
      if (level == 1 && /cx16/&&/lahf/&&/popcnt/&&/sse4_1/&&/sse4_2/&&/ssse3/) level = 2
      if (level == 2 && /avx/&&/avx2/&&/bmi1/&&/bmi2/&&/f16c/&&/fma/&&/abm/&&/movbe/&&/xsave/) level = 3
      if (level == 3 && /avx512f/&&/avx512bw/&&/avx512cd/&&/avx512dq/&&/avx512vl/) level = 4
      if (level > 0) { print "x64v" level }
  }' 2>/dev/null||echo "x64v1"
}

psabi="$(check_psabi)"

pkgbase=${_pkgbase}-linux-bin-${_arch}
pkgver=${_major}.${_minor}
pkgname=("${pkgbase}" "${_pkgbase}-linux-headers-bin-${_arch}")
pkgdesc="The Linux kernel and modules with Xanmod patches - Rolling Release (EDGE) - Prebuilt version - ${_arch}"
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
options=('!strip')
makedepends=('libxml2' 'curl')

provides=("${_pkgbase}")
conflicts=("linux-xanmod-linux-bin-${_arch}")
replaces=("linux-xanmod-linux-bin-${_arch}" "${_pkgbase}")

# Resolve URL of sources from SourceForge provider and cache the response of the API to reduce the number of calls made
_xml_data=$(curl -L -s "https://sourceforge.net/projects/xanmod/rss?path=/releases/edge")

# retrieve the headers URL and remove the "/download" suffix
_t=$(echo "${_xml_data}" | xmllint --xpath "string(//*[local-name()='content'][@type='application/vnd.debian.binary-package; charset=binary' and contains(@url, '${_arch}') and contains(@url, 'linux-headers') and contains(@url, '${pkgver}')]/@url)" -)
_url_headers="${_t//'/download'}"

# retrieve the image URL and remove the "/download" suffix
_t=$(echo "${_xml_data}" | xmllint --xpath "string(//*[local-name()='content'][@type='application/vnd.debian.binary-package; charset=binary' and contains(@url, '${_arch}') and contains(@url, 'linux-image') and not(contains(@url, '-dbg_')) and contains(@url, '${pkgver}')]/@url)" -)
_url_image="${_t//'/download'}"

source=("${_url_image}" "${_url_headers}")
noextract=("${_url_image}" "${_url_headers}")

# Save files we will extract later manually
_file_image="${_url_image##*/}"
_file_headers="${_url_headers##*/}"

prepare() {
  bsdtar -xf ${_file_image} data.tar.xz
  bsdtar -xf data.tar.xz
  rm -f data.tar.xz
  bsdtar -xf ${_file_headers} data.tar.xz
  bsdtar -xf data.tar.xz
  rm -f data.tar.xz
  
  echo ${psabi}
}

validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('bf817ea170929bfa399e291debe47e6cb94f66b9bde1ecbce1b7a2f3d8e5de6c'
            '136a83fa18a05ec516821caaa20511e091e49ce215356012d5d2216be2f11114')

_package() {
  pkgdesc="The Linux kernel and modules with Xanmod patches - Rolling Release (EDGE) - Prebuilt version - ${_arch}"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE
            KSMBD-MODULE
            NTFS3-MODULE)

  local kernver="${pkgver}-${_arch}-xanmod${_xanmodrel}"
  local modulesdir="${pkgdir}/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}" "${pkgdir}/usr/share/doc"
  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}

  msg2 "Installing modules..."
  cp -r lib/modules/${kernver}/* "${modulesdir}/"

  # Docs
  cp -r usr/share/doc/linux-image-* "${pkgdir}/usr/share/doc/"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "boot/vmlinuz-${kernver}" "${modulesdir}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"
  # echo "${kernver}" | install -Dm644 /dev/stdin "${modulesdir}/kernelbase"
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${modulesdir}/kernelbase"

  # write kernel version for Grub
  echo "${kernver}${_xanmodrev}" | install -Dm644 /dev/stdin "${pkgdir}/boot/${pkgbase}.kver"

  local _extramodules="extramodules-${kernver}"
  ln -s "../${_extramodules}" "${modulesdir}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${kernver}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

  # Remove builddir because is a symbolic link and it belongs to headers
  rm -f "${modulesdir}/build"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the Linux Xanmod - Rolling Release (EDGE) - Prebuilt version - ${_arch}"
  depends=(pahole)

  local kernver="${pkgver}-${_arch}-xanmod${_xanmodrel}"
  local builddir="${pkgdir}/usr/lib/modules/${kernver}/build"
  mkdir -p "${pkgdir}"/usr/share/doc "${pkgdir}"/usr/src "${pkgdir}/usr/lib/modules/${kernver}"
  cp -r usr/share/doc/linux-headers-* "${pkgdir}/usr/share/doc/"
  cp -r usr/src/linux-headers-${kernver} "${builddir}"
  ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
}

eval "package_${pkgname[0]}() { _package \"\$@\"; }"
eval "package_${pkgname[1]}() { _package-headers \"\$@\"; }"

# vim:set ts=8 sts=2 sw=2 et:
