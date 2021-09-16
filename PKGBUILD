# Maintainer: ta180m <ta180m@pm.me>
# Contributor: teutat3s <teutates@mailbox.org>
# Contributor: jaltek <post@ezod.de>
# Contributor: Daniel Mason (idanoo) <daniel@m2.nz>

pkgbase=element-desktop-git
pkgname=(element-web-git element-desktop-git)
pkgver=1.8.5.r27.g1aa2efd2c
pkgrel=1
pkgdesc="Glossy Matrix collaboration client — "
arch=(x86_64)
url="https://element.io"
license=(Apache)
makedepends=(npm git yarn python rust sqlcipher electron nodejs-lts-fermium)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_giturl="git+https://github.com/vector-im"
source=("element-web::${_giturl}/element-web.git"
        "element-desktop::${_giturl}/element-desktop.git"
        autolaunch.patch
        io.element.Element.desktop
        element-desktop.sh)
sha256sums=('SKIP'
            'SKIP'
            'aaae4ffa41590361dac0c159aecc1166f69e459e89faa9d5cab1202f0277e06f'
            '0103f28a32fe31f698836516783c1c70a76a0117b5df7fd0af5c422c224220f9'
            'c1bd9ace215e3ec9af14d7f28b163fc8c8b42e23a2cf04ce6f4ce2fcc465feba')
_electron=electron

pkgver() {
  cd "$srcdir/element-web"

  ( set -o pipefail
    # cutting off 'v' prefix that presents in the git tag
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  # Specify electron version in launcher
  sed -i "s|@ELECTRON@|${_electron}|" element-desktop.sh

  cd element-web
  yarn install --no-fund

  cd ../element-desktop
  patch -p1 < ../autolaunch.patch
  sed -i 's|"target": "deb"|"target": "dir"|' package.json
  sed -i 's|"electronVersion": "13.1.6"|"electronVersion": "13.1.8"|' package.json
  sed -i 's|"https://packages.riot.im/desktop/update/"|null|' element.io/release/config.json
  yarn install --no-fund

  cd ../element-web/node_modules/matrix-react-sdk
  yarn reskindex
}

build() {
  cd element-web
  yarn build --offline

  cd ../element-desktop
  yarn run build:native
  yarn run build
}

package_element-web-git() {
  pkgdesc+="web version."
  replaces=(riot-web vector-web)
  provides=(element-web)
  conflicts=(element-web)
  
  cd element-web

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/element

  cp -r webapp/* "${pkgdir}"/usr/share/webapps/element/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/element/
  ln -s /etc/webapps/element/config.json "${pkgdir}"/usr/share/webapps/element/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/element/version
}

package_element-desktop-git() {
  pkgdesc+="desktop version."
  replaces=(riot-desktop)
  depends=("element-web-git=${pkgver}" ${_electron} sqlcipher)
  provides=(element-desktop)
  conflicts=(element-desktop)
  backup=("etc/element/config.json")

  cd element-desktop

  install -d "${pkgdir}"{/usr/lib/element/,/etc/webapps/element}

  # Install the app content, replace the webapp with a symlink to the system package
  cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/element/
  ln -s /usr/share/webapps/element "${pkgdir}"/usr/lib/element/webapp

  # Config file
  ln -s /etc/element/config.json "${pkgdir}"/etc/webapps/element/config.json
  install -Dm644 element.io/release/config.json -t "${pkgdir}"/etc/element

  # Required extras
  install -Dm644 ../io.element.Element.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm755 ../${pkgname%-git}.sh "${pkgdir}"/usr/bin/${pkgname%-git}

  # Icons
  install -Dm644 ../element-web/res/themes/element/img/logos/element-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/io.element.Element.svg
  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/io.element.Element.png
  done
}
