# Maintainer: SoftExpert <softexpert at gmail dot com>
# Contributor: Joan Figueras <ffigue at gmail dot com>

_arch=x64v4
_pkgbase=linux-xanmod-edge
_major=6.7
_minor=0
_branch=6.x
_xanmodrel=1
_xanmodrev=
pkgrel=1

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
_t=$(echo "${_xml_data}" | xmllint --debug --xpath "string(//*[local-name()='content'][@type='application/x-debian-package; charset=binary' and contains(@url, '"${_arch}"') and contains(@url, 'linux-headers') and contains(@url, '"${pkgver}"')]/@url)" -)
_url_headers="${_t//'/download'}"

# retrieve the image URL and remove the "/download" suffix
_t=$(echo "${_xml_data}" | xmllint --debug --xpath "string(//*[local-name()='content'][@type='application/x-debian-package; charset=binary' and contains(@url, '"${_arch}"') and contains(@url, 'linux-image') and not(contains(@url, '-dbg_')) and contains(@url, '"${pkgver}"')]/@url)" -)
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
}

validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)
sha256sums=('fbca29ff2d3c31263e5e574f41f9197df7eb6a0703b84823ff689f0012c3008f'
            'cf36589779b2285817af21b2f7d7f01ff45ea3322d08012dbfc20897da1104e4')

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

  # now we call depmod...
  # depmod -b "${pkgdir}/usr" -F "${srcdir}/boot/System.map-${kernver}"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the Linux Xanmod - Rolling Release (EDGE) - Prebuilt version - ${_arch}"
  depends=(pahole)

  mkdir -p "${pkgdir}"/usr/share/doc
  cp -r usr/share/doc/linux-headers-* "${pkgdir}/usr/share/doc/"
  cp -r usr/src "${pkgdir}/usr/"
}

eval "package_${pkgname[0]}() { _package \"\$@\"; }"
eval "package_${pkgname[1]}() { _package-headers \"\$@\"; }"

# vim:set ts=8 sts=2 sw=2 et:
