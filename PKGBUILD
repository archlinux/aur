# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>

_pkgroot=signal-desktop
pkgname=${_pkgroot}-noto
_pkgname=Signal-Desktop
pkgver=1.33.4
pkgrel=1
pkgdesc="Electron application that links with Signal on mobile (Noto emoji version)"
license=('GPL3')
arch=('x86_64')
url="https://github.com/Skycoder42/Signal-Desktop-Noto"
depends=('electron' 'libvips')
makedepends=('yarn' 'git' 'nodejs' 'npm' 'python')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
provides=(signal signal-desktop signal-desktop-bin)
replaces=(signal signal-desktop signal-desktop-bin)
source=(
  "${_pkgroot}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${_pkgroot}.desktop"
  "openssl-linking.patch"
  "expire-from-source-date-epoch.patch"
  # Cherry-pick a specific commit for the node-spellchecker dependency
  # See https://github.com/atom/node-spellchecker/issues/127
  "https://github.com/atom/node-spellchecker/archive/613ff91dd2d9a5ee0e86be8a3682beecc4e94887.tar.gz"
  "noto-emoji.patch"
  "$pkgname.rule"
)
sha512sums=('1bb5f596fe085ff3b3883ac5e6bad899af5ec95759265634dc0258ed6999eb622dae869ea4783a9603fc7c3e8c2aaad272e544862931284e8549c2df40b9a27e'
            'c6ef4b73440bfc4e15114ffe6a7c8114e9d824fac08daafd5d13096e946c6fbb169a5d6cdbf1d34b956223ab14bd9bb9e173ae4d01025103d0ae61fc8de26189'
            'a25698e39e2a3e88ce87e4b89bf222169c279a63359b576e05883682ee1553600b3e7afee5063aa901eaa8529a93d324b4e227d51d491a2054b559d9865ee6da'
            '1d0c276528b19b103a000d8640805971dc2b79b2ef785d3df2d31f610991b3404500ee7118d80da57332578132c04903fd9b9ff157144f2a0226a9efc73561a5'
            '42f57802fa91dafb6dbfb5a3f613c4c07df65e97f8da84c9a54292c97a4d170f8455461aac8f6f7819d1ffbea4bf6c28488f8950056ba988776d060be3f107dd'
            '0c3d64294a8a97e026ff7e5957bc6b9ef66f17b881c402c0fedfeeaea95836a44b581d440ff206f29af20958ca33681ae63c83366a6046495c802fcc56bee6f1'
            '76856030f91b0b4af3d4113c6a991d0a25838c7b2f02e0819e7c683dd9f710d3e75a426dcba898e946f16829e58baaf45edcf4a29991eccd692429423c473ab2')

prepare() {
  cd "${_pkgname}-${pkgver}"
  
  # apply emoji patch
  git apply ../noto-emoji.patch

  # Fix SpellChecker build with imminent Node 13
  # See https://github.com/atom/node-spellchecker/issues/127
  sed -r 's#("spellchecker": ").*"#\1file:'"${srcdir}"'/613ff91dd2d9a5ee0e86be8a3682beecc4e94887.tar.gz"#' -i package.json

  # Set system Electron version for ABI compatibility
  sed -r 's#("electron": ").*"#\1'$(cat /usr/lib/electron/version)'"#' -i package.json

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json
 
  # Select node-gyp versions with python3 support
  sed 's#"node-gyp": "5.0.3"#"node-gyp": "6.1.0"#' -i package.json
  # https://github.com/sass/node-sass/pull/2841
  # https://github.com/sass/node-sass/issues/2716
  sed 's#"resolutions": {#"resolutions": {"node-sass/node-gyp": "^6.0.0",#' -i package.json

  yarn install

  # Have SQLCipher dynamically link from OpenSSL
  # See https://github.com/signalapp/Signal-Desktop/issues/2634
  patch --forward --strip=1 --input="${srcdir}/openssl-linking.patch"

  # We can't read the release date from git so we use SOURCE_DATE_EPOCH instead
  patch --forward --strip=1 --input="${srcdir}/expire-from-source-date-epoch.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"

  # Gruntfile expects Git commit information which we don't have in a tarball download
  # See https://github.com/signalapp/Signal-Desktop/issues/2376
  yarn generate exec:build-protobuf exec:transpile concat copy:deps sass

  yarn build-release
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/"{lib,bin}
  cp -a release/linux-unpacked/resources "${pkgdir}/usr/lib/${_pkgroot}"
  cat << EOF > "${pkgdir}"/usr/bin/${_pkgroot}
#!/bin/sh

NODE_ENV=production electron /usr/lib/${_pkgroot}/app.asar "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/${_pkgroot}"

  install -Dm 644 "../${_pkgroot}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgroot}.png"
  done
  
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}

# vim: ts=2 sw=2 et:
