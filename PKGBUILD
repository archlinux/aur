# Author:   Ishitatsuyuki 
# Packager: Adrian Lopez <zeioth@hotmail.com>
pkgname=latencyflex2-git
_pkgname=latencyflex2
pkgver=1.0
pkgrel=1
pkgdesc="Allow you to enable Reflex in compatible games."
arch=(any)
url="https://github.com/Zeioth/LatencyFlex2-installer"
license=('Apache 2.0')
makedepends=(git rustup wine meson glslang python3 mingw-w64-binutils  mingw-w64-crt  mingw-w64-gcc  mingw-w64-headers  mingw-w64-winpthreads)
provides=(latencyflex2-git)
conflicts=(latencyflex2 latencyflex latencyflex-git)
source=("git+$url")
sha256sums=('SKIP')

build() {
 
  # Compiling the core module
  git clone https://github.com/ishitatsuyuki/latencyflex2.git -b v2.0.0-alpha.2
  cd ./latencyflex2/core
  cargo build --release --target x86_64-pc-windows-gnu
  cd ../..

  # Compiling the DXVK fork
  git clone --recursive https://github.com/ishitatsuyuki/dxvk.git -b lfx2-v2.0.0-alpha.2
  cd dxvk
  ./package-release.sh lfx2-v2.0.0-alpha.2 ./target --no-package
  cd ..

  # Compiling the DXVK-NVAPI fork
  git clone --recursive https://github.com/ishitatsuyuki/dxvk-nvapi.git -b lfx2-v2.0.0-alpha.2
  cd dxvk-nvapi
  ./package-release.sh lfx2-v2.0.0-alpha.2 ./target
  cd ..

  # Compiling the VKD3D-Proton fork
  git clone --recursive https://github.com/ishitatsuyuki/vkd3d-proton.git -b lfx2-v2.0.0-alpha.2
  cd vkd3d-proton
  ./package-release.sh lfx2-v2.0.0-alpha.2 ./target --no-package
  cd ..
}

package() {
  # For each steam game, install latencyflex into system32
  for COMPATDATA in ~/.steam/steam/steamapps/compatdata/* ; do
    yes | cp "./latencyflex2/core/target/x86_64-pc-windows-gnu/release/latencyflex2_rust.dll" "$COMPATDATA/pfx/drive_c/windows/system32/"
    echo "Latency flex installed in $COMPATDATA"
  done

  # For each proton version
  for PROTON_PATH in ~/.steam/steam/steamapps/common/"Proton - Experimental" ; do
    # Install the DXVK fork
    chmod 655 "$PROTON_PATH"/files/lib64/wine/dxvk/*
    yes | cp ./dxvk/target/dxvk-lfx2-v2.0.0-alpha.2/x64/*.dll "$PROTON_PATH/files/lib64/wine/dxvk/"
    chmod 555 "$PROTON_PATH"/files/lib64/wine/dxvk/*
    echo "DXVK fork installed in $PROTON_PATH"

    # Install dxvk-nvapi fork
    chmod 655 "$PROTON_PATH"/files/lib64/wine/nvapi/*
    yes | cp ./dxvk-nvapi/target/dxvk-nvapi-lfx2-v2.0.0-alpha.2/x64/*.dll "$PROTON_PATH/files/lib64/wine/nvapi/"
    chmod 555 "$PROTON_PATH"/files/lib64/wine/nvapi/*
    echo "DXKV-NVAPI installed in $PROTON_PATH"

    # Install vkd3d-proton fork
    chmod 655 "$PROTON_PATH"/files/lib64/wine/vkd3d-proton/*
    yes | cp ./vkd3d-proton/target/vkd3d-proton-lfx2-v2.0.0-alpha.2/x64/*.dll "$PROTON_PATH/files/lib64/wine/vkd3d-proton/"
    chmod 555 "$PROTON_PATH"/files/lib64/wine/vkd3d-proton/*
    echo "DXVK-NVAPI installed in $PROTON_PATH"
  done




  ##### CREATE - dxvk.conf #####

  mkdir -p ~/.local/share/latency-flex/
  echo "dxgi.customVendorId = 10de" > ~/.local/share/latency-flex/dxvk.conf




  ##### SHOW INSTALLED FILES #####
  for GAME in ~/.steam/steam/steamapps/compatdata/* ; do
    ls -l "$GAME"/pfx/drive_c/windows/system32/ | grep latencyflex2_rust.dll
  done
  ls -I openvr_api_dxvk.dll -I version -l ~/.steam/steam/steamapps/common/"Proton - Experimental"/files/lib64/wine/dxvk
  ls -I version -l ~/.steam/steam/steamapps/common/"Proton - Experimental"/files/lib64/wine/nvapi
  ls -I version -I d3d12core.dll -l ~/.steam/steam/steamapps/common/"Proton - Experimental"/files/lib64/wine/vkd3d-proton
  ls -l ~/.local/share/latency-flex/dxvk.conf
  echo "---------------------------"
  echo "- List of installed files"
}


