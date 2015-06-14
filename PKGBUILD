# Maintainer: Arthur Skowronek <eisensheng@mailbox.org>

_game_name=train-fever
pkgname="gog-${_game_name}"
pkgver=1.1.0.3
pkgrel=1
pkgdesc='Railroad-focused business simulation game with procedural content and a sophisticated city simulation.'
arch=('i686' 'x86_64')
url='http://www.gog.com/game/train_fever'
license=('GOG.com EULA')
groups=('games')
depends=('gcc-libs>=5.1.0' 
         'libvorbis>=1.3.5' 
         'openal>=1.16.0-1'
         'freealut>=1.1.0'
         'sdl2>=2.0.3' 
         'glu>=9.0.0')
makedepends=()
optdepends=()
options=(!strip)
source=("gog://gog_train_fever_${pkgver}.tar.gz")
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually"`
           `" download it to \"$(pwd)\", or set up a gog:// DLAGENT"`
           `" in /etc/makepkg.conf.; exit 1")
sha256sum=('6f4bce136de58e330afc8998793136f7772424c52284ebef3110730331e6254d')
md5sums=('67aa246494420f7f92a09a79447138af')


build() {
  cd "${srcdir}/Train Fever"

  sed -r -i \
      's/(declare -r CURRENT_DIR="\$\( cd "\$\( dirname )'`
        `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
        `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
      "start.sh"
}


package() {
  cd "${srcdir}/"
  
  mkdir -p "${pkgdir}/opt/gog/"
  cp -ar "Train Fever" "${pkgdir}/opt/gog/${_game_name}"

  cd "Train Fever"
  install -Dm644 'docs/End User License Agreement.txt' \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "support/${pkgname}.png" \
                 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "support/${pkgname}-primary.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}-primary.desktop"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/gog/${_game_name}/start.sh" "${pkgdir}/usr/bin/${pkgname}"
}
