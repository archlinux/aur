# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop-beta
pkgdesc="Threema Desktop 2.0 Beta."
pkgver=2.0_beta56
_pkgver=${pkgver//_/-}
pkgrel=2
arch=('x86_64')
url="https://github.com/threema-ch/threema-desktop"
license=('AGPL-3.0-only')
depends=(
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
b2sums=('04dc0f262059323e4bd0b7dba33e80c4be68cf114dd4f48b42177297f48a059a139464971f816d871e68a425f200a0e03383273d01f2c810d47213af2147f844') # Use get-checksum.sh to update

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

  # Right now the used version of wasm-bindgen in libthreema and the installed
  # version of wasm-bindgen-cli on the system need to match. Otherwise, you get
  # this error while building:
  #
  # > it looks like the Rust project used to create this Wasm file was linked against
  # > version of wasm-bindgen that uses a different bindgen format than this binary:
  #
  # To achieve this, we have two options:
  # - Patch threema-desktop sources to use the latest version
  # - Download a specific version of wasm-bindgen-cli
  #
  # For now, the first approach is chosen (even though this might break things
  # when wasm-bindgen does an incompatible upgrade).
  BINDGEN_VERSION=$(wasm-bindgen --version | awk '{ print $NF }')
  cd libs/libthreema/lib/
  sed -i '/^wasm-bindgen[ =]/s/version = "=.*"/version = "='$BINDGEN_VERSION'"/' Cargo.toml
  cargo fetch
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
  export CARGO_TARGET_DIR=target
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

  # Create launcher script
  mkdir -p "${pkgdir}/usr/bin/"
  {
    echo "#!/usr/bin/env bash"
    echo "set -euo pipefail"
    echo ""
    echo "# Use native Wayland if available"
    echo "export ELECTRON_OZONE_PLATFORM_HINT=auto"
    echo ""
    echo "exec /opt/${pkgname}/ThreemaDesktopLauncher"
  } >> "${pkgdir}/usr/bin/threema-beta"
  chmod +x "${pkgdir}/usr/bin/threema-beta"

  # Copy desktop file
  install -D "packaging/metadata/${rdn}.desktop" "${pkgdir}/usr/share/applications/${rdn}.desktop"
  sed -i -s "s/=Threema/=Threema Beta/" "${pkgdir}/usr/share/applications/${rdn}.desktop"
  sed -i -s "s/Exec=/Exec=\/usr\/bin\/threema-beta/" "${pkgdir}/usr/share/applications/${rdn}.desktop"
}

# vim:set ts=2 sw=2 et:
