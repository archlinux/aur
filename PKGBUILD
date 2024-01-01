# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=0.2.0
pkgrel=3
pkgdesc="A Swift toolchain installer and manager, written in Swift."
arch=('x86_64' 'aarch64')
url="https://swift-server.github.io/swiftly/"
license=('apache')
depends=('libutil-linux' 'libxml2' 'ncurses')
optdepends=('python39: required for REPL')
options=('!strip')
provides=(swift-language)
conflicts=(swift-language)
source_x86_64=("https://github.com/swift-server/${_pkgname}/releases/download/${pkgver}/${_pkgname}-$CARCH-unknown-linux-gnu")
source_aarch64=("https://github.com/swift-server/${_pkgname}/releases/download/${pkgver}/${_pkgname}-$CARCH-unknown-linux-gnu")
sha256sums_x86_64=('e0e58f6cbd4ad60c4cd51eeed88c3e908b3e2951bf55bcd3799fdd66d0fddbf4')
sha256sums_aarch64=('446053021cc3c36ba78c6742d2a885650d6de59258382d229a167d070b827f69')
install='swiftly-bin.install'

package() {
  mkdir -p ~/.local/share/${_pkgname}/toolchains
  if [ ! -f ~/.local/share/${_pkgname}/config.json ]; then
    echo "{ \"platform\": { \"name\": \"ubi9\", \"nameFull\": \"ubi9\", \"namePretty\": \"Arch Linux\" }, \"installedToolchains\": [] }" > ~/.local/share/${_pkgname}/config.json    # basic config.json setup
  fi

  install -D -m 0755 ${_pkgname}-$CARCH-unknown-linux-gnu ${pkgdir}/usr/bin/${_pkgname}

  # setting up symlinks to existing ncurses libs (no ncurses5-compat-libs needed!)
  mkdir -p ${pkgdir}/usr/lib
  ln -s /usr/lib/libncursesw.so.6 ${pkgdir}/usr/lib/libncurses.so.6
  ln -s /usr/lib/libformw.so.6 ${pkgdir}/usr/lib/libform.so.6
  ln -s /usr/lib/libpanelw.so.6 ${pkgdir}/usr/lib/libpanel.so.6

  echo "Config and toolchains can be found in ~/.local/share/${_pkgname}. Toolchains are installed to ~/.local/bin."
  echo "If you encounter an error stating that config.json cannot be found, please do a clean build of this package."
}
