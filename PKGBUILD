# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
pkgver=7.2.6
pkgrel=1
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

sha256sums_x86_64=('9927f6cf4bcbb686074938f8fe662796c10d378a2f6b61e2a9c73e590a1a37d2')
sha256sums_armv7h=('cfcb64387659335c37225cf8e55fc79a810c5ac3685242c310d99c9c56b48fed')
sha256sums_aarch64=('eab633392cc4cf989294720cd856977de194248651595f2e2b73556404497b94')

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
