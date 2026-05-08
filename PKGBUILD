# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Eric S. Londres <ericlondres@protonmail.com>
# Contributor: Mandeep Sangwan <mandeep@sangwan.me>
# Contributor: Joakim Nylén <me@jnylen.nu>
# Contributor: Rashintha Maduneth <rashinthamaduneth@gmail.com>
# Contributor: Dhananjay Balan <mail@dbalan.in>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.21.0
pkgrel=1
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=(x86_64)
license=(GPL-3.0-only)
url="https://github.com/Foundry376/Mailspring"
depends=(alsa-lib gtk3 nss glibc)
makedepends=(git npm nodejs-lts-iron grunt-cli python chrpath)
source=("git+https://github.com/Foundry376/Mailspring.git#tag=${pkgver}")
sha256sums=('a87a1d336d55388bcb541de266b0d780242cb31fbdc8289af987362179cd4c36')

prepare() {
  cd Mailspring
  sed -i "/await createRpmInstaller/d" app/build/build.js
  sed -i "s/execstack --clear-execstack//g" app/script/mkdeb
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

  sed -i 's/<%= productName %>/Mailspring/g' "${pkgdir}/usr/share/applications/Mailspring.desktop"
  sed -i 's/<%= description %>/Email client/g' "${pkgdir}/usr/share/applications/Mailspring.desktop"
  sed -i 's/<%= productName %>/Mailspring/g' "${pkgdir}/usr/share/metainfo/mailspring.appdata.xml"

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
