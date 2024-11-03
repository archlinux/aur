# Maintainer: zotan <aur@zotan.email>

_pkgver=v2024.1-beta4

pkgname=iceshrimp.net-bin
pkgver=2024.1.beta4
pkgrel=1
pkgdesc="Decentralized and federated social networking service, implementing the ActivityPub standard"
arch=(x86_64 aarch64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp.net"
license=(EUPL)

makedepends=()
depends=()
optdepends=(
  "ffmpeg: for video transcoding"
)

conflicts=(iceshrimp.net)
provides=(iceshrimp.net)

backup=("etc/iceshrimp.net/configuration.ini")

install="iceshrimp.net.install"

source_x86_64=("${pkgname}-${pkgver}-linux_amd64.tar.zst::https://iceshrimp.dev/iceshrimp/Iceshrimp.NET/releases/download/${_pkgver}/Iceshrimp.NET-${_pkgver}-linux-amd64-glibc.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-linux_arm64.tar.zst::https://iceshrimp.dev/iceshrimp/Iceshrimp.NET/releases/download/${_pkgver}/Iceshrimp.NET-${_pkgver}-linux-arm64-glibc.tar.zst")

source=(
  "iceshrimp.net.service"
  "iceshrimp.net.sysusers"
  "iceshrimp.net.tmpfiles"
  "iceshrimp.net.install"
  "iceshrimp.net.hook"
)

sha512sums=('cfb7adf7e9f0d9d05ab89b2237ddf1ef4135ed9dde463e96c7cd94e03e497a85c77a795ac20c09214a2364e675c88e65ac119f6de82a08f5c2d64d657c4b3fc0'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '0665aa7af2b2aa4405289ce9119439ddcc6b9e6c81dc8e3b9ed5d8ecdc4a39d49c950d41d3098ce99fe294ce51a2dee55ec7248c1756783b0e9aad0bde4654fa'
            '0a0467df278f3bd739114725b373f5ec6c7296f609f0a9bcb4f8142b44856fc63e32f76390adf757005035dc691a4c54a662cc8a287572b61e215c29e3d3cbf2'
            '6e17d76acea901a753d2be261e17fc4113351b17f060c9eaf5cb878d6b6ab38c26efb3982411454626be4a0d21845e74ebef5efe18b11ac19b52e9c55442466a')
sha512sums_x86_64=('ec7607e4557feb84fef81e891b4ef77c8e19cea6b2edd4139eb79114769053d53b5efc29c8752dbd83c57af576cec5479d6c956b5f6a2bc39fb56034b615f8f7')
sha512sums_aarch64=('dc00e4ea6bb88578a12f4cf88caac7f146e898443de3fa302946b51de39fe66abd4634aaab1ef817da946503ae729ef78ad7befdfe6132180c5d2c3c0cd58485')

pkgver() {
  local res
  res=${_pkgver//-/.} # Replace dashes with dots
  res=${res:1} # Trim leading 'v'

  echo -n "$res"

  if [[ ${#res} -eq 7 ]]; then
    echo -n ".0" # Append .0 to major releases to make sure they sort correctly against prereleases
  fi
}

package() {
  # Add runtime-only dependencies
  depends+=(postgresql libvips openjpeg2)

  # Since we're using the release tarballs, we only need the runtime after installation
  depends+=('aspnet-runtime>=8.0' 'aspnet-runtime<9.0')

  install -dm 755 "${pkgdir}/usr/share/iceshrimp.net"
  install -dm 755 "${pkgdir}/etc/iceshrimp.net"

  targetarch=${CARCH/x86_64/amd64}
  targetarch=${targetarch/aarch64/arm64}
  xdir="${srcdir}/Iceshrimp.NET-${_pkgver}-linux-${targetarch}-glibc"

  # We are requiring libvips as a system dependency, so we can safely delete this
  rm "${xdir}/libvips.so."*

  install -Dm 644 "${srcdir}/iceshrimp.net.service" "${pkgdir}/usr/lib/systemd/system/iceshrimp.net.service"
  install -Dm 644 "${srcdir}/iceshrimp.net.sysusers" "${pkgdir}/usr/lib/sysusers.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.net.hook"
  install -Dm 640 "${xdir}/configuration.ini" "${pkgdir}/etc/iceshrimp.net/configuration.ini"

  cp -dpTr --no-preserve=ownership "${xdir}/" "${pkgdir}/usr/share/iceshrimp.net"
}
