# Maintainer: dragonnp
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2026 PM-NetLink Client contributors

pkgbase=pm-netlink-client
pkgname=('pm-netlink-client' 'pm-netlink-client-gui')
pkgver=0.1.1
pkgrel=1
pkgdesc='Linux whitelist split tunneling controller for Xray-core, nftables, policy routing, and systemd'
arch=('any')
url='https://gitflic.ru/project/dragonnp/pm-netlink-client'
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgbase"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgbase"
  PYTHONPATH="$PWD" pytest -q
}

package_pm-netlink-client() {
  pkgdesc='Linux whitelist split tunneling CLI controller for Xray-core, nftables, policy routing, and systemd'
  depends=(
    'python'
    'python-pydantic'
    'python-yaml'
    'python-rich'
    'python-typer'
    'polkit'
    'xray'
    'nftables'
    'iproute2'
    'systemd'
  )
  backup=('etc/pm-netlink-client/config.yaml')

  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -f "$pkgdir/usr/bin/pm-netlink-client-gui"

  install -Dm644 packaging/default-config.yaml "$pkgdir/etc/pm-netlink-client/config.yaml"
  install -dm700 "$pkgdir/etc/pm-netlink-client/profiles"

  install -Dm644 systemd/pm-netlink-clientd.service \
    "$pkgdir/usr/lib/systemd/system/pm-netlink-clientd.service"
  install -Dm644 systemd/pm-netlink-client-routing.service \
    "$pkgdir/usr/lib/systemd/system/pm-netlink-client-routing.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README_en.md "$pkgdir/usr/share/doc/$pkgname/README_en.md"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/examples"
}

package_pm-netlink-client-gui() {
  pkgdesc='Qt GUI add-on for PM-NetLink Client'
  depends=(
    "pm-netlink-client=${pkgver}-${pkgrel}"
    'pyside6'
  )

  cd "$pkgbase"

  local _tmpdir
  _tmpdir="$(mktemp -d)"
  python -m installer --destdir="$_tmpdir" dist/*.whl

  install -Dm755 "$_tmpdir/usr/bin/pm-netlink-client-gui" "$pkgdir/usr/bin/pm-netlink-client-gui"
  install -Dm644 packaging/pm-netlink-client-gui.desktop \
    "$pkgdir/usr/share/applications/pm-netlink-client-gui.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README_en.md "$pkgdir/usr/share/doc/$pkgname/README_en.md"

  rm -rf "$_tmpdir"
}
