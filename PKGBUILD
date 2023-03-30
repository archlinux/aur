# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: SoftExpert <softexpert at gmail dot com>

_arch=x64v3
_pkgbase=linux-xanmod
_major=6.2
_minor=9
_branch=6.x
_xanmodrel=1

pkgbase=${_pkgbase}-linux-bin-${_arch}
pkgver=${_major}.${_minor}
pkgname=("${pkgbase}" "${_pkgbase}-linux-headers-bin-${_arch}")
pkgrel=2
pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (MAIN) - Prebuilt version - ${_arch}"
url="http://www.xanmod.org/"
arch=(x86_64)
license=(GPL2)
options=('!strip')
makedepends=('jq' 'curl')

# Resolve URL of sources from GiHub provider
_url_image=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${_xanmodrel} | jq --arg PKGVER "${pkgver}" --arg PKGREL "${_xanmodrel}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | startswith("linux-image-" + $PKGVER + "-" + $ARCH + "-xanmod" + $PKGREL) and endswith(".deb")).browser_download_url')
_url_headers=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${_xanmodrel} | jq --arg PKGVER "${pkgver}" --arg PKGREL "${_xanmodrel}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | startswith("linux-headers-" + $PKGVER + "-" + $ARCH + "-xanmod" + $PKGREL) and endswith(".deb")).browser_download_url')
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
sha256sums=('f28af47a8262490f8afd4a3d8ea82e5fd2991961b1e537c782ed14a13a20062e'
            '5cf3090a1719a56d011ec4a96424ea49dab08b0955e2ca334b5cd3d7b1617a60')

_package() {
  pkgdesc="The Linux kernel and modules with Xanmod patches - Current Stable (MAIN) - Prebuilt version - ${_arch}"
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

  msg2 "Installing modules..."
  cp -r lib/modules/${kernver}/* "${modulesdir}/"

  # Docs
  cp -r usr/share/doc/linux-image-* "${pkgdir}/usr/share/doc/"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "boot/vmlinuz-${kernver}" "${modulesdir}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${kernver}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the Linux Xanmod - Current Stable (MAIN) - Prebuilt version - ${_arch}"
  depends=(pahole)

  mkdir -p "${pkgdir}"/usr/share/doc
  cp -r usr/share/doc/linux-headers-* "${pkgdir}/usr/share/doc/"
  cp -r usr/src "${pkgdir}/usr/"
}

eval "package_${pkgname[0]}() { _package \"\$@\"; }"
eval "package_${pkgname[1]}() { _package-headers \"\$@\"; }"

# vim:set ts=8 sts=2 sw=2 et:
