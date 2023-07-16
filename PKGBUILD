#
# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
#
# Inspired by AUR package "linux-bnx2x-2.5g" from 
# Charles Leclerc <charles[at]la-mouette[d0t]net>
#
# Goal:
# - Maintain compataiblity with 'linux-lts' and 'linux' Arch kernels
#
# Usage:
#   rmmod bnx2x; modprobe bnx2x-2500m
#
# Todo:
# - Consider how to handle LTS kernels better? Backport patches?

_pkgbase=bnx2x-2500m
pkgname="$_pkgbase-dkms"
# Don't need to update unless there's an upstream change!
pkgver=6.4.2.arch1
pkgrel=1
pkgdesc='Broadcom bnx2x driver with 2500 Mbps HSGMII patch'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="https://github.com/archlinux/linux/commits/$_srctag"
arch=(x86_64)
license=(GPL2)

makedepends=('git')
depends=('dkms' 'linux-firmware-bnx2x')

_ksrcname=archlinux-linux
source=(
  "$_ksrcname::git+https://github.com/archlinux/linux?signed#tag=$_srctag"
  "0001-bnx2x-Add-support-for-2.5-Gbps-HSGMII-mode.patch"
  "0002-bnx2x-Handle-DEFINE_SEMAPHORE-for-older-kernels.patch"
  "0003-bnx2x-Handle-skb_vlan_eth_hdr-for-older-kernels.patch"
  "0004-bnx2x-Handle-build_skb-helper-for-older-kernels.patch"
  "dkms.conf"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
  'C7E7849466FE2358343588377258734B41C31549'  # David Runge <dvzrv@archlinux.org>
)
sha256sums=('SKIP'
            'e953356ac35b28bf0e1a31090689d51fd18ea7ec853282ae820f0b3ef1a85151'
            'b714961a3ff24f9cf2e8617d27a3b417cd6407c00e5982f42e8a5004ab0f8249'
            'b1b0d90fd1047def666c9311d3c5f91fd4a9d68bb0bb644e4859b40a0e505b24'
            '25711bb089f0d60f82d882e9d4cf3ef6e62e38c0c22942424e08bed714eb597e'
            '9e8de01f4f7d7ed966cd979bc4e41bee95f37398327a094cc705d7e590c06f2a')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$_pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_dkms_name=$_pkgbase-$pkgver

prepare() {
  cd $_ksrcname

  # Apply patches here instead of complicating with patching at dkms build time.
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

package() {
  mkdir -p "$pkgdir/usr/src/$_dkms_name/"
  cd "$pkgdir/usr/src/$_dkms_name/"

  # Create dkms compatible kernel module dir
  cp -a "$srcdir/$_ksrcname/drivers/net/ethernet/broadcom/cnic"* \
        "$srcdir/$_ksrcname/drivers/net/ethernet/broadcom/bnx2x" \
        .

  # Rename module bnx2x -> bnx2x-2500m, this seems like the least hacky way to
  # do this.
  sed -i -e "s:\(${_pkgbase%-*}\):${_pkgbase}:" bnx2x/Makefile

  echo 'obj-$(CONFIG_BNX2X) += bnx2x/' > "Makefile"
  
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@_PKGVER@/${pkgver}/" \
      "$srcdir/dkms.conf" > dkms.conf

  mkdir -p "${pkgdir}/usr/lib/modprobe.d/"
  echo blacklist bnx2x > "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
