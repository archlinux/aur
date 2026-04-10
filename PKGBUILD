# Maintainer: Himalian <Himalian9227@proton.me>, phucvinh57 <npvinh0507@gmail.com>
pkgname=biopass-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="An alternative to Windows Hello/Howdy"
arch=('x86_64' 'aarch64')
url="https://github.com/TickLabVN/biopass"
license=('MIT')
depends=('curl' 'fprintd' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'gst-plugins-good' 'pam')
makedepends=('patchelf')
provides=('biopass')
conflicts=('biopass')
source_x86_64=("biopass_${pkgver}_amd64.deb::https://github.com/TickLabVN/biopass/releases/download/${pkgver}/biopass_${pkgver}_amd64.deb")
source_aarch64=("biopass_${pkgver}_arm64.deb::https://github.com/TickLabVN/biopass/releases/download/${pkgver}/biopass_${pkgver}_arm64.deb")
sha256sums_x86_64=('e03f23e1245fd806786c0e08e3d8dddd6aa214815a959b3a38b2b802534e8436')
sha256sums_aarch64=('225e7fbea0828fe88868fcb5e54beca7b664e6c263f6ad064412549b8960ef95')
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
  local helper_path

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

  helper_path="${pkgdir}/usr/bin/biopass-helper"
  if [ ! -f "${helper_path}" ]; then
    printf 'Expected helper binary missing: %s\n' "${helper_path}" >&2
    return 1
  fi

  # The published 1.0.3 bundles still embed CI build paths in RUNPATH. Replace
  # them with the packaged native lib location used by the helper and face libs.
  patchelf --set-rpath /usr/lib/biopass "${helper_path}"
  for so_file in "${pkgdir}"/usr/lib/biopass/libbiopass_*.so; do
    patchelf --set-rpath /usr/lib/biopass "${so_file}"
  done
}
