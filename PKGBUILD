# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
_pkgname=cc-map-editor
pkgname="${_pkgname}-bin"
pkgver=0.7.1
pkgrel=1
pkgdesc="A Map Editor for the game CrossCode"
arch=('any')
url='https://github.com/CCDirectLink/crosscode-map-editor'
license=('custom:MIT')
depends=(electron)
makedepends=(asar npm)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage_file="${_pkgname}-${pkgver}-linux.AppImage"
source=("https://github.com/CCDirectLink/crosscode-map-editor/releases/download/v${pkgver}/${_appimage_file}"
        "https://github.com/CCDirectLink/crosscode-map-editor/raw/v${pkgver}/LICENSE"
        "patch-desktop-entry.awk"
        "pr175-package.json"
        "pr175-package-lock.json"
        "disable-autoupdates.patch")
noextract=("${_appimage_file}")
sha256sums=('4ad778269cbf9db79bb61f62e6cce8b4aa6f27a7e1e14cb253067b24a4dc1b76'
            'a406579cd136771c705c521db86ca7d60a6f3de7c9b5460e6193a2df27861bde'
            'c03a2ede59f0476176c1a32d28ac19e907e76b1dbfdffa93d9eefa40d868506b'
            '1b26f6c1b4af8707c555f845d3f90c34f28adf19cc05797af4ca89a32e2daee9'
            'e1ac90aa51ad52b759d48d8f722d1e5b1946583c99cdc6bef5442f7a21c0078f'
            '2f5e6d94043cb23bbf11661945481093fcf9c72bf03131e00b7d032719e9bff0')

prepare() {
  mkdir -p "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"

  msg2 "Extracting ${_appimage_file}..."
  chmod +x "${srcdir}/${_appimage_file}"
  # extracts the AppImage contents into a directory called `squashfs-root`, see
  # <https://docs.appimage.org/user-guide/run-appimages.html#extract-the-contents-of-an-appimage>
  "${srcdir}/${_appimage_file}" --appimage-extract 2>/dev/null

  msg2 "Generating ${_pkgname}.sh..."
  cat > "${_pkgname}.sh" <<EOF
#!/bin/sh
exec electron /usr/lib/${_pkgname}/app.asar "\$@"
EOF

  msg2 "Generating ${_pkgname}.desktop..."
  awk -f "${srcdir}/patch-desktop-entry.awk" -v executable_path="/usr/bin/${_pkgname}" \
    "squashfs-root/${_pkgname}.desktop" > "${_pkgname}.desktop"

  msg2 "Extracting app.asar..."
  asar extract "squashfs-root/resources/app.asar" "app"

  msg2 "Patching app.asar..."
  (
    cd "app"

    # Upstream `package.json` has a lot of dependencies which are really dev
    # dependencies and not required to run the application, yet they are
    # packaged into the distribution `app.asar` making it ~220 megabytes big. A
    # pull request has been opened on the upstream per my request to move such
    # packages to dev dependencies (see
    # <https://github.com/CCDirectLink/crosscode-map-editor/pull/175>), but
    # until it is merged and 0.7.2 is released I have to reinstall `node_modules`
    # by using a custom `package.json`. `package-lock.json` is included as well
    # for the sake of making the build reproducible.
    cp "${srcdir}/pr175-package.json" "package.json"
    cp "${srcdir}/pr175-package-lock.json" "package-lock.json"
    npm ci --cache "${srcdir}/npm-cache"

    patch --forward --input="${srcdir}/disable-autoupdates.patch"
    npm uninstall --no-audit electron-{updater,log}

    rm "package-lock.json"
  )

  msg2 "Packing app.asar..."
  asar pack "app" "app.asar"
}

package() {
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${pkgname}-${pkgver}"

  install -Dm644 "app.asar" "${pkgdir}/usr/lib/${_pkgname}/app.asar"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  local icon_size icon_path; for icon_size in 16 24 32 48 64 96 128 256; do
    icon_path="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_pkgname}.png"
    install -Dm644 "squashfs-root/${icon_path}" "${pkgdir}/${icon_path}"
  done
}
