# Maintainer: Hao Long <aur@esd.cc>

pkgname=htrace.sh
pkgver=1.1.7
pkgrel=5
pkgdesc="A shell script for http/https troubleshooting and profiling"
arch=('any')
url="https://github.com/trimstray/htrace.sh"
license=('MIT')
provides=('htrace.sh')
conflicts=('htrace.sh')
depends=('bind-tools'
         'mmdblookup'
         'bc'
         'jq'
         'testssl.sh'
         'ssllabs-scan'
         'mixed-content-scan'
         'nmap'
         'subfinder'
         'wafw00f'
         'nghttp2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trimstray/htrace.sh/archive/v${pkgver}.tar.gz"
        "01-rename-testssl.patch"
        "02-relocation-tmp-and-log-folder.patch")
b2sums=('dae75488c1ca21d2dcf50c15b531bca7682e91345f48059680c46fe15083e763c70ffa5d52db4d1620e1029daa1cb400dd67ab8215e9c1bbfd5984fb222b8e15'
        '743882707b94e4628835686edea998f5232e45cd6100c7b635db70ea0f31f80806d08d1e29816e6fcab5f1be8015209cc4e95487fcbf5e86a7bf184bb89e4aa9'
        '147cc9b5dbdb84ef84f65f5d651daa88ec89d89a1be9b3973ce233c637cecde509e6f66bf45151c6c25dd0f56932b8a5f1630b66c77d2406d46d5027269fda49')

prepare() {
  cd $pkgname-$pkgver
  # Package testssl.sh is in [Community]
  # The script is located in /usr/bin/testssl
  patch -Np1 -i ${srcdir}/01-rename-testssl.patch
  # This package will be installed to /usr/share/htrace.sh
  # And this folder will be owned by root
  # So I am relocation the folder that the normal user will read/write
  # tmp => $(mktemp -d)
  # log => /tmp/htrace.sh-log
  patch -Np1 -i ${srcdir}/02-relocation-tmp-and-log-folder.patch
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 config "${pkgdir}/usr/share/${pkgname}/config"
  cp -r bin/ "${pkgdir}/usr/share/${pkgname}"
  cp -r lib/ "${pkgdir}/usr/share/${pkgname}"
  cp -r src/ "${pkgdir}/usr/share/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/usr/share/${pkgname}/bin/htrace.sh" "${pkgdir}/usr/bin/htrace.sh"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 static/man8/htrace.sh.8 "$pkgdir/usr/share/man/man8/htrace.sh.8"
}
