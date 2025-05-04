# Maintainer: benpiano800 <benpiano800@protonmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=ant-gtk-theme
pkgver=1.3.0
pkgrel=6
pkgdesc="A flat and light theme with a modern look"
arch=('any')
license=('GPL')
url=https://github.com/EliverLara/Ant
conflicts=('ant-slim-gtk-theme' 'ant-gtk-theme-git')
options=('!strip')
depends=('gtk3')
optdepends=('ttf-roboto: primary font face defined'
			'ttf-ubuntu-font-family: secondary font face defined'
			'cantarell-fonts: tertiary font face defined')

source=("Ant-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant.tar"
	"Ant-Bloody-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant-Bloody.tar"
	"Ant-Nebula-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant-Nebula.tar"
	"Ant-Dracula-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant-Dracula.tar"
	"Ant-Dracula-slim-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant-Dracula-slim.tar"
	"Ant-Nebula-slim-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant-Nebula-slim.tar"
	"Ant-Bloody-slim-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant-Bloody-slim.tar"
	"Ant-slim-${pkgver}.tar::https://aur-files.storage.googleapis.com/${pkgname}/${pkgver}/Ant-slim.tar")

noextract=("Ant-${pkgver}.tar"
           "Ant-Bloody-${pkgver}.tar"
           "Ant-Nebula-${pkgver}.tar"
           "Ant-Dracula-${pkgver}.tar"
           "Ant-Dracula-slim-${pkgver}.tar"
           "Ant-Nebula-slim-${pkgver}.tar"
           "Ant-Bloody-slim-${pkgver}.tar"
           "Ant-slim-${pkgver}.tar"
)

sha512sums=('eff8f9d6db62c28cca4f82b46a477b0e980193ade010f541bf3007513cc35041d812326ac4272a06157d6208af4fc8adc73897622d66469eb1839e80977e7d70'
            '6847179d7983984af40b27ecb9c4ecd80adf47cad701add25ea9ffe8fe8944650dcf190685d857df282d620a7dcf19a90a900aeeebba5ddad04cd20cdba10e6d'
            '7a0336ae7e1c2ea35507644b1e63d4bcb1b9a445a6261b6957eb4dda1ee38aa2b21bc6697694bab4a705235735a06e7340974f2177bfcc84b312990538cf8f5a'
            'd55f12f3b1b852e2fe796498f170609bcc675e764ec54d62ad0a39f274ca3f747375f3a9d03e56199e6fdd503b54594cc8276958551df02d5f18d03846a62371'
            'b6a9d867f9326d10b92f2abcca119190db5444a0beed27447ddd133ae6aff226738302eed253de1a278d853ccdbd59fa34a8cf99b1f1a3bdee91d3edf935d619'
            '1e67cefb178accb3efa4b4b967cd04966a1645e50d434016eb9db1db499147351812496998a695bbe61242c31534ea6a279507b5c94f68797a67738f6fcbb45e'
            'f17b1d3be2cb0314d8c25269d156b6ad358bd718fd820a12c3ba3665afcfa127c928b3890f1432964cc7c081fc398f739abb345e3db7b927ab45c65446f5d0de'
            '668d80be55381fb1dbbd5a06d6e45f1a8858772d3207a762bb62dc53a2663271f29693445d5e8ff01495a13195e1eb4c513ec7633712eee21487b116ad1c3012')

prepare() {
  cd "${srcdir}"
  for THEME_FILE in "${noextract[@]}"
  do
    THEME_NAME="${THEME_FILE%.*}"
    THEME_NAME="${THEME_NAME%-*}"
    mkdir -p "${THEME_NAME}"
    if echo "${THEME_FILE}" | grep "slim" > /dev/null
    then
      bsdtar xf "${THEME_FILE}" -C "${THEME_NAME}"
      cd "${THEME_NAME}"
      find . -type f -name '*.tar' | while read -r SUB_THEME_FILE
      do
        SUB_THEME_NAME=$(basename "${SUB_THEME_FILE}")
        SUB_THEME_NAME="${SUB_THEME_NAME%.*}"
        mkdir -p "${SUB_THEME_NAME}"
        bsdtar xf "${SUB_THEME_FILE}" --strip-components=1 -C "${SUB_THEME_NAME}"
      done
      cd ..
    else
      bsdtar xf "${THEME_FILE}" --strip-components=1 -C "${THEME_NAME}"
    fi
  done
}

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  find "${srcdir}" -type f -name 'index.theme' | while read -r THEME_INDEX_FILE
  do
    THEME_SRC_DIR=$(dirname "${THEME_INDEX_FILE}")
    THEME_NAME=$(basename "${THEME_SRC_DIR}")
    cp -r "${THEME_SRC_DIR}" "${pkgdir}/usr/share/themes"
  done
}
