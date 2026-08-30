# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=locally-uncensored
pkgname=locally-uncensored-bin
pkgver=2.6.6
pkgrel=1
pkgdesc="Plug-and-play local AI studio — uncensored chat, image & video generation, and a coding agent"
arch=('x86_64')
url="https://github.com/PurpleDoubleD/locally-uncensored"
license=('AGPL-3.0-only')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator'
         'libgcc' 'libgomp' 'libstdc++' 'libsoup3' 'openssl' 'vulkan-icd-loader' 'wayland'
         'webkit2gtk-4.1')
optdepends=('python: bundled whisper speech-to-text server')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source=("$pkgname-$pkgver.deb::https://github.com/PurpleDoubleD/$_pkgname/releases/download/v$pkgver/Locally.Uncensored_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/PurpleDoubleD/$_pkgname/v$pkgver/LICENSE")
sha256sums=('b271c84191ddd0c97895fc38eacee15c290a206bf41eeac4744c119da915345e'
            'ed123c99c3a27f69c05a2ea0b3a803af84a3f7057c0f494707c294ad31935185')

package() {
  bsdtar -xzf "$srcdir/data.tar.gz" -C "$pkgdir"

  # Relocate the bundled llama-server sidecar out of /usr/bin into the app's
  # resource dir to avoid a file-path collision with a system llama.cpp install.
  # The app resolves the sidecar via resource_dir() (engine.rs:
  # resolve_engine_binary), so it is still found and the built-in engine works.
  mv "$pkgdir/usr/bin/llama-server" "$pkgdir/usr/lib/Locally Uncensored/llama-server"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
