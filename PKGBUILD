# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric S. Londres <ericlondres@protonmail.com>
# Contributor: Mandeep Sangwan <mandeep@sangwan.me>
# Contributor: Joakim Nylén <me@jnylen.nu>
# Contributor: Rashintha Maduneth <rashinthamaduneth@gmail.com>
# Contributor: Dhananjay Balan <mail@dbalan.in>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.16.0
pkgrel=2
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=(x86_64)
license=(GPL-3.0-only)
url="https://github.com/Foundry376/Mailspring"
depends=(alsa-lib gtk3 nss glibc)
makedepends=(git npm nodejs-lts-iron grunt-cli python chrpath)
source=("git+https://github.com/Foundry376/Mailspring.git#tag=${pkgver}"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/mailspring_0001-linux-don-t-build-a-deb-or-rpm-please.patch"
        desktop.patch)
sha256sums=('96b8c72dda5910e9dd9c85edb4b272bfb7e0eac1fc60eb6effd382c79ee1d9f8'
            'fd2158e0e3d39df0fa498b2afbcfa55c30607018ae144656f9575a6ec9e3dc98'
            '406b34236f3d966989b347aad88dfe52b9c1681ae26296974dcd719171c9833e')

prepare() {
  cd Mailspring
  patch -p1 < ../mailspring_0001-linux-don-t-build-a-deb-or-rpm-please.patch
  patch -p1 < ../desktop.patch
}

build() {
  cd Mailspring
  npm install
  npm run-script build
}

package() {
  cd Mailspring
  install -d "${pkgdir}/opt/mailspring"
  cp -r app/dist/mailspring-linux-x64/* "${pkgdir}/opt/mailspring"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/mailspring/mailspring "${pkgdir}/usr/bin/mailspring"

  cd app/build/resources/linux

  install -D Mailspring.desktop.in "${pkgdir}/usr/share/applications/Mailspring.desktop"
  install -D mailspring.appdata.xml.in "${pkgdir}/usr/share/metainfo/mailspring.appdata.xml"

  #for s in 16 32 64 128 256 512; do
  #  install -Dm0644 "icons/$s.png" "${pkgdir}/usr/share/icons/hicolor/$s/apps/mailspring.png"
  #done

  install -Dm0644 "icons/16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/mailspring.png"
  install -Dm0644 "icons/32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/mailspring.png"
  install -Dm0644 "icons/64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mailspring.png"
  install -Dm0644 "icons/128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mailspring.png"
  install -Dm0644 "icons/256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mailspring.png"
  install -Dm0644 "icons/512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mailspring.png"

  #Insecure RPATH '/opt/openssl/lib' in file ('opt/mailspring/resources/app.asar.unpacked/mailsync.bin')
  chrpath --delete "${pkgdir}/opt/mailspring/resources/app.asar.unpacked/mailsync.bin"
}
