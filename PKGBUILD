# Owner: Marcel Radzio <info@nordgedanken.de>
# Maintainer: Daniel Mason (idanoo) <daniel@m2.nz>
pkgbase=riot-desktop-git
_vers=v1.6.7
pkgver=v1.6.7.r0.g70e981f5
pkgrel=1
pkgname=(riot-web-git riot-desktop-git)
pkgdesc="A glossy Matrix collaboration client for the desktop."
arch=('x86_64')
url="https://riot.im"
license=('Apache')
depends=('electron')
makedepends=('git' 'nodejs' 'jq' 'yarn' 'npm' 'python' 'rust' 'sqlcipher' 'electron')
provides=('riot-desktop')
backup=("etc/riot/config.json")
_giturl='git://github.com/vector-im'
source=("riot-web::${_giturl}/riot-web.git#tag=${_vers}"
        "riot-desktop::${_giturl}/riot-desktop.git#tag=${_vers}"
        "riot-desktop.desktop"
        "riot-desktop.sh")
sha256sums=('SKIP'
            'SKIP'
            'b94e5d51831cf57729c96e716cdda3a034a1dda7a0f9e2e6fbd040be2c862604'
            'a6cc599b226357a6e219d17b29834aa34b993029c5c83e46402117f10fa4f91e')

pkgver() {
  cd "$srcdir/riot-web"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd riot-desktop
  # Switch target to output to directory rather than .deb package
  sed -i 's/"target": "deb"/"target": "dir"/g' package.json
  sed -i 's@"https://packages.riot.im/desktop/update/"@null@g' riot.im/release/config.json
  yarn install

  cd ../riot-web
  # Disable auto updating
  sed -i 's@"https://packages.riot.im/desktop/update/"@null@g' riot.im/app/config.json

  yarn install
}

build() {
  cd riot-web
  yarn build

  cd ../riot-desktop
  yarn run build:native
  yarn run build
}

package_riot-web-git() {
  pkgdesc="Glossy Matrix collaboration client for the web."
  provides=(vector-web)
  replaces=(vector-web)

  cd riot-web

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/riot

  cp -r webapp/* "${pkgdir}"/usr/share/webapps/riot/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/riot/
  ln -s /etc/webapps/riot/config.json "${pkgdir}"/usr/share/webapps/riot/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/riot/version
}

package_riot-desktop-git() {
  pkgdesc="Glossy Matrix collaboration client for the desktop."
  depends=("riot-web-git=${pkgver}" electron sqlcipher)
  backup=('etc/riot/config.json')

  cd riot-desktop

  install -d "${pkgdir}"{/usr/lib/riot,/etc/webapps/riot}

  # Install the app content, replace the webapp with a symlink to the system package
  cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/riot/
  ln -s /usr/share/webapps/riot "${pkgdir}"/usr/lib/riot/webapp

  # Config file
  ln -s /etc/riot/config.json "${pkgdir}"/etc/webapps/riot/config.json
  install -Dm644 riot.im/release/config.json -t "${pkgdir}"/etc/riot/

  # Required extras
  install -Dm644 ../riot-desktop.desktop "${pkgdir}"/usr/share/applications/riot-desktop.desktop
  install -Dm755 ../riot-desktop.sh "${pkgdir}"/usr/bin/riot-desktop

  # Icons
  install -Dm644 ../riot-web/res/themes/riot/img/logos/riot-im-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/riot.svg
  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/riot.png
  done
}