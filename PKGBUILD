# Maintainer: Vic RH <blitzkriegfc@gmail.com>

pkgname=perimeter81-rpm
pkgver=10.0.1.885
pkgrel=1
pkgdesc='Perimeter81 agent application (RPM-based build)'
arch=('x86_64')
url='https://support.perimeter81.com/docs/downloading-the-agent'
license=('custom:LICENSE')
depends=('systemd' 'netcat' 'wireguard-tools')
options=(!strip)
source=("https://static.perimeter81.com/agents/linux/Perimeter81_${pkgver}.rpm"
  'perimeter81helper.service'
  'perimeter81.sysusers'
  'LICENSE')

sha256sums=('678be65814d8c64370af7c6a78482fd71a863699264ad7a27e487257424ab9ec'
  '82e29269872aa0d1a7397da0d63f9044bba8129076fbdce28f9302ceb021fb22'
  '50e7f91b65c2dbb4930129523027605c27824db2c8516c187104654a1e8610e2'
  'c505b227d3f2222305800c16805f29b8da3bf841bf71df36674a695528bd0731')

conflicts=('perimeter81')

package() {
  # Extract the .rpm directly
  bsdtar -x -f "${srcdir}/Perimeter81_${pkgver}.rpm" -C "${pkgdir}"

  install -Dm644 "${srcdir}/perimeter81helper.service" "${pkgdir}/usr/lib/systemd/system/perimeter81helper.service"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/perimeter81.sysusers" "${pkgdir}/usr/lib/sysusers.d/perimeter81.sysusers"
  # after-install.sh is already in the correct place after patching and extraction

  # Create the log directory, but do *NOT* set ownership here.
  install -d -m 0755 "${pkgdir}/var/log/perimeter81"
}

pre_remove() {
  systemctl disable --now perimeter81helper.service &>/dev/null
  printf "%s\n" "==> Remember this package conflicts with 'perimeter81' (the DEB-based package)."
}

post_install() {
  # Run the after-install script
  /opt/Perimeter81/after-install.sh

  # Enable and start the service
  systemctl enable --now perimeter81helper.service &>/dev/null
  systemctl daemon-reload &>/dev/null

  # Set permissions on /opt/Perimeter81 *and* /var/log/perimeter81
  chown -R perimeter81:perimeter81 /opt/Perimeter81
  find /opt/Perimeter81 -type d -exec chmod 755 {} \;
  find /opt/Perimeter81 -type f -exec chmod 644 {} \;
  chown -R perimeter81:perimeter81 /var/log/perimeter81

  printf "%s\n" "==> This package (perimeter81-rpm) conflicts with 'perimeter81' (the DEB-based package)."
  printf "%s\n" "==> If you installed 'perimeter81' previously, it has likely been removed."
}
