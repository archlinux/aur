# Maintainer: bethropolis <bethropolis at gmail dot com>

pkgname='kcd'
pkgver=1.19.1
pkgrel=1
pkgdesc='Lightweight, headless implementation of the KDE Connect protocol (v8) written in Go'
url='https://github.com/bethropolis/kcd'
arch=('x86_64' 'aarch64')
license=('MIT')
provides=('kcd')
conflicts=('kcd-bin')
depends=('glibc')
makedepends=('go')
optdepends=('libnotify: for desktop notifications' 'wl-clipboard: for Wayland clipboard sync' 'xclip: for X11 clipboard sync' 'sshfs: for SFTP mounting support' 'python-nautilus: for Nautilus file manager integration' 'ydotool: for Wayland mousepad support' 'xdotool: for X11 mousepad support' 'wtype: for Wayland keyboard emulation')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bethropolis/kcd/archive/v${pkgver}.tar.gz")
sha256sums=('fe26156a1d43e223cd56d325c824f023f6c7493a28798adc40644e4442a40260')
build() {
  cd "${srcdir}/kcd-${pkgver}"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w -X main.version=${pkgver} -X main.commit=5eb7b266c5a4b971328eac0a0ed14119fd2a9153" -o kcd ./cmd/kcd
}
package() {
  cd "${srcdir}/kcd-${pkgver}"
  install -Dm755 "./kcd" "${pkgdir}/usr/bin/kcd"

  install -Dm644 "./packaging/kcd-pkg.service" "${pkgdir}/usr/lib/systemd/user/kcd.service"
  install -Dm644 "./packaging/kcd-pkg.socket" "${pkgdir}/usr/lib/systemd/user/kcd.socket"
  install -Dm644 "./packaging/kcd-system.service" "${pkgdir}/usr/lib/systemd/system/kcd@.service"

  install -Dm644 "./packaging/kcd.example.toml" "${pkgdir}/usr/share/doc/kcd/kcd.example.toml"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/kcd/README.md"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/kcd/LICENSE"

  install -Dm644 "./packaging/kcd.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/kcd"
  install -Dm644 "./packaging/kcd.zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_kcd"
  install -Dm644 "./packaging/kcd.fish-completion" "${pkgdir}/usr/share/fish/vendor_completions.d/kcd.fish"

  install -Dm644 "./packaging/nautilus-kcd.py" "${pkgdir}/usr/share/nautilus-python/extensions/nautilus-kcd.py"

  install -Dm644 "./packaging/firewalld-kcd.xml" "${pkgdir}/usr/lib/firewalld/services/kcd.xml"
  install -Dm644 "./packaging/ufw-kcd" "${pkgdir}/etc/ufw/applications.d/kcd"
}
