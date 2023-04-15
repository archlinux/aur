# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
pkgver=7.3.4
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary package)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Powershell/Powershell'
license=('MIT')
depends=('krb5' 'gcc-libs' 'glibc' 'lttng-ust' 'zlib' 'icu')
provides=('powershell')
conflicts=('powershell')
options=(staticlibs)
install=powershell.install

_artifact="${pkgname}-${pkgver}-${pkgrel}.tar.gz"
source_armv7h=("${_artifact}::${url}/releases/download/v${pkgver}/powershell-${pkgver}-linux-arm32.tar.gz")
source_aarch64=("${_artifact}::${url}/releases/download/v${pkgver}/powershell-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${_artifact}::${url}/releases/download/v${pkgver}/powershell-${pkgver}-linux-x64.tar.gz")
noextract=("$_artifact")

sha256sums_x86_64=('e85d5544e13a924f8b2c4a5dc2d43abe46e46633f89e8d138d39c0aaeacb9976')
sha256sums_armv7h=('c5e5b4f157283bfe30e44fd7468fab26af86926d58ba36bc406ed71c5c59f639')
sha256sums_aarch64=('34ee04d93394218c941499a2df3289ccec8fd3fad33d366025971e6d536449f9')

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
