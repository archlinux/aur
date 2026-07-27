#
# BastionGuard™
# Copyright (C) 2025–2026 Calogero Scarnà
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# BastionGuard™ is a trademark of Calogero Scarnà.
# The BastionGuard™ name and branding are not licensed under the GPL.
#

# Maintainer: BastionGuard info@bastionguard.eu

pkgname=bastionguard
pkgver=2.0.2
pkgrel=1
pkgdesc="BastionGuard - transparent security control plane for Linux desktops"
arch=('x86_64')
url="https://bastionguard.eu/"
license=('GPL-3.0-only')
# Documentation: https://bastionguard.eu/documentation/bastionguard-documentation/technical-documentation-application-install/installation-package/

depends=(
  'glibc' 'gcc-libs'
  # GUI toolkit (gtkmm-4.0 stack)
  'gtkmm-4.0' 'gtk4' 'glib2' 'glibmm' 'pangomm-2.48' 'pango' 'cairomm' 'cairo'
  'harfbuzz' 'gdk-pixbuf2' 'graphene' 'libsigc++-3.0'
  # Core libraries used by the CMake targets
  'boost-libs' 'boost' 'libsoup3' 'libsecret' 'curl' 'openssl' 'sqlite' 'libidn2'
  're2' 'yara' 'polkit' 'systemd-libs' 'smbclient' 'nlohmann-json' 'sudo'
  # CEF / Chromium runtime dependencies
  'nss' 'nspr' 'libglvnd' 'vulkan-icd-loader' 'mesa' 'libdrm'
  'alsa-lib' 'dbus' 'at-spi2-core'
  'libxcomposite' 'libxdamage' 'libxrandr' 'libxfixes' 'libxkbcommon'
  # Runtime bastionguard-backup (fork GTK4) + secure-connection
  'vte4' 'vte3' 'libgee' 'json-glib' 'grpc' 'protobuf'
  'libshumate' 'libnetfilter_queue' 'libbpf' 'help2man' 'libbpf' 'bcc-libbpf-tools' 'bpf' 'zstd' 'lzo'
  # Runtime services / helpers
  'nginx' 'php' 'clamav' 'dnsmasq' 'bubblewrap' 'rsync'
)

makedepends=(
  'cmake' 'pkgconf' 'gettext' 'python'
  'meson' 'ninja' 'mm-common' 'cargo-c' 'hyperscan'
  # bastionguard-backup (Vala/Meson) + secure-connection (Meson, eBPF)
  'vala' 'go' 'clang'
)

options=('strip')

source=(
  "BastionGuard::git+https://git.bastionguard.eu/specialworld83/BastionGuard.git#tag=v${pkgver}"
)

sha256sums=('SKIP')

_srcname="BastionGuard"

prepare() {
  cd "$srcdir/$_srcname"

  # Sostituisce il CMake generico con quello specifico per Arch Linux
  cp -f \
    pkgbuild/cmake_archlinux/CMakeLists.txt \
    CMakeLists.txt

  # Evita di riutilizzare una configurazione CMake precedente
  rm -rf build
}

build() {
  cd "$srcdir/$_srcname"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DBG_PACKAGING=ON \
    -DBG_DEBIAN_NO_INSTALL_CODE=ON \
    -DENABLE_SYSTEMD_SERVICES=OFF \
    -DENABLE_USER_AGENT_AUTO=OFF \
    -DINSTALL_NGINX_DEFAULTS=OFF \
    -DBASTIONGUARD_INIT_SYSTEM=AUTO \

  cmake --build build -- -j1
}

package() {
  cd "$srcdir/$_srcname"
  DESTDIR="$pkgdir" cmake --install build
  install -dm750 "$pkgdir"/var/lib/bastionguard-webui/{cache,quarantine,sessions,tmp}
  install -dm755 "$pkgdir/var/log/bastionguard-webui"
}
