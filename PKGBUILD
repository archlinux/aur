# Contributor: redponike <proton (dot) me>
# Contributor: Frederik Holm Strøm <aur@frederikstroem.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

pkgname=chatbox-bin
pkgver=1.15.2
_commit=e256b86463fd81e5aa70c44bd6d6d74ca6af8449
pkgrel=1
pkgdesc="User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...)"
arch=('x86_64')
url="https://chatboxai.app"
license=('custom')
depends=(bash glibc gcc-libs hicolor-icon-theme)
conflicts=(chatbox)
provides=(chatbox)
source=("https://download.chatboxai.app/releases/Chatbox-${pkgver}-x86_64.AppImage"
chatbox.sh
"${pkgver}package.json::https://raw.githubusercontent.com/chatboxai/chatbox/${_commit}/package.json")
sha512sums=('2995d5b9e6482faf8f05afaa905a337fc9332f39ffe0ede166ca0fffc6e33d212f41ab331f30e013de7df1c6d85f8ba17539162750ea4c9f14767f435827ccbe'
            'fc658da6385c68c91254da09d2eb202fa059d731d31436359535e258658c1feb14d448fb7abb2c28d75fd5fb1f54ecbdc3e24962f6a4443a68df5030c01c77fc'
            '4d79a88f1d9e4f988f670fffeae17ba8db7db2444df2fec1582186d6d9108964113c94133ec2ef1f9a852f450ecb300607b8c56987c3e2060263718fa047b74f')

package() {
  chmod +x Chatbox-${pkgver}-x86_64.AppImage
  ./Chatbox-${pkgver}-x86_64.AppImage --appimage-extract *.desktop > /dev/null
  ./Chatbox-${pkgver}-x86_64.AppImage --appimage-extract resources > /dev/null
  ./Chatbox-${pkgver}-x86_64.AppImage --appimage-extract usr/share > /dev/null

  _electron=electron$(grep -oP '"electron": "\^\K\d+' ${pkgver}package.json)
  _electron=electron27 # workaround for missing pkg from repo
  depends+=($_electron)
  chmod -R 755 squashfs-root # workaround
  mv squashfs-root/usr "$pkgdir"/usr
  sed "s/@ELECTRON@/$_electron/" chatbox.sh | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/chatbox
  sed "s|^Exec=.*|Exec=chatbox|" squashfs-root/xyz.chatboxapp.app.desktop | install -Dm644 /dev/stdin "$pkgdir"/usr/share/applications/xyz.chatboxapp.app.desktop
  install -d "$pkgdir"/usr/lib
  mv squashfs-root/resources "$pkgdir"/usr/lib/chatbox
  # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
