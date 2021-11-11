# Maintainer: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=whatsdesk-git
pkgver=0.3.8
pkgrel=1
pkgdesc="unofficial client of whatsapp"
arch=('x86_64')
url="https://zerkc.gitlab.io/whatsdesk"
license=('MIT')
provides=('whatsdesk')
conflicts=('whatsdesk-bin')
depends=('libxss'
         'nss'
         'libxtst'
         'libnotify'
         'libappindicator-gtk3')
makedepends=('git'
             'nodejs'
             'npm')
commit="426b01b731995155ca73de7127f2a309b0f11124"
source_x86_64=("whatsdesk-${pkgver}-${pkgrel}.tar::https://gitlab.com/zerkc/whatsdesk/-/archive/master/whatsdesk-master.tar?commit=$commit")
sha256sums_x86_64=('94e4a61777631d0bea3a594a8a3aae37f2887337eec03a4bedc1ad8d347aa08a')

build() {
    cd whatsdesk-master
    mv package.json package.json.tmp
    jq ".build.linux.target={\"target\": \"deb\",\"arch\":[\"x64\"]}" package.json.tmp > package.json
    npm install
    npm run build
}

package() {
  ar xv ${srcdir}/whatsdesk-master/dist/whatsdesk_"$pkgver"_amd64.deb
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/whatsdesk/whatsdesk" "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/whatsdesk-master/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}