# Maintainer: Adr Ian <S9yN37 at gmail dot com>
pkgname=subtitletools-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A command-line tool for managing and synchronizing subtitle files"
arch=('x86_64' 'aarch64')
url="https://github.com/S9yN37/SubtitleTools"
license=('AGPL3')
source_x86_64=("${url}/releases/download/v${pkgver}/SubtitleTools-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/SubtitleTools-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('5e6b9355e7376cdda0e7027d4362c12ca77701c1143bf271841ad39270c6feae')
sha256sums_aarch64=('6f793fc60f50aa9242a434c195ae120d43204ed4a8ef4f9dd34eba6544926359')

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
  
  # Create symlink in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/SubtitleTools/SubtitleTools "${pkgdir}/usr/bin/SubtitleTools"
  
  # Install LICENSE
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}