# Maintainer: Samuel Mesa <samuel.mesa@linuxmail.org>

pkgname=minke
pkgver=0.7.0
pkgrel=1
pkgdesc="Minke desktop agent powered by DeepSeek Harness"
arch=(x86_64)
url="https://github.com/lencx/Minke"
license=(Apache-2.0)

_gitname="Minke"


depends=(
  alsa-lib
  at-spi2-core
  cairo
  dbus
  expat
  glib2
  gtk3
  libcups
  libdrm
  libevdev
  libnotify
  libsecret
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  libxss
  libxtst
  mesa
  nspr
  nss
  pango
  systemd-libs
  util-linux-libs
  wayland
  xdg-utils
)
makedepends=(
  gcc
  git
  libvips
  make
  nodejs
  pnpm
  python
)
# electron@43 and the dsh harness runtime are fetched from npm/GitHub during
# the build (pnpm install + harness:stage), so network access is required.

source=(
  "$_gitname::git+https://github.com/lencx/Minke.git#tag=v${pkgver}"
  "$pkgname.desktop"
  "$pkgname.tmpfiles"
)

sha512sums=('7411f58275d0f81064c1bda7fcad58f7286d827e948518feea3bf8c1923a1ec12839e40724b9caf3a1d5e019042ed1185b46dc878e479f0024435c2364af13f3'
            '4ca3b2fb1e6ccc46180b499c39ef36150910557e4301a086de787146fdb4a21f7d7ec917b4c8bffd4ab5b0d71c541d40b7c7b903490fee14450900428377b5f6'
            '948820bfeef9a768d0d0400688b5d2e0cde94237c1cd487f83beca003c913fd495235c90b389d19f5bba199ee12d606d9c2fade8435af6c6bc101be5a3fd0e14')

# The harness runtime is a git submodule pinned by the tag; fetch it explicitly.
prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init --depth 1
}

build() {
  cd "$srcdir/$_gitname"
  # Installs app deps (incl. electron binary) and workspace packages.
  pnpm install --frozen-lockfile
  # Stage the dsh harness runtime into runtime/host from the pinned submodule
  # commit. Its native modules (sharp, node-pty, koffi) are installed against
  # the system Node.js ABI here.
  pnpm run harness:stage

  # --- Fix sharp/libvips glib collision (electron/electron#46323) ---
  # sharp bundles a private libvips with its own glib symbols that collide
  # with the system glib dynamically linked by Electron, causing SIGSEGV.
  # Remove the bundled prebuilt binaries and rebuild sharp from source
  # against the system libvips so both share the same glib instance.
  rm -rf runtime/host/node_modules/@img/sharp-linux-x64
  rm -rf runtime/host/node_modules/@img/sharp-libvips-linux-x64
  (cd runtime/host/node_modules/sharp && node install/build.js)

  # Package the unpacked app into out/Minke-linux-x64.
  pnpm run forge:package
}

check() {
  cd "$srcdir/$_gitname"
  pnpm run test:assertions
}

package() {
  cd "$srcdir/$_gitname"

  # Unpacked Electron app: binary, resources (app.asar + host/ harness
  # runtime), locales, .pak files.
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a out/Minke-linux-x64/. "$pkgdir/usr/lib/$pkgname/"
  # cp -a preserves restrictive perms (700) from the build output; make the
  # tree world-readable. Capital X only adds the exec bit to directories and
  # files that already have it (the Minke/chrome-sandbox binaries).
  chmod -R u=rwX,go=rX "$pkgdir/usr/lib/$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/Minke" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # chrome-sandbox must be setuid root; set it at install time via tmpfiles
  # (Arch does not allow setuid bits inside packages).
  install -Dm644 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  install -Dm644 resources/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 resources/icons/icon.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
