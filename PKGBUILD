# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Jean Lucas <jean@4ray.co>

_pkgroot=signal-desktop
pkgname=${_pkgroot}-noto
_pkgname=Signal-Desktop
pkgver=1.30.0
pkgrel=1
pkgdesc="Electron application that links with Signal on mobile (Noto emoji version)"
license=('GPL3')
arch=('x86_64')
url="https://github.com/Skycoder42/Signal-Desktop-Noto"
depends=('electron' 'libvips')
makedepends=('yarn' 'git' 'nodejs' 'npm' 'python' 'python2')
provides=(signal signal-desktop)
replaces=(signal signal-desktop)
source=(
  "${_pkgroot}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${_pkgroot}.desktop"
  "openssl-linking.patch"
  "expire-from-source-date-epoch.patch"
  "noto-emoji.patch"
  # Cherry-pick a specific commit for the node-spellchecker dependency
  # See https://github.com/atom/node-spellchecker/issues/127
  "https://github.com/atom/node-spellchecker/archive/613ff91dd2d9a5ee0e86be8a3682beecc4e94887.tar.gz"
)
sha512sums=('bc804a1fe3135418cc0b4e8a5db87f86a6f246f97fc0599911816c581cb129239c46f3be036be31cb90e2eea9d64276887a845329e474e443d119071b56606c9'
            'c6ef4b73440bfc4e15114ffe6a7c8114e9d824fac08daafd5d13096e946c6fbb169a5d6cdbf1d34b956223ab14bd9bb9e173ae4d01025103d0ae61fc8de26189'
            'a25698e39e2a3e88ce87e4b89bf222169c279a63359b576e05883682ee1553600b3e7afee5063aa901eaa8529a93d324b4e227d51d491a2054b559d9865ee6da'
            '1d0c276528b19b103a000d8640805971dc2b79b2ef785d3df2d31f610991b3404500ee7118d80da57332578132c04903fd9b9ff157144f2a0226a9efc73561a5'
            'fa54d57365dfb1a4a7ae8117e9f923285cb3934454b5587fc993633e8c26a5ac954a55dece0361d7bf55d697854dc14cf3d022691ddc31b5434c4e1207c56d52'
            '42f57802fa91dafb6dbfb5a3f613c4c07df65e97f8da84c9a54292c97a4d170f8455461aac8f6f7819d1ffbea4bf6c28488f8950056ba988776d060be3f107dd')
b2sums=('39b94317f440e133d755956e2ebe4705653e13d9c7f0e66c0df676645d90ccd490ca584c14e532fc491a35da436b1b592a5cef819ae0b2715a51fb9947bdd9d4'
        '678d776f8468fd16d06763a141882d2408ff1c775f2115080f5ab0ee6e6fd18e353ca31d9cddd5eba21a86ce1a3b404e595dec7e2e5baf7227b58f4d46fdea88'
        '7173c57b0645533202c0dffdf3aa54f92e9589eecd95c2a32ec9ef341e990bfe6d927e914322e6a39ffda38fa65c25f75cc7805ec70af9fc2c543256ac4e94c3'
        'a0ab62451aa9ba9782ba49fbb6173c4bfabf849b68d6bbc7789dca8593558ef169139c95df701a86f629ae1d0714284d4c2aea2cb0a4240b4ca35c8503d9d2c4'
        '64ef030d18c1164bbb34d5ddba7d61894f8ada0dda1604e36760dcafe4930dcc07e062e2d9be8dfeef59ef8c7fb1cae082f0dfafcf03762ffabaae0aee00566f'
        '53ad39f0bed69c5c5635d2e581f4ce56e3080fee16f184add08adee1164c2d68059d52071478a05cdacf04186f9964250f46f09e80553bf35e1f2f4cd1976d1b')

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
}

# vim: ts=2 sw=2 et:
