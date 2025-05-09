# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop-beta
pkgdesc="Threema Desktop 2.0 Beta."
pkgver=2.0_beta51
_pkgver=${pkgver//_/-}
pkgrel=1
arch=('x86_64')
url="https://github.com/threema-ch/threema-desktop"
license=('AGPL-3.0-only')
depends=(
  # Fonts
  ttf-opensans
  # Electron deps as reported by namcap
  alsa-lib
  at-spi2-core
  cairo
  dbus
  expat
  gcc-libs
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libcups
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  pango
  systemd-libs
)
makedepends=(
  # JS
  npm nvm
  # node-gyp
  python python-setuptools
  # For building Rust code in general
  rustup
  # For building libthreema
  wasm-bindgen binaryen protobuf
)
#options=('strip')
source=("https://releases.threema.ch/desktop/${_pkgver}/threema-desktop-v${_pkgver}-source.7z")
b2sums=('b548c5a062ccefc7f3248d4e6be2d1a9c2b2cf92efe7b4ff023b0607dbae57e2b14e92092cff71a5d0f243612439d248025a70119f32872210c9453cb5302eb4') # Append .b2 to source URL

# See https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # Let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvmrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "${srcdir}/threema-desktop-v${_pkgver}"

  # Patch version to indicate this is an AUR package
  sed -i -s 's/"version": "'${_pkgver}'"/"version": "'${_pkgver}-aur'"/' package.json

  # Patch fonts, add OpenSans as primary fallback
  for f in src/sass/app.scss src/index.html src/app/ui/components/partials/settings/internal/profile-settings/internal/public-key-modal/PublicKeyModal.svelte; do
    sed -i "s/'Lab Grotesque'/'Lab Grotesque', 'Open Sans'/" "$f"
  done
}

build() {
  cd "${srcdir}/threema-desktop-v${_pkgver}"

  # Ensure correct NodeJS version for building
  _ensure_local_nvm
  nvm install

  # Note: Overriding flags as a workaround for https://github.com/ranisalt/node-argon2/issues/454
  export CFLAGS=${CFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}
  export CPPFLAGS=${CPPFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}
  export CXXFLAGS=${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=3/}

  # Install dependencies
  npm install --cache "${srcdir}/npm-cache" --no-audit --no-fund

  # Install Rust WASM toolchain
  cd libs/libthreema/
  rustup target add wasm32-unknown-unknown

  # Build libthreema
  npm run libthreema:build

  # Build application
  npm run dist:consumer-live
}

package() {
  cd "${srcdir}/threema-desktop-v${_pkgver}"
  export rdn=ch.threema.threema-desktop

  # Note: We cannot easily launch Threema through system electron, because
  # `ThreemaDesktopLauncher` attempts to launch a binary called
  # `ThreemaDesktop`. Even if we would place an shell script at that location,
  # it would not work because it's not really executable.
  #
  # As a workaround, we could compile a custom mini-application within this
  # package that launches Threema through system electron. But for now, let's
  # just bundle everything. This way, we can also be sure that a well-tested
  # version of Electron is used for Threema.

  # Remove files not needed on Linux
  rm "build/electron/packaged/Threema Beta-linux-x64/resources/"Square*Logo*.png
  rm "build/electron/packaged/Threema Beta-linux-x64/resources/StoreLogo.png"

  # Copy application
  mkdir -p "${pkgdir}/opt/"
  cp -r "build/electron/packaged/Threema Beta-linux-x64/" "${pkgdir}/opt/${pkgname}/"
  chmod 755 "${pkgdir}/opt/${pkgname}/"

  # Copy icons
  for i in 64 128 180 192 256 512; do
    install -Dm 644 "build/electron/app/res/icons/consumer-live/icon-${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${rdn}.png"
  done

  # Copy desktop file
  install -D "packaging/metadata/${rdn}.desktop" "${pkgdir}/usr/share/applications/${rdn}.desktop"
  sed -i -s "s/=Threema/=Threema Beta/" "${pkgdir}/usr/share/applications/${rdn}.desktop"
  sed -i -s "s/Exec=/Exec=\/opt\/${pkgname}\/ThreemaDesktopLauncher/" "${pkgdir}/usr/share/applications/${rdn}.desktop"

  # Symlink launcher binary
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/ThreemaDesktopLauncher" "${pkgdir}/usr/bin/threema-beta"
}

# vim:set ts=2 sw=2 et:
