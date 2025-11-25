# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp.net-git
pkgver=2025.1.beta5.patch2.r618.g15d70de7
pkgrel=1
pkgdesc="Decentralized and federated social networking service, implementing the ActivityPub standard"
arch=(x86_64 aarch64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp.net"
license=(EUPL)

makedepends=('dotnet-sdk>=10.0' 'aspnet-targeting-pack>=10.0' 'aspnet-targeting-pack<11.0')
depends=('aspnet-runtime>=10.0' 'aspnet-runtime<11.0')
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
            'cfb7adf7e9f0d9d05ab89b2237ddf1ef4135ed9dde463e96c7cd94e03e497a85c77a795ac20c09214a2364e675c88e65ac119f6de82a08f5c2d64d657c4b3fc0'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '0665aa7af2b2aa4405289ce9119439ddcc6b9e6c81dc8e3b9ed5d8ecdc4a39d49c950d41d3098ce99fe294ce51a2dee55ec7248c1756783b0e9aad0bde4654fa'
            '0a0467df278f3bd739114725b373f5ec6c7296f609f0a9bcb4f8142b44856fc63e32f76390adf757005035dc691a4c54a662cc8a287572b61e215c29e3d3cbf2'
            '085d94b31e8eb3109b18251381766799d45c351ec6c7ec45d6edad1915ed89fa9b32765f6deaec191a501274b791000e75ecd052af46bf5341af619b1c7a9bf7')

pkgver() {
  cd "${srcdir}/iceshrimp.net"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/^v//g;s/^([[:digit:]]+\.[[:digit:]]+)\.r/\1.0.r/g;s/-/./g'
}

rid() {
  if [[ $CARCH == "x86_64" ]]; then
    echo -n "linux-x64"
  else
    echo -n "linux-arm64"
  fi
}

sdkver() {
  cat "${srcdir}/iceshrimp.net/Directory.Build.props" | grep -oP '(?<=<TargetFramework>).*?(?=</TargetFramework>)'
}

build() {
  cd "${srcdir}/iceshrimp.net/Iceshrimp.Backend"

  if [[ -n $DISABLE_VIPS ]]; then
    VIPS=false
  else
    VIPS=true
  fi

  if [[ -n $DISABLE_AOT ]] || ! dotnet workload list | grep -q '^wasm-tools\s'; then
    dotnet publish -c Release -r $(rid) -p:EnableLibVips=$VIPS -p:DeterministicSourcePaths=true -p:ContinuousIntegrationBuild=true
  else
    dotnet publish -c Release -r $(rid) -p:EnableAOT=true -p:EnableLibVips=$VIPS -p:DeterministicSourcePaths=true -p:ContinuousIntegrationBuild=true
  fi
}

package() {
  # Add runtime-only dependencies
  depends+=(postgresql)

  if [[ -n $DISABLE_VIPS ]]; then
    # Add runtime-only dependencies for libvips image processing
    depends+=(libvips openjpeg2)
  fi

  install -dm 755 "${pkgdir}/usr/share/iceshrimp.net"
  install -dm 755 "${pkgdir}/etc/iceshrimp.net"

  install -Dm 644 "${srcdir}/iceshrimp.net/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/iceshrimp.net.service" "${pkgdir}/usr/lib/systemd/system/iceshrimp.net.service"
  install -Dm 644 "${srcdir}/iceshrimp.net.sysusers" "${pkgdir}/usr/lib/sysusers.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/iceshrimp.net.conf"
  install -Dm 644 "${srcdir}/iceshrimp.net.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.net.hook"
  install -Dm 640 "${srcdir}/iceshrimp.net/Iceshrimp.Backend/configuration.ini" "${pkgdir}/etc/iceshrimp.net/configuration.ini"

  cp -dpTr --no-preserve=ownership "${srcdir}/iceshrimp.net/Iceshrimp.Backend/bin/Release/$(sdkver)/$(rid)/publish/" "${pkgdir}/usr/share/iceshrimp.net"
}
