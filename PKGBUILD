# Maintainer Ethan Apodaca <papodaca at gmail dot com>
# Contributer Justin Gross <jgross.biz@gmail.com>
# Upstream URL: https://github.com/officert/mongotron

pkgname=mongotron-bin
pkgver=1.0.0.alpha4
pkgrel=1
pkgdesc="Chrome-based mongo db management tool - Precompiled binary from official repository"
arch=("x86_64")
url="https://github.com/officert/mongotron"
license=("MIT")
options=(!strip)
depends=("gconf" "gtk2" "libnotify" "libxtst" "nss" "python2" "xdg-utils" "desktop-file-utils" "alsa-lib" "libgnome-keyring")
makedepends=("imagemagick" "npm")
install=$pkgname.install

sha256sums=("bb19bb92859ffd1c35f98cff6380dac43529800654cb9097742a0075ca2e4eeb"
            "9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e"
            "f21afda7b24acdb441dc5c6c51d4ec63a684f27349dea942586367c08c627a87")
source=("${pkgname}.desktop"
        "${pkgname}.install"
        "https://github.com/officert/mongotron/releases/download/1.0.0-alpha.4/Mongotron-linux-x64.zip")

build() {
  mkdir -p "tmp-build"
  cp "${srcdir}/Mongotron-linux-x64/resources/app.asar" "tmp-build/"
  cd "tmp-build/"
  npm install asar
  asar extract app.asar ./
}

package() {
  install -dm755 "$pkgdir/"{opt,usr/bin}
  mv "${srcdir}/Mongotron-linux-x64" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/$pkgname/Mongotron" "$pkgdir/usr/bin/Mongotron"
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/mongotron.desktop
  cd "tmp-build/resources/icon/"
  convert logo_icon.ico logo_icon.png
  cd -
  sizes=(256x256 128x128 48x48 32x32 16x16)
  for i in 0 1 2 3 4 5 ; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}/apps"
    install -Dm644 "tmp-build/resources/icon/logo_icon-${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${sizes[$i]}/apps/${pkgname}.png"
  done
}
