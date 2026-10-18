# Maintainer: erin <erincerys@proton.me>

pkgname=digup-bin
_pkgname=digup
_pkgver=0.7.0-beta.2
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Search your files by what's in them, on-device, with Google DeepMind's EmbeddingGemma 2"
url='https://github.com/ARahim3/DigUp'
arch=('x86_64')
# DigUp is MIT; the helper bundles llama.cpp (MIT), PDFium (BSD-3-Clause, Apache-2.0), FFmpeg (LGPL-2.1-or-later),
# dav1d (BSD-2-Clause), zlib and the Swift runtime (Apache-2.0). Texts in /usr/lib/DigUp/THIRD-PARTY-NOTICES.txt.
license=('MIT' 'Apache-2.0' 'BSD-2-Clause' 'BSD-3-Clause' 'LGPL-2.1-or-later' 'Zlib')
depends=('cairo' 'curl' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libgcc' 'libgomp'
         'libsoup3' 'libstdc++' 'webkit2gtk-4.1' 'zlib'
         # Loaded at runtime by Tauri's tray icon, so namcap can't see it.
         'libayatana-appindicator'
         # WebKit's media player hangs the search panel when a recording is the first result without these (upstream #64).
         'gst-plugins-base' 'gst-plugins-good')
optdepends=('vulkan-icd-loader: run the embedding model on the GPU through Vulkan')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("DigUp-$_pkgver.deb::$url/releases/download/v$_pkgver/DigUp_${_pkgver}_amd64.deb"
        "LICENSE-$_pkgver::https://raw.githubusercontent.com/ARahim3/DigUp/v$_pkgver/LICENSE")
noextract=("DigUp-$_pkgver.deb")
sha256sums=('b5a2b9ccf710fe54065bedb6227e877d1e8a550de8e1fbff5e139aef9b36dbd0'
            '2ba7d3ad3aafa9b791002d62a6fe237e89fa4287c2f4e59234b09d25bd909b26')

prepare() {
  mkdir -p deb
  bsdtar -xOf "DigUp-$_pkgver.deb" 'data.tar.*' | bsdtar -xf - -C deb
}

package() {
  cp -a deb/usr "$pkgdir/"

  # The .deb's copyright file is the notices file again; Tauri files the 256px icon under a size hicolor doesn't index.
  rm -r "$pkgdir/usr/share/doc"
  mv "$pkgdir/usr/share/icons/hicolor/256x256@2" "$pkgdir/usr/share/icons/hicolor/256x256"

  install -Dm644 "LICENSE-$_pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/lib/DigUp/THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}
