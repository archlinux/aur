# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp.net-git
pkgver=v2024.1.alpha+b9fa870
pkgrel=2
pkgdesc="The Iceshrimp .NET rewrite. Caution: This is alpha software, do not use with production database"
arch=(x86_64 aarch64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp.net"
license=(EUPL)

makedepends=('dotnet-sdk>=8.0' 'aspnet-targeting-pack>=8.0' 'aspnet-targeting-pack<9.0')
depends=('aspnet-runtime>=8.0' 'aspnet-runtime<9.0')
optdepends=(
  "ffmpeg: for video transcoding"
)

conflicts=(iceshrimp.net)
provides=(iceshrimp.net)

backup=("etc/iceshrimp.net/configuration.ini")

install="iceshrimp.net.install"

source=(
  "iceshrimp.net::git+https://iceshrimp.dev/iceshrimp/iceshrimp.net.git#branch=dev"
  "iceshrimp.net.service"
  "iceshrimp.net.sysusers"
  "iceshrimp.net.tmpfiles"
  "iceshrimp.net.install"
  "iceshrimp.net.hook"
)

sha512sums=('SKIP'
            '33bbf52dcb98020c88e2df373f1ed2614d6a4456b484b9558496807747bb1c9723910bd83c8d2ffd03fa68aff4e49165a5f9f8d018d6344b1baffc4370cbef37'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '5442057a07f50f9fe7f3d335339c507b7233249c39f52e31d6ce698ed1e31715c416e50e6fb810f22bc1f5e78c9f12027240a9f9a25eba166e486a027e31e714'
            '0a0467df278f3bd739114725b373f5ec6c7296f609f0a9bcb4f8142b44856fc63e32f76390adf757005035dc691a4c54a662cc8a287572b61e215c29e3d3cbf2'
            'fe5bc19c5f84e77954a023d054414f355b21918465f11ffcd09c139d1ce9de6258b12d4be5a0a6123844bc0f1458a9b45e49d2619440b3124f30d3dea3a7c6fb')

pkgver() {
  cd "${srcdir}/iceshrimp.net"
  #git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  echo -n "v2024.1.alpha+"
  git rev-parse --short HEAD
}

rid() {
  if [[ $CARCH == "x86_64" ]]; then
    echo -n "linux-x64"
  else
    echo -n "linux-arm64"
  fi
}

build() {
  cd "${srcdir}/iceshrimp.net/Iceshrimp.Backend"

  if [[ -n $DISABLE_AOT ]] || ! dotnet workload list | grep -q '^wasm-tools\s'; then
    dotnet publish -c Release -r $(rid)
  else
    dotnet publish -c Release -r $(rid) -p:EnableAOT=true
  fi
}

package() {
  # Add runtime-only dependencies
  depends+=(postgresql)

  install -dm 755 "${pkgdir}/usr/share/iceshrimp.net"
  install -dm 755 "${pkgdir}/etc/iceshrimp.net"

  install -Dm 644 "${srcdir}/iceshrimp.net/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/iceshrimp.net.service" "${pkgdir}/usr/lib/systemd/system/iceshrimp.net.service"
  install -Dm 644 "${srcdir}/iceshrimp.net.sysusers" "${pkgdir}/usr/lib/sysusers.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.net.hook"
  install -Dm 640 "${srcdir}/iceshrimp.net/Iceshrimp.Backend/configuration.ini" "${pkgdir}/etc/iceshrimp.net/configuration.ini"

  cp -dpTr --no-preserve=ownership "${srcdir}/iceshrimp.net/Iceshrimp.Backend/bin/Release/net8.0/$(rid)/publish/" "${pkgdir}/usr/share/iceshrimp.net"
}
