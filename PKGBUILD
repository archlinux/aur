# Maintainer: jarh4x <fernando@cachyos.com>
pkgname=linuxtask-git
_pkgname=LinuxTask
pkgver=2.0.r1.g01c3206
pkgrel=1
pkgdesc="Minimalist high-performance macro recorder for Linux (Hyprland/Wayland)"
arch=('any')
url="https://github.com/JADRT22/LinuxTask"
license=('MIT')
depends=('python' 'python-evdev' 'python-customtkinter' 'hyprland')
makedepends=('git')
provides=('linuxtask')
conflicts=('linuxtask')
source=("git+https://github.com/JADRT22/LinuxTask.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  
  # Instala os arquivos principais em /usr/share/linuxtask
  mkdir -p "$pkgdir/usr/share/linuxtask"
  cp -r * "$pkgdir/usr/share/linuxtask/"
  
  # Cria o atalho no menu
  install -Dm644 "$pkgdir/usr/share/linuxtask/install.sh" -t /tmp/dummy # ignore script
  
  # Cria o comando linuxtask para o binário do sistema
  mkdir -p "$pkgdir/usr/bin"
  echo -e "#!/bin/bash
python /usr/share/linuxtask/main.py "\$@"" > "$pkgdir/usr/bin/linuxtask"
  chmod +x "$pkgdir/usr/bin/linuxtask"

  # Desktop Entry (Ajustado para o path do AUR)
  mkdir -p "$pkgdir/usr/share/applications"
  echo -e "[Desktop Entry]
Name=LinuxTask
Comment=Macro Recorder Minimalista
Exec=/usr/bin/linuxtask
Icon=input-mouse
Terminal=false
Type=Application
Categories=Utility;Automation;
StartupNotify=true" > "$pkgdir/usr/share/applications/linuxtask.desktop"
}
