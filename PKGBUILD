# Maintainer: glitchxmalde <maldemoksh437@gmail.com>
pkgname=reconsage
pkgver=1.0.1
pkgrel=1
pkgdesc="Advanced Network & Telemetry Reconnaissance Framework"
arch=('x86_64')
url="https://github.com/moksh-codedeveloper/ReconSage_CLI"
license=('GPL3')
depends=('dotnet-runtime' 'openssl')
makedepends=('cmake' 'gcc' 'dotnet-sdk')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/moksh-codedeveloper/ReconSage_CLI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4331a4c481eb2f6cdeec4138a403347d3a9d8da287b1e7edbf7ad6e3dfae866d')

build() {
  cd "ReconSage_CLI-$pkgver"

  msg2 "Building C++ Native Engine (reconsage_native.so)..."
  mkdir -p Native_CPP_build/build
  cd Native_CPP_build/build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j$(nproc)
  cd ../..

  msg2 "Building C# Orchestrator..."
  dotnet publish -c Release -o publish_out
}

package() {
  cd "ReconSage_CLI-$pkgver"

  install -d "$pkgdir/opt/reconsage"
  install -d "$pkgdir/usr/bin"

  cp -r publish_out/* "$pkgdir/opt/reconsage/"

  # Installs the compiled C++ engine directly into /opt/reconsage
  install -Dm755 bin/Debug/net10.0/reconsage_native.so "$pkgdir/opt/reconsage/reconsage_native.so"

  # Create a wrapper executable in PATH
  echo '#!/usr/bin/env bash' > "$pkgdir/usr/bin/reconsage"
  echo 'exec dotnet /opt/reconsage/ReconSage_Cli.dll "$@"' >> "$pkgdir/usr/bin/reconsage"
  chmod +x "$pkgdir/usr/bin/reconsage"
}

