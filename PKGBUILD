# Maintainer: Marvin1099
pkgname=smb-mount-controller-git
pkgver=0.2.r1.g5e1fb02
pkgrel=1
pkgdesc="A state-based SMB/CIFS mount controller written in bash for Linux that (un)mounts network shares based on reachability"
arch=('any')
url="https://codeberg.org/marvin1099/smb-mount-controller"
license=('AGPL3')
depends=('bash' 'cifs-utils' 'netcat')
optdepends=('systemd: for systemd service file support')
source=("git+https://codeberg.org/marvin1099/smb-mount-controller.git")
sha256sums=('SKIP')
install=smb-controller.install

backup=('etc/smb-controller.conf')

pkgver() {
  cd "$srcdir/smb-mount-controller"
  git describe --long --tags --abbrev=7 2>/dev/null | \
    sed 's/^v//;s/-/.r/;s/-/./' || \
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "smb-mount-controller"

  # executable
  install -Dm755 smb-controller.sh \
    "$pkgdir/usr/bin/smb-controller"

  # config (user-editable)
  install -Dm644 example-smb-controller.conf \
    "$pkgdir/etc/smb-controller.conf"

  # systemd service
  install -Dm644 default-smb-controller.service \
    "$pkgdir/usr/lib/systemd/system/smb-controller.service"
}
