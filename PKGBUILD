# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
pkgver=7.2.4
pkgrel=2
pkgdesc='A cross-platform automation and configuration tool/framework (binary package)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Powershell/Powershell'
license=('MIT')
depends=('krb5' 'gcc-libs' 'glibc' 'lttng-ust' 'zlib' 'icu')
provides=('powershell')
conflicts=('powershell')
options=(staticlibs !strip)
install=powershell.install

_artifact="${pkgname}-${pkgver}-${pkgrel}.tar.gz"
source_armv7h=("${_artifact}::${url}/releases/download/v${pkgver}/powershell-${pkgver}-linux-arm32.tar.gz")
source_aarch64=("${_artifact}::${url}/releases/download/v${pkgver}/powershell-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${_artifact}::${url}/releases/download/v${pkgver}/powershell-${pkgver}-linux-x64.tar.gz")
noextract=("$_artifact")

sha256sums_x86_64=('935b874a2e5f5662ab23efbe7392dc96c27d4fd064041d28a25a487ec5f6cc2e')
sha256sums_armv7h=('32e5675b0eefc30c9d42505565d398cbcbdd0941fbf2aa54a1f6afdae5b4c077')
sha256sums_aarch64=('00e09f1d4aa24dda76943b0f46aa5175b8ea0556827acd91ea0046ab91fc30ac')

prepare() {
  mkdir -p ${pkgname}-${pkgver}-${pkgrel}
  tar -xf $_artifact -C ${pkgname}-${pkgver}-${pkgrel}
}

package() {
  cd ${pkgname}-${pkgver}-${pkgrel}

  for path in $(find $(pwd) -type f); do
    path_rel=$(realpath --relative-to=$(pwd) "$path")
    install -Dm644 "${path_rel}" "${pkgdir}/opt/microsoft/powershell/7/${path_rel}"
  done

  chmod 755 "${pkgdir}/opt/microsoft/powershell/7/pwsh"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/microsoft/powershell/7/pwsh "${pkgdir}/usr/bin/pwsh"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/powershell-bin/LICENSE"
}
