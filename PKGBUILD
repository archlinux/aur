# Maintainer: Julien Turbide <moi at jturbide dot com>
# SPDX-License-Identifier: 0BSD

pkgname=unifi-endpoint
pkgver=1.1.7
pkgrel=1
_upstream_pkgrel=28
pkgdesc='Secure access client for UniFi-managed VPN, WiFi, and file resources'
arch=('x86_64')
url='https://community.ui.com/releases/UniFi-Endpoint-Linux-1-1-7/7e28708d-1a05-4fcd-b26a-1ab462c24497'
license=('LicenseRef-Ubiquiti-EULA')
depends=(
  'ca-certificates-utils'
  'desktop-file-utils'
  'fontconfig'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'icu'
  'iproute2'
  'krb5'
  'libglvnd'
  'libnotify'
  'libsecret'
  'networkmanager'
  'openssl'
  'polkit'
  'procps-ng'
  'resolvconf'
  'systemd'
  'wireguard-tools'
  'wpa_supplicant'
  'xdg-utils'
)
optdepends=(
  'gnome-keyring: Secret Service credential storage'
  'gst-plugin-pipewire: PipeWire capture for screen sharing'
  'gst-plugins-ugly: H.264 encoding for screen sharing'
  'gvfs: file-access integration'
  'gvfs-nfs: NFS file access'
  'gvfs-smb: SMB file access'
  'kwallet: KDE credential storage'
  'pipewire: screen sharing'
  'systemd-resolvconf: preferred resolvconf provider with systemd-resolved'
  'vulkan-icd-loader: optional Vulkan rendering backend'
  'xdg-desktop-portal: screen sharing (requires a backend for your desktop)'
)
backup=(
  'etc/NetworkManager/conf.d/90-unifi-endpoint-unmanaged-vpn.conf'
  'etc/apparmor.d/local/wg-quick'
  'etc/polkit-1/rules.d/50-unifi-endpoint.rules'
)
options=('!strip' '!debug')
install='unifi-endpoint.install'
_deb="${pkgname}_${pkgver}-${_upstream_pkgrel}_amd64.deb"
source=(
  "${_deb}::https://fw-download.ubnt.com/data/unifi-endpoint-desktop-app-deb/55c2-linux-1.1.7-28-54b0e439-ddb5-41be-9e6f-56739775cdd9.deb"
  'README.Arch'
  'Ubiquiti-EULA.url'
  'unifi-endpoint-launcher'
)
noextract=("${_deb}")
sha256sums=(
  '996cd570c30dc3ec95203eef0bc85ef7683b999ade3e55cadc3ddbed75ae59ad'
  'b7d14250056e6c27c70950c8e4d44f0e3d70c1811aa7a3f33f90faed6a90ba91'
  '45fd9a9a193060c27ecc332dcdf87361b21f5e41861f053e9d65079be5d972cd'
  '7fdca3f607f4717ea9f59ce04e3cfd639b36de14a739d96f99532386a075c6bb'
)

prepare() {
  bsdtar -xf "${_deb}" data.tar.zst
}

check() {
  local required_path
  local required_paths=(
    './usr/lib/UniFi-Endpoint/UIDSTD.Avalonia'
    './usr/lib/UniFi-Endpoint/UniFi-Endpoint-Daemon'
    './usr/lib/UniFi-Endpoint/UniFi-Endpoint-PrivilegedHelper'
    './usr/lib/UniFi-Endpoint/utunnel'
    './usr/lib/systemd/user/UniFi-Endpoint-Daemon.service'
    './usr/lib/systemd/user/UniFi-Endpoint-Daemon.socket'
    './usr/share/polkit-1/actions/com.ui.unifi-endpoint.policy'
  )

  for required_path in "${required_paths[@]}"; do
    bsdtar -tf data.tar.zst | grep -Fqx "${required_path}"
  done
}

package() {
  bsdtar --no-same-owner -xf data.tar.zst -C "${pkgdir}"

  # Upstream 1.1.7 places the restart limits in [Service], where current
  # systemd ignores StartLimitIntervalSec. Both limits belong in [Unit].
  sed -i \
    -e '/^StartLimitIntervalSec=/d' \
    -e '/^StartLimitBurst=/d' \
    -e '/^\[Unit\]$/a StartLimitIntervalSec=300\nStartLimitBurst=5' \
    "${pkgdir}/usr/lib/systemd/user/UniFi-Endpoint-Daemon.service"

  # The vendor desktop entry starts the GUI directly. The Arch launcher starts
  # the socket on demand, preserving Arch's policy of not enabling services
  # automatically during package installation.
  install -Dm755 unifi-endpoint-launcher "${pkgdir}/usr/bin/unifi-endpoint"
  local desktop_file
  for desktop_file in \
      "${pkgdir}/usr/share/applications/unifi-endpoint.desktop" \
      "${pkgdir}/usr/lib/UniFi-Endpoint/Resources/unifi-endpoint.desktop"; do
    sed -i \
      -e 's|^Exec=.*|Exec=/usr/bin/unifi-endpoint %u|' \
      -e 's|^Categories=.*|Categories=Network;|' \
      "${desktop_file}"
  done

  install -Dm644 README.Arch \
    "${pkgdir}/usr/share/doc/${pkgname}/README.Arch"
  mv "${pkgdir}/usr/share/doc/${pkgname}/README.Debian" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.upstream-debian"
  install -Dm644 Ubiquiti-EULA.url \
    "${pkgdir}/usr/share/licenses/${pkgname}/Ubiquiti-EULA.url"

  # UniFi Endpoint currently recognizes Debian, Fedora/RHEL, and openSUSE CA
  # anchor layouts. Bridge its Fedora path to Arch's p11-kit trust-source path.
  install -d "${pkgdir}/etc/pki/ca-trust/source"
  ln -s ../../../ca-certificates/trust-source/anchors \
    "${pkgdir}/etc/pki/ca-trust/source/anchors"
}
