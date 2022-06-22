# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
pkgver=7.2.5
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

sha256sums_x86_64=('a6ca50bc03a1f508b0177a9ddb63164d344a6b9cee4cf4d459a04e72ea10c468')
sha256sums_armv7h=('30a3498fbafd2fa6867f4c486f3630d2b9b42246b769de2f950bf7218056db05')
sha256sums_aarch64=('709265a0b99232cd8ab6f8a02c01f3aee94262b959e1a4b0fd871c8789c07396')

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
