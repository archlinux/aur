# Maintainer: samsapti <sam at sapti dot me>
# Contributor: lsf
# Contributer: Sam Whited <sam@samwhited.com>
# Contributor: Roman Kupriyanov <mr.eshua@gmail.com>

pkgname=jitsi-meet-desktop
pkgver=2024.5.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application"
arch=('x86_64' 'aarch64')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
conflicts=('jitsi-meet-desktop-bin'
           'jitsi-meet-electron-bin'
           'jitsi-meet-electron')
_electron_pkg="electron30"
depends=('gtk3'
         'libxss'
         'nss'
         "${_electron_pkg}")
makedepends=('coreutils'
             'git'
             'python'
             'png++'
             'libxtst'
             'nvm')
options=(!strip)
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/jitsi/jitsi-meet-electron/archive/v${pkgver}.tar.gz"
        'no_targets.patch'
        'jitsi-meet-desktop.desktop')
sha256sums=('aa66315cd5011ccbeb08efaf2a62302de401e60234dac0847a256fafc16afe85'
            'ed3a4d4c524611ba66c9f0e28d2da77cb2948c6785367d69b86aa4965dd6bb99'
            'bc4464a6e84857ec4400e199a9022169824a8fab0ae5a1efc0d8fc28dcfffcac')

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
  nvm install

  # remove all hardcoded (x64) electron-builder targets
  # for some reason, it's not enough to explicitely specify the desired (dir)
  # target when calling electron-builder..
  patch -Np1 -i ${srcdir}/no_targets.patch

  sed 's#git+ssh://git@github.com#git+https://github.com#g' -i package-lock.json

  npm install
  # npm audit fix
}

build() {
  cd jitsi-meet-electron-${pkgver}
  export npm_config_cache="${srcdir}/npm_cache"
  _ensure_local_nvm
  nvm install

  _electron_dist=/usr/lib/${_electron_pkg}
  _electron_ver=$(cat ${_electron_dist}/version)

  # npm run build
  # no npx anymore, see https://github.com/electron-userland/electron-builder/issues/6411
  npm exec -c 'webpack --config ./webpack.main.js --mode production'
  npm exec -c 'webpack --config ./webpack.renderer.js --mode production'
  # npx electron-builder --linux --${_electronbuilderrarch} --dir dist -c.electronDist=${_electron_dist} -c.electronVersion=${_electron_ver}
  npm exec -c "electron-builder --linux --${_electronbuilderrarch} --dir dist -c.electronDist=${_electron_dist} -c.electronVersion=${_electron_ver}"
}

package() {
  cd jitsi-meet-electron-${pkgver}/

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/jitsi-meet-electron-${pkgver}/dist/${_dist_path}"/resources/* "${pkgdir}/opt/${pkgname}"

  install -Dm644 -- resources/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"


  cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh

NODE_ENV=production ELECTRON_IS_DEV=false exec $_electron_pkg /opt/$pkgname/app.asar "\$@"
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
    # in ./.nvmrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}
