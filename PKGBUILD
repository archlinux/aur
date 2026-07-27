# Maintainer: Adr Ian <S9yN37 at gmail dot com>
pkgname=subtitletools-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A command-line tool for managing and synchronizing subtitle files"
arch=('x86_64' 'aarch64')
url="https://github.com/S9yN37/SubtitleTools"
license=('AGPL3')
source_x86_64=("${url}/releases/download/v${pkgver}/SubtitleTools-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/SubtitleTools-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('d1c1c52b26d047a1129710eb5666e28ae0c5d45ecde996088d247f005a97bd19')
sha256sums_aarch64=('d6999ba9a1e0263081f52a008aa138cbc0dd4590249532e2e1145b2714925300')

pkgver() {
  curl -s "https://api.github.com/repos/S9yN37/SubtitleTools/releases/latest" \
    | grep -Po '"tag_name":\s*"\K[^"]+' | sed 's/^v//'
}

package() {
  # Create the target directory in /opt
  install -d "${pkgdir}/opt/SubtitleTools"
  
  # Copy all files to /opt/SubtitleTools (excluding LICENSE)
  find "${srcdir}" -mindepth 1 -maxdepth 1 ! -name 'LICENSE' -exec cp -r {} "${pkgdir}/opt/SubtitleTools/" \;
  
  # Make the main binary executable
  chmod +x "${pkgdir}/opt/SubtitleTools/SubtitleTools"
  
  # Create symlinks in /usr/bin (full name + short alias `st`)
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/SubtitleTools/SubtitleTools "${pkgdir}/usr/bin/SubtitleTools"
  ln -s /opt/SubtitleTools/SubtitleTools "${pkgdir}/usr/bin/st"
  
  # Install LICENSE
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}