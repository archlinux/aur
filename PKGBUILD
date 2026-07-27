# Maintainer: Adr Ian <S9yN37 at gmail dot com>
pkgname=subtitletools-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A command-line tool for managing and synchronizing subtitle files"
arch=('x86_64' 'aarch64')
url="https://github.com/S9yN37/SubtitleTools"
license=('AGPL3')
source_x86_64=("${url}/releases/download/v${pkgver}/SubtitleTools-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/SubtitleTools-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('fe38655a67fb45fb2e82f7e774e7c7adce26d2ecd495a0aa23f55e90b76b4e29')
sha256sums_aarch64=('c3d100bfb8cab20344aa942df7f0e5563dc7f32366e7613422345f754f3ef5ac')

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