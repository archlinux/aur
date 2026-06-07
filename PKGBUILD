# Maintainer: Biryukov Nikita <n.biryukov.04@gmail.com>
pkgname=sddm-theme-aurora-greeter-git
_pkgname=aurora-greeter
pkgver=r7.0a1baf8
pkgrel=1
pkgdesc="A premium, dynamic SDDM greeter theme with hardware-accelerated video loops and companion CLI ctl tool."
arch=('any')
url="https://github.com/Execorn/aurora-greeter"
license=('MIT')
depends=('sddm' 'qt6-5compat' 'qt6-declarative' 'qt6-multimedia' 'gst-plugins-good' 'gst-libav' 'python')
makedepends=('git')
provides=("sddm-theme-aurora-greeter")
conflicts=("sddm-theme-aurora-greeter")
source=("git+https://github.com/Execorn/aurora-greeter.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install theme directory
  install -d "${pkgdir}/usr/share/sddm/themes/aurora-greeter"
  cp -r * "${pkgdir}/usr/share/sddm/themes/aurora-greeter/"

  # Remove setup/development files from system package
  rm -rf "${pkgdir}/usr/share/sddm/themes/aurora-greeter/.git"
  rm -f "${pkgdir}/usr/share/sddm/themes/aurora-greeter/install.sh"
  rm -f "${pkgdir}/usr/share/sddm/themes/aurora-greeter/install-hw-accel.sh"
  rm -f "${pkgdir}/usr/share/sddm/themes/aurora-greeter/screenshot.sh"
  rm -f "${pkgdir}/usr/share/sddm/themes/aurora-greeter/README.md"
  rm -f "${pkgdir}/usr/share/sddm/themes/aurora-greeter/LICENSE"

  # Create symlink for companion CLI tool
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/sddm/themes/aurora-greeter/sddm-aurora-ctl" "${pkgdir}/usr/bin/sddm-aurora-ctl"

  # Ensure sddm-aurora-ctl is executable
  chmod 755 "${pkgdir}/usr/share/sddm/themes/aurora-greeter/sddm-aurora-ctl"

  # Install LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
