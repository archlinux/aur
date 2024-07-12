# Maintainer: zotan <aur@zotan.email>

_pkgver=v2024.1-beta2.security1

pkgname=iceshrimp.net
pkgver=2024.1.beta2.security1
pkgrel=2
pkgdesc="Decentralized and federated social networking service, implementing the ActivityPub standard"
arch=(x86_64 aarch64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp.net"
license=(EUPL)

makedepends=()
depends=('aspnet-runtime>=8.0' 'aspnet-runtime<9.0')
optdepends=(
  "ffmpeg: for video transcoding"
)

backup=("etc/iceshrimp.net/configuration.ini")

install="iceshrimp.net.install"

source_x86_64=("${pkgname}-${pkgver}-linux_amd64.tar.zst::https://iceshrimp.dev/iceshrimp/Iceshrimp.NET/releases/download/${_pkgver}/Iceshrimp.NET-${_pkgver}-linux-amd64.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-linux_arm64.tar.zst::https://iceshrimp.dev/iceshrimp/Iceshrimp.NET/releases/download/${_pkgver}/Iceshrimp.NET-${_pkgver}-linux-arm64.tar.zst")

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
            'fe5bc19c5f84e77954a023d054414f355b21918465f11ffcd09c139d1ce9de6258b12d4be5a0a6123844bc0f1458a9b45e49d2619440b3124f30d3dea3a7c6fb')
sha512sums_x86_64=('a1884b3fd3c5b5dca9ec525c277d623a4d31538764111aa2aa5091ddd6b30e1631dbea5709156d5d32f911f698df2c9d1dbce37612e970d6816d2fa22a26b456')
sha512sums_aarch64=('a63454278e47f5530e0ea6966c3c6e47676ab02f5c6d7ab81865b7c1a57cc3fc8a8a8c0ce8f1b84950f8a32730ebca08b6bdf7b1f101d2ec9974e03b6f5b5acb')

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

  install -dm 755 "${pkgdir}/usr/share/iceshrimp.net"
  install -dm 755 "${pkgdir}/etc/iceshrimp.net"

  xdir="${srcdir}/Iceshrimp.NET-${_pkgver}"

  # We are requiring libvips as a system dependency, so we can safely delete this
  rm "${xdir}/libvips.so."*

  install -Dm 644 "${srcdir}/iceshrimp.net.service" "${pkgdir}/usr/lib/systemd/system/iceshrimp.net.service"
  install -Dm 644 "${srcdir}/iceshrimp.net.sysusers" "${pkgdir}/usr/lib/sysusers.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.net.hook"
  install -Dm 640 "${xdir}/configuration.ini" "${pkgdir}/etc/iceshrimp.net/configuration.ini"

  cp -dpTr --no-preserve=ownership "${xdir}/" "${pkgdir}/usr/share/iceshrimp.net"
}
