# Maintainer: Hao Long <aur@esd.cc>

pkgname=htrace.sh
pkgver=1.1.7
pkgrel=2
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
         'observatory-cli'
         'ssllabs-scan'
         'mixed-content-scan'
         'nmap'
         'subfinder'
         'wafw00f'
         'nghttp2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trimstray/htrace.sh/archive/v${pkgver}.tar.gz"
        "01-rename-testssl.patch"
        "02-relocation-tmp-and-log-folder.patch")
sha256sums=('bc8ed23f247d7ae45dd65bdc844c4681215d27016f4b90957493ecbac9e2b743'
            '76ea3e6c1271089f8773c0da066a1b4678082b196b9bab51c24fcd3e73c96035'
            '8feae39f2f3a4fb2b0c24734bdfdd778aa8b12848b4f2d7c81fe3a04eb7553ff')

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
