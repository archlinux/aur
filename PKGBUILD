# Maintainer: Himalian <Himalian9227@proton.me>, phucvinh57 <npvinh0507@gmail.com>
pkgname=biopass-bin
pkgver=1.0.1
pkgrel=5
pkgdesc="An alternative to Windows Hello/Howdy"
arch=('x86_64' 'aarch64')
url="https://github.com/TickLabVN/biopass"
license=('MIT')
depends=('curl' 'yaml-cpp' 'fprintd' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'gst-plugins-good' 'pam')
provides=('biopass')
conflicts=('biopass')
source_x86_64=("biopass_${pkgver}_amd64.deb::https://github.com/TickLabVN/biopass/releases/download/${pkgver}/biopass_${pkgver}_amd64.deb")
source_aarch64=("biopass_${pkgver}_arm64.deb::https://github.com/TickLabVN/biopass/releases/download/${pkgver}/biopass_${pkgver}_arm64.deb")
sha256sums_x86_64=('8e12a77aa5e472f69074053071dc3d75685445c501f9a583559ab721c3d2213d')
sha256sums_aarch64=('61e5744106140d8493be6d94f882d80fa60ac342f072905a6598270a433e0bf8')
options=(!strip !debug)
backup=('etc/ld.so.conf.d/biopass.conf')
install=biopass-bin.install

prepare() {
  local deb_file
  case "${CARCH}" in
    x86_64) deb_file="biopass_${pkgver}_amd64.deb" ;;
    aarch64) deb_file="biopass_${pkgver}_arm64.deb" ;;
    *) printf 'Unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
  esac

  # Extract data.tar.gz from the debian package
  ar x "${deb_file}" data.tar.gz
  tar -xzf data.tar.gz
}

package() {
  # Handle /usr/local if it exists (moving to /usr)
  if [ -d usr/local ]; then
    cp -a usr/local/* usr/
    rm -rf usr/local
  fi
  
  # Install standard /usr hierarchy
  cp -a usr "${pkgdir}/"

  # Install PAM module (moved from /lib/security to /usr/lib/security)
  if [ -d lib/security ]; then
    install -d "${pkgdir}/usr/lib/security"
    install -m755 lib/security/*.so "${pkgdir}/usr/lib/security/"
  fi

  # Install configuration files in /etc
  if [ -d etc ]; then
    cp -a etc "${pkgdir}/"
    find "${pkgdir}/etc" -type f -exec chmod 644 {} +
  fi

  # biopass-helper is installed at /usr/bin/biopass-helper, but
  # libbiopass_pam.so requires /usr/local/bin/biopass-helper
  install -d "${pkgdir}/usr/local/bin"
  ln -s /usr/bin/biopass-helper "${pkgdir}/usr/local/bin/biopass-helper"
}
