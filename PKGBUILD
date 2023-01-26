# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
pkgver=7.3.2
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

sha256sums_x86_64=('77700ff7160f77909ea5dccea0340caeb876f6e12d92d21c5fd7a79fcf377d1a')
sha256sums_armv7h=('cdb0f04db328bc6230cbcfcc04db11a20111bc58637468aad79d56a832c489d4')
sha256sums_aarch64=('c8de060319c02a6001fa4081657d463630807a3c27f4d38421ee644300403418')

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
