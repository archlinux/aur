# Maintainer: Consler <consler2000@gmail.com>

pkgname=batpu2-vm
pkgver=2.10
pkgrel=4
pkgdesc="A virtual machine/assembler for MattBatwings' redstone CPU"
arch=('x86_64')
url="https://github.com/AdoHTQ/Batpu2-VM"
license=('MIT')
depends=('python3')
source=("https://github.com/consler/Batpu2-VM/releases/download/AUR5/batpu2-vm.tar.gz")
sha256sums=('SKIP') 

check_vulkan() {
    if ! pacman -Qi vulkan-intel nvidia-utils vulkan-nouveau vulkan-radeon &> /dev/null; then
        echo "No Vulkan driver detected. Please choose a driver to install:"
        echo "1) vulkan-intel (Intel GPUs)"
        echo "2) nvidia-utils (NVIDIA GPUs)"
        echo "3) vulkan-nouveau (NVIDIA Nouveau open-source driver)"
        echo "4) vulkan-radeon (AMD GPUs)"
        read -rp "Enter the number of the driver you wish to install: " choice

        case "$choice" in
            1) sudo pacman -S --needed vulkan-intel ;;
            2) sudo pacman -S --needed nvidia-utils ;;
            3) sudo pacman -S --needed vulkan-nouveau ;;
            4) sudo pacman -S --needed vulkan-radeon ;;
            *) echo "Invalid choice. No driver installed."; exit 1 ;;
        esac
    fi
}

prepare() {
    check_vulkan
}

package() {

  mkdir -p "${pkgdir}/opt/${pkgname}"

  cp -r "${srcdir}/batpu2-vm/." "${pkgdir}/opt/${pkgname}/"

  mkdir -p "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
  Name=Batpu2-VM
  Exec=/opt/${pkgname}/Batpu2-VM.x86_64 --main-pack /opt/${pkgname}/Batpu2-VM.pck
  Icon=/opt/batpu2-vm/batpu2-vm_icon.png
  Type=Application
  Categories=Development;" > "${pkgdir}/usr/share/applications/batpu2-vm.desktop"
}
