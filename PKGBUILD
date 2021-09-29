# Maintainer: lsf
# Contributer: Sam Whited <sam@samwhited.com>
# Contributor: Roman Kupriyanov <mr.eshua@gmail.com>

pkgname=jitsi-meet-desktop
pkgver=2.9.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application"
arch=('x86_64' 'aarch64')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
conflicts=('jitsi-meet-electron-bin'
           'jitsi-meet-electron')
replaces=('jitsi-meet-electron')
depends=('gtk3'
         'libxss'
         'nss')
depends=('electron13')
makedepends=('coreutils'
             'git'
             'npm'
             'python'
             'png++'
             'libxtst'
             'nvm'
             )

options=(!strip)
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/jitsi/jitsi-meet-electron/archive/v${pkgver}.tar.gz"
        'no_targets.patch'
        'jitsi-meet-desktop.desktop')
sha256sums=('19c3b48c94b1685c210ea745f8c749cea13a26430229d50b24e2c180d7c17dc7'
            'ab22749aa1570cc5d6050711011f849ec3f4fa49080231f98957255fa5250e36'
            '36a30a15613d53b2a01626a5551315c6970889ce3c2688bce71e26c3333081a4')

case "$CARCH" in
        aarch64)
                _electronbuilderarch='arm64'
                _dist_path="linux-${_electronbuilderarch}-unpacked"
        ;;
        *)
                _electronbuilderarch='x64'
                _dist_path="linux-unpacked"
        ;;
esac

prepare() {
  cd jitsi-meet-electron-${pkgver}
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm install 14

  # remove all hardcoded (x64) electron-builder targets
  # for some reason, it's not enough to explicitely specify the desired (dir)
  # target when calling electron-builder..
  patch -Np1 -i ${srcdir}/no_targets.patch

  _electron_dist=/usr/lib/electron13
  _electron_ver=$(cat ${_electron_dist}/version)
  sed -r 's#("electron": ").*"#\1'${_electron_ver}'"#' -i package.json

  npm install
  # npm audit fix
}

build() {
  cd jitsi-meet-electron-${pkgver}
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm use 14

  # npm run build
  npx webpack --config ./webpack.main.js --mode production
  npx webpack --config ./webpack.renderer.js --mode production
  npx electron-builder --linux --${_electronbuilderrarch} --dir dist -c.electronDist=${_electron_dist} -c.electronVersion=${_electron_ver}
}

package() {
  cd jitsi-meet-electron-${pkgver}/

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/jitsi-meet-electron-${pkgver}/dist/${_dist_path}"/resources/* "${pkgdir}/opt/${pkgname}"

  install -Dm644 -- resources/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"


  cat << EOF > "$pkgdir"/usr/bin/$pkgname
#!/bin/sh

NODE_ENV=production ELECTRON_IS_DEV=false exec electron13 /opt/$pkgname/app.asar "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/$pkgname

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # # https://wiki.archlinux.org/title/Node.js_package_guidelines#Package_contains_reference_to_$srcdir/$pkgdir
  # find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  # local tmppackage="$(mktemp)"
  # local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  # jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  # mv "$tmppackage" "$pkgjson"
  # chmod 644 "$pkgjson"
}

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}
