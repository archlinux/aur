#pkgbase=libnvidia-container-bin
#pkgname=(libnvidia-container1 libnvidia-container-tools nvidia-container-runtime nvidia-container-toolkit nvidia-container-toolkit-base nvidia-docker2)
pkgname=libnvidia-container-bin

pkgver=1.14.5
pkgrel=1
_pkgname_tools=libnvidia-container-tools
_pkgname_tools=libnvidia-container-tools
_pkglist=(libnvidia-container1 libnvidia-container-tools nvidia-container-runtime nvidia-container-toolkit nvidia-container-toolkit-base nvidia-docker2)
pkgdesc='NVIDIA container runtime library'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('Apache')
depends=(libcap libseccomp libtirpc)
provides=(libnvidia-container libnvidia-container1 libnvidia-container-tools nvidia-container-runtime nvidia-container-toolkit nvidia-container-toolkit-base nvidia-docker2)
conflicts=(libnvidia-container libnvidia-container1 libnvidia-container-tools nvidia-container-runtime nvidia-container-toolkit nvidia-container-toolkit-base nvidia-docker2)

source=("https://nvidia.github.io/libnvidia-container/stable/deb/amd64/./${_pkglist[0]}_${pkgver}-1_amd64.deb"
"https://nvidia.github.io/libnvidia-container/stable/deb/amd64/./${_pkglist[1]}_${pkgver}-1_amd64.deb"
"https://nvidia.github.io/libnvidia-container/stable/deb/amd64/./${_pkglist[2]}_3.14.0-1_all.deb"
"https://nvidia.github.io/libnvidia-container/stable/deb/amd64/./${_pkglist[3]}_${pkgver}-1_amd64.deb"
"https://nvidia.github.io/libnvidia-container/stable/deb/amd64/./${_pkglist[4]}_${pkgver}-1_amd64.deb"
"https://nvidia.github.io/libnvidia-container/stable/deb/amd64/./${_pkglist[5]}_2.14.0-1_all.deb")
sha256sums=('5f9aba9303c520915c6dd384e88fc126438a745460917beca0cacaceca808b42'
            '8e02a8a1cd0c79ab0e9dec1aaecd46fdb67932b589278e5ece50ed4aa8e4ce78'
            'fe425ba3a1008748b123ce0cc50835b4a29f4000df5a88d7b22479514a8fb795'
            '8716342164eca1008d9eabb9c20830b7d4e527b600e09723ef24143ba036400a'
            '1c2fda706646105d3f8f2cf70769d2870ad8e300443396b2182eb86c373b65b1'
            'f4d01406e7e38ce810c0b3ba44c56842abc1ee38affa4c6a8a56da7989f17b2e')
install=libnvidia-container-bin.install

prepare() {
  for package in "${_pkglist[@]}"; do
    mkdir -p "$srcdir/${package}/"
    if [[ "${package}" -eq "nvidia-container-toolkit" ]]; then
      ar -xv "${package}"_*.deb; ls -al; tar -xf "data.tar.xz" -C "$srcdir/${package}/"
    else
      tar -xf "${package}"_*.tar.zst -C "$srcdir/${package}/"
    fi
  done
}

package() {
  for package in "${_pkglist[@]}"; do
    echo "install  - ** $srcdir/${package} **"
    install_pkg "$srcdir/${package}"
  done
}

install_pkg() {
  cd "${1}"
  echo "${PWD}"
  find usr/bin -type f -exec install -Dm755 "{}" "$pkgdir/{}" \; || true
  find usr/lib -type f -exec install -Dm755 "{}" "$pkgdir/{}" \; || true
  find usr/share -type f -exec install -Dm755 "{}" "$pkgdir/{}" \; || true
  find etc -type f -exec install -Dm755 "{}" "$pkgdir/{}" \; || true
}
