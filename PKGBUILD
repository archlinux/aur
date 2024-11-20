# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=iptvorg-epg
pkgver=2023.12.1
pkgrel=8
pkgdesc='Utilities for downloading the EPG (Electronic Program Guide) for thousands of TV channels from hundreds of sources'
arch=('x86_64')
url='https://github.com/iptv-org/epg'
license=('Unlicense')
depends=('bash' 'libxml2' 'nodejs' 'npm')
makedepends=('nvm')
optdepends=('noto-fonts-emoji: compatibility with printsites option')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/iptv-org/epg/archive/refs/tags/${pkgver}.tar.gz"
        'iptvorg-epg.sh'
        'my.channels.xml')
sha256sums=('21a6654911daf24d7ed6abf8e2fcb1c7331b3cce64053a96faead3fbe98e9fb3'
            '7d17f4f7eeb416eb54eef677c5ca7f225dfa876cfcd455207a01157449ccb477'
            '26e87976d170c78e458ac44e65d305374aef67d2ab44a17bce151e86a2b783e5')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  # Set node.js to v20.18.0 for build 
  nvm install 20.18.0
}

build() {
  _ensure_local_nvm
  npm install --cache "${srcdir}/npm-cache" --prefix epg-${pkgver} >/dev/null
  bsdtar -a -cf epg-${pkgver}.tgz epg-${pkgver}
}

package() {
  install -Dm755 iptvorg-epg.sh "${pkgdir}/usr/bin/iptvorg-epg"
  install -Dm644 epg-${pkgver}.tgz -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 my.channels.xml -t "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:
