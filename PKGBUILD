# Maintainer: Julien Turbide <moi at jturbide dot com>
# SPDX-License-Identifier: 0BSD

pkgname=unifi-endpoint
pkgver=1.0.4
pkgrel=1
_upstream_pkgrel=20
pkgdesc='Secure access client for UniFi-managed VPN, WiFi, and file resources'
arch=('x86_64')
url='https://community.ui.com/releases/UniFi-Endpoint-Linux-1-0-4/ea29f793-838d-4f03-9915-efb55ad594a6'
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
  'gvfs: file-access integration'
  'gvfs-nfs: NFS file access'
  'gvfs-smb: SMB file access'
  'kwallet: KDE credential storage'
  'systemd-resolvconf: preferred resolvconf provider with systemd-resolved'
  'vulkan-icd-loader: optional Vulkan rendering backend'
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
  "${_deb}::https://fw-download.ubnt.com/data/unifi-endpoint-desktop-app-deb/bed2-linux-1.0.4-20-ff164d14-a211-419d-9a04-43192d56a952.deb"
  'README.Arch'
  'Ubiquiti-EULA.url'
  'unifi-endpoint-launcher'
)
noextract=("${_deb}")
sha256sums=(
  'e54342cc9c514e59469657e060149d46f7371b7fdb2d9fff1eb34434804311fa'
  'a616f007f158a38d24dc2601dd391c24bb4f416aa672c0806036cd8287b85659'
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
