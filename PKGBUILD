# Maintainer: François-Xavier Payet <fx@payet.io>

pkgname=nonraid-git
pkgver=1.21.0
pkgrel=1
pkgdesc="nonraid kernel module via DKMS + management tool, systemd units, default config, and udev rule"
arch=('x86_64')
url='https://github.com/qvr/nonraid'
license=('gpl-2.0')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build the kernel module for your kernel')
optdepends=('mergerfs: merge drive together')
provides=('nonraid')
backup=('etc/default/nonraid')
source=('git+https://github.com/qvr/nonraid.git')
b2sums=('SKIP')
# Derive a reproducible pkgver from git describe or commit count

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/^[^0-9]*\([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/')"
}

build() {
  cd "$srcdir/nonraid"
  # If the project ships a userspace manager that needs building, do it here.
  # The repo's tools/nmdctl is assumed to be a script; if it's a Go/C/Rust tool, add the proper build steps.
  :
}

package() {
  cd "$srcdir/nonraid"

  # 1) DKMS source installation (install sources into /usr/src so dkms can build for each kernel)
  DKMS_VERSION=$(grep "^PACKAGE_VERSION=" dkms.conf | cut -d= -f2)
  DKMS_SRC_DIR="/usr/src/nonraid-dkms-$DKMS_VERSION"
  sudo mkdir -p "$DKMS_SRC_DIR"
  sudo cp -r md_nonraid/ raid6/ dkms.conf Makefile "$DKMS_SRC_DIR/"
  KVERSION=$(uname -r)
  sudo dkms install nonraid-dkms/$DKMS_VERSION -k "$KVERSION" --force

  # 2) Userspace management tool
  if [[ -f "tools/nmdctl" ]]; then
    install -Dm755 "tools/nmdctl" "$pkgdir/usr/bin/nmdctl"
  fi

  # 3) systemd units (services and timers)
  if compgen -G "tools/systemd/*.service" > /dev/null; then
    install -Dm644 tools/systemd/*.service -t "$pkgdir/usr/lib/systemd/system/"
  fi
  if compgen -G "tools/systemd/*.timer" > /dev/null; then
    install -Dm644 tools/systemd/*.timer -t "$pkgdir/usr/lib/systemd/system/"
  fi

  # 4) Default configuration
  if [[ -f "tools/nonraid.default" ]]; then
    install -Dm644 "tools/nonraid.default" "$pkgdir/etc/default/nonraid"
  fi

  # 5) Udev rule (install and ensure reload on install via .install script)
  if [[ -f "tools/udev/nonraid.udev" ]]; then
    install -Dm644 "tools/udev/nonraid.udev" "$pkgdir/usr/lib/udev/rules.d/99-nonraid.rules"
  fi

}
