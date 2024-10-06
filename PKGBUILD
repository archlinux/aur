# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric S. Londres <ericlondres@protonmail.com>
# Contributor: Mandeep Sangwan <mandeep@sangwan.me>
# Contributor: Joakim Nylén <me@jnylen.nu>
# Contributor: Rashintha Maduneth <rashinthamaduneth@gmail.com>
# Contributor: Dhananjay Balan <mail@dbalan.in>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.14.0
pkgrel=2
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=(x86_64)
license=(GPL-3.0-only)
url="https://github.com/Foundry376/Mailspring"
depends=(alsa-lib gtk3 libsecret nss)
makedepends=(git npm nodejs-lts-hydrogen grunt-cli python)
source=("${pkgname%-git}::git+https://github.com/Foundry376/Mailspring.git#tag=${pkgver}"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/mailspring_0001-linux-don-t-build-a-deb-or-rpm-please.patch")
sha256sums=('SKIP'
            'fd2158e0e3d39df0fa498b2afbcfa55c30607018ae144656f9575a6ec9e3dc98')

prepare() {
  cd mailspring
  patch -p1 < ../mailspring_0001-linux-don-t-build-a-deb-or-rpm-please.patch
}

build() {
  cd "${pkgname%-git}/"
  npm install
  npm run-script build
}

package() {
  cd mailspring
  install -d "${pkgdir}/opt/mailspring"
  cp -r app/dist/mailspring-linux-x64/* "${pkgdir}/opt/mailspring"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/mailspring/mailspring "${pkgdir}/usr/bin/mailspring"

  cd app/build/resources/linux

  install -D Mailspring.desktop.in "${pkgdir}/usr/share/applications/Mailspring.desktop"
  install -D mailspring.appdata.xml.in "${pkgdir}/usr/share/metainfo/mailspring.appdata.xml"

  for s in 16 32 64 128 256 512; do
    install -Dm0644 "icons/$s.png" "${pkgdir}/usr/share/icons/hicolor/$s/apps/mailspring.png"
  done

#Insecure RPATH '/opt/openssl/lib' in file ('opt/mailspring/resources/app.asar.unpacked/mailsync.bin')
}
