# Maintainer: jaltek <post@ezod.de>
# Owner: Daniel Mason (idanoo) <daniel@m2.nz>
pkgbase=element-desktop-git
_vers=v1.7.16-rc.1
pkgver=1.7.16.rc.1.r0.gd5325e203
pkgrel=1
pkgname=(element-web-git element-desktop-git)
pkgdesc="A glossy Matrix collaboration client for the desktop."
arch=('x86_64')
url="https://element.io"
license=('Apache')
depends=('electron')
makedepends=('git' 'nodejs' 'jq' 'yarn' 'npm' 'python' 'rust' 'sqlcipher' 'electron')
provides=('element-desktop')
backup=("etc/element/config.json")
_giturl='git://github.com/vector-im'
source=("element-web::${_giturl}/element-web#tag=${_vers}"
        "element-desktop::${_giturl}/element-desktop.git#tag=${_vers}"
        "element-desktop.desktop"
        "element-desktop.sh"
	"element-web-reskindex.patch")
sha256sums=('SKIP'
            'SKIP'
            '81354e663e354bd66b3f2bb303314b790bdf6d61c3d8e2df7407eb500885647d'
            'e4965abefbd609cf88349437b811bc4433d671f5ec5cd51992fd6179d483925f'
            'f4497e40fecb224ca8f1af5187250f77000e5ff9f811d24390b18d37851b4460')


pkgver() {
  cd "$srcdir/element-web"

  ( set -o pipefail
    # cutting off 'v' prefix that presents in the git tag
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd element-desktop
  # Switch target to output to directory rather than .deb package
  sed -i 's/"target": "deb"/"target": "dir"/g' package.json
  sed -i 's@"https://packages.riot.im/desktop/update/"@null@g' element.io/release/config.json
  yarn install
  
  cd ../element-web
  # Disable auto updating
  sed -i 's@"https://packages.riot.im/desktop/update/"@null@g' element.io/app/config.json

  #Patch for reskindex: https://github.com/vector-im/element-web/issues/15751#issuecomment-731247116
  patch --forward --strip=1 --input="${srcdir}/element-web-reskindex.patch"

  yarn install
}

build() {
  cd element-web
  yarn build

  cd ../element-desktop
  yarn run build:native
  yarn run build
}

package_element-web-git() {
  pkgdesc="Glossy Matrix collaboration client for the web."
  provides=(vector-web)
  replaces=(vector-web)

  cd element-web

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/element

  cp -r webapp/* "${pkgdir}"/usr/share/webapps/element/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/element/
  ln -s /etc/webapps/element/config.json "${pkgdir}"/usr/share/webapps/element/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/element/version
}

package_element-desktop-git() {
  pkgdesc="Glossy Matrix collaboration client for the desktop."
  depends=("element-web-git=${pkgver}" electron sqlcipher)
  backup=('etc/element/config.json')

  cd element-desktop

  install -d "${pkgdir}"{/usr/lib/element,/etc/webapps/element}

  # Install the app content, replace the webapp with a symlink to the system package
  cp -r dist/linux-unpacked/resources/* "${pkgdir}"/usr/lib/element/
  ln -s /usr/share/webapps/element "${pkgdir}"/usr/lib/element/webapp

  # Config file
  ln -s /etc/element/config.json "${pkgdir}"/etc/webapps/element/config.json
  install -Dm644 element.io/release/config.json -t "${pkgdir}"/etc/element/

  # Required extras
  install -Dm644 ../element-desktop.desktop "${pkgdir}"/usr/share/applications/element-desktop.desktop
  install -Dm755 ../element-desktop.sh "${pkgdir}"/usr/bin/element-desktop

  # Icons
  install -Dm644 ../element-web/res/themes/element/img/logos/element-logo.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/element.svg

  for i in 16 24 48 64 96 128 256 512; do
    install -Dm644 build/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/element.png
  done
}
