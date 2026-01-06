# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=kairo
pkgname=${_pkgname}-bin
pkgver=0.3.3
pkgrel=2
pkgdesc="CLI and Desktop application for smart URL routing"
arch=("x86_64")
url="https://github.com/aelesbao/kairo"
license=("Apache-2.0")
options=()

conflicts=("$_pkgname")
provides=("$_pkgname")

source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('4a7b753e35af7fdd81d6c6051853200069f5a89ad14f3691c30e893e491021e2')

package() {
  install -Dm755 kairo kairo-desktop -t "${pkgdir}/usr/bin/"
  install -Dm644 desktop/* -t "${pkgdir}/usr/share/applications/"
  install -Dm644 icons/${_pkgname}.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 icons/${_pkgname}-128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 icons/${_pkgname}-256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 icons/${_pkgname}.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

post_install() {
  if which xdg-mime >/dev/null 2>&1 && "$(xdg-mime query default x-scheme-handler/https | grep -q kairo.desktop)"; then
    return
  fi

  cat <<EOF
To use Kairo, you need to set it as your default URL handler:

xdg-mime default kairo.desktop x-scheme-handler/http
xdg-mime default kairo.desktop x-scheme-handler/https
EOF
}
