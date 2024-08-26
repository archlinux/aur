# Maintainer: Mark <speedorama1 at gmail dot com>

_pkgname=swiftly
pkgname=swiftly-bin
pkgver=0.3.0
pkgrel=4
pkgdesc="A Swift toolchain installer and manager, written in Swift."
arch=('x86_64' 'aarch64')
url="https://swiftlang.github.io/swiftly/"
license=('apache')
depends=('util-linux-libs' 'libxml2' 'ncurses')
optdepends=('python39: required for REPL' 'gnupg: required for toolchain verification')
options=('!strip')
provides=(swift-language)
conflicts=(swift-language)
source_x86_64=("https://github.com/swift-server/${_pkgname}/releases/download/${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
source_aarch64=("https://github.com/swift-server/${_pkgname}/releases/download/${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('1820d3096092f7cd9b907722746bd340ede9184fba6d34e9e244675c704694be')
sha256sums_aarch64=('b0fc7373e4aefc2548fb2af35189cd869a7077503eb5a330485326481288fd3c')

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
  echo "This package does not automatically uninstall all toolchains when the package is deleted. That can be done with 'swiftly uninstall all -y'"
}
