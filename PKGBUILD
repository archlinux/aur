# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: teutat3s <teutates@mailbox.org>
# Contributor: jaltek <post@ezod.de>
# Contributor: Daniel Mason (idanoo) <daniel@m2.nz>

_electron=electron
pkgbase=element-desktop-git
pkgname=(element-web-git element-desktop-git)
pkgver=1.11.2.rc.1.r41.g39eee10c57
pkgrel=1
pkgdesc="Glossy Matrix collaboration client — "
arch=(x86_64)
url="https://element.io"
license=(Apache)
makedepends=(npm git yarn python rust tcl ${_electron} nodejs sqlcipher)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_giturl="git+https://github.com/vector-im"
source=("element-web::${_giturl}/element-web.git"
        "element-desktop::${_giturl}/element-desktop.git"
        autolaunch.patch
        io.element.Element.desktop
        element-desktop.sh)
sha512sums=('SKIP'
            'SKIP'
            '76f0e19739d2eb409524e13336631c321d199ee3135ffbe0c92458d566a5588b9453db50454d25f2b892fc176c4bf0395399f10a090c8cc33330ce96cb4c0b02'
            '72966c7067a18a9b19d6164354f4b8622aaa1c5cc29591c5a406018873613747613642a758fdfe9ce09cb0a85085117d1ab8e1131dc36c9ff5bfb4d21ef410c3'
            '246f102c5768855deb155e6c33fc53f69ddec6d211db4eef8730cfba6e41bb01cc0b8983c2411c42872a5b768310d2495f919268f9420cacc2a12ad4e4ff11eb')

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
  sed -i 's|"https://packages.element.io/desktop/update/"|null|' element.io/release/config.json
  yarn install --no-fund
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
  depends=("element-web-git=${pkgver}" ${_electron} libsecret)
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
