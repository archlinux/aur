#pkgbase=libnvidia-container-bin
#pkgname=(libnvidia-container1 libnvidia-container-tools nvidia-container-runtime nvidia-container-toolkit nvidia-container-toolkit-base nvidia-docker2)
pkgname=libnvidia-container-bin

pkgver=1.14.6
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
sha256sums=('a1bf234c2f97fe45c183b2eba8beed82da5fe0a589bb2c9136046d5a0bd759bf'
            'c7c338095a77a8787b7644afa9462c355512ff480ad4b63abf9e3eb97734e51a'
            'fe425ba3a1008748b123ce0cc50835b4a29f4000df5a88d7b22479514a8fb795'
            '1599a5a7a2248a4e061bec92ff8f0be831b239d9fcd08d1a4c0fad0fd57e9a82'
            'c814a4681b6e553f4534ea186e3ef8adf9ccad97b4a277524d75bc21d07d20c4'
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
