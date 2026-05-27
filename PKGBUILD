# Maintainer: Slush97 <slusheliott@gmail.com>
pkgname=vpkmerge-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Combine multiple Valve Pak (.vpk) mods into one (Deadlock modding; desktop app, prebuilt)"
arch=('x86_64')
url="https://github.com/Slush97/vpkmerge"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=('vpkmerge')
conflicts=('vpkmerge' 'vpkmerge-git')
options=('!strip' '!emptydirs')
source=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/vpkmerge_${pkgver}_amd64.deb"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('4d98a263508257cb82ce281a921253888419afe15d7593afcfc28f44cef8665c'
            '00b2f40961e16423ce60d95c9087bde5bc5a2ed7d078312a56c54f0452863d19')

package() {
  cd "${srcdir}"

  bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.gz
  bsdtar -xpf data.tar.gz -C "${pkgdir}"
  rm -f data.tar.gz

  # Drop any /usr/share/doc the bundler shipped; we install our own LICENSE below.
  rm -rf "${pkgdir}/usr/share/doc"

  # The .deb's binary is /usr/bin/vpkmerge-gui (Cargo package name) and its
  # .desktop references that path. Add /usr/bin/vpkmerge as a convenience
  # symlink so users can type the short name from a terminal.
  ln -s vpkmerge-gui "${pkgdir}/usr/bin/vpkmerge"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
