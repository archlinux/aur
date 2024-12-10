# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=iptvorg-epg
pkgver=2023.12.1
pkgrel=9
_njsver=20.18.0
pkgdesc="Utilities for downloading the Electronic Program Guide for thousands of TV channels from hundreds of sources"
arch=('x86_64')
url="https://github.com/iptv-org/epg"
license=('Unlicense')
depends=('bash' 'libxml2' 'nodejs' 'npm')
makedepends=('nvm')
optdepends=('noto-fonts-emoji: compatibility with printsites option')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "iptvorg-epg.sh"
        "my.channels.xml")
sha256sums=('21a6654911daf24d7ed6abf8e2fcb1c7331b3cce64053a96faead3fbe98e9fb3'
            '23999e821c7b87ab7eb1d2b5d150a222a7b57bca9bf33ad9006870fe57b1a0c9'
            '26e87976d170c78e458ac44e65d305374aef67d2ab44a17bce151e86a2b783e5')

_ensure_local_nvm() {
  # Ensure NVM is properly loaded
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  if ! source /usr/share/nvm/init-nvm.sh; then
    echo "Error: Failed to initialize NVM."
    exit 1
  fi
}

prepare() {
  _ensure_local_nvm
  # Install required Node.js version using NVM
  nvm install ${_njsver}
}

build() {
  _ensure_local_nvm
  # Use npm ci for a clean, reproducible environment
  npm ci --cache "${srcdir}/npm-cache" --prefix "epg-${pkgver}" >/dev/null
  # Create the package tarball
  bsdtar -a -cf "epg-${pkgver}.tgz" "epg-${pkgver}"
}

package() {
  # Install the shell script to /usr/bin
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install the generated tarball and XML file
  install -Dm644 "epg-${pkgver}.tgz" -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 my.channels.xml -t "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:
