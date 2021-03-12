# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=teams
pkgver=1.4.00.4855
pkgrel=2
pkgdesc="Microsoft Teams for Linux is your chat-centered workspace in Office 365"
arch=('x86_64')
url="https://teams.microsoft.com/downloads"
license=('custom')
depends=("gtk3" "libxss" "alsa-lib" "libxtst" "libsecret" "nss" "glibc>=2.28-4")
optdepends=("libappindicator-gtk3: Systray indicator support"
            "org.freedesktop.secrets: Keyring password store support")
conflicts=("ms-teams")
replaces=("ms-teams")
source=("https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/${pkgname}_${pkgver}_amd64.deb"
        "${pkgname}.patch")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('a91dbdf646f12659fdf8d08831aa06ab1bf4cc6fb981841c36a350f29bd714bc'
            'eb6189854bd0ac1c1ac21de21e952603b33b11e0e43ec07d291bc645320fcca8')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Fix the order of items in the startup script so that the meeting links will work again
  patch -d "${pkgdir}" -p1 <"${pkgname}".patch

  # Move license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
