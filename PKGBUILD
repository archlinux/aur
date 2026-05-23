# Maintainer: bethropolis <bethropolis at gmail dot com>
pkgname=kcd-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Lightweight, headless implementation of the KDE Connect protocol (v8) written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/bethropolis/kcd"
license=('MIT')
depends=('glibc')
options=('!strip' '!debug')
install=kcd.install
optdepends=(
  'libnotify: for desktop notifications'
  'wl-clipboard: for Wayland clipboard sync'
  'xclip: for X11 clipboard sync'
  'sshfs: for SFTP mounting support'
  'playerctl: for MPRIS media control'
  'ydotool: for Wayland mousepad support'
  'xdotool: for X11 mousepad support'
  'wtype: for Wayland keyboard emulation'
  'python-nautilus: for Nautilus file manager integration'
)
provides=('kcd')
conflicts=('kcd')

# Source files
source_x86_64=("https://github.com/bethropolis/kcd/releases/download/v$pkgver/kcd_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/bethropolis/kcd/releases/download/v$pkgver/kcd_${pkgver}_linux_aarch64.tar.gz")
source_armv7h=("https://github.com/bethropolis/kcd/releases/download/v$pkgver/kcd_${pkgver}_linux_armv7.tar.gz")

# checksums
sha256sums_x86_64=('afb1179add1cb744ccc631b486b140469a0bae3cbc3ad2ac088103d28314b5d1')
sha256sums_aarch64=('66c350eda1cf12f39d6f035d0f6a4b5f7c0f88aa6522f10484226c0476e8e283')
sha256sums_armv7h=('0cef37770753e40b7d983f4636dd542cacfcdfe54ab5a6d60310cdf3ce25bbaf')

package() {
  # Executable
  install -Dm755 kcd "${pkgdir}/usr/bin/kcd"
  
  # systemd units
  install -Dm644 packaging/kcd-pkg.service "${pkgdir}/usr/lib/systemd/user/kcd.service"
  install -Dm644 packaging/kcd-system.service "${pkgdir}/usr/lib/systemd/system/kcd@.service"
  
  # Documentation & examples
  install -Dm644 packaging/kcd.example.toml "${pkgdir}/usr/share/doc/kcd/kcd.example.toml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/kcd/README.md"
  
  # Shell completions
  install -Dm644 packaging/kcd.bash-completion "${pkgdir}/usr/share/bash-completion/completions/kcd"
  install -Dm644 packaging/kcd.zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_kcd"
  install -Dm644 packaging/kcd.fish-completion "${pkgdir}/usr/share/fish/vendor_completions.d/kcd.fish"
  
  # Nautilus extension
  install -Dm644 packaging/nautilus-kcd.py "${pkgdir}/usr/share/nautilus-python/extensions/nautilus-kcd.py"

  # Firewall profiles
  install -Dm644 packaging/firewalld-kcd.xml "${pkgdir}/usr/lib/firewalld/services/kcd.xml"
  install -Dm644 packaging/ufw-kcd "${pkgdir}/etc/ufw/applications.d/kcd"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
