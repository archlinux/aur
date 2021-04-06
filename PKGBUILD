# Maintainer: robertfoster

pkgname=pyload-git
pkgver=0.4.20.r211.4b905ceb5
pkgrel=1
pkgdesc="Downloadtool for One-Click-Hoster written in python. Latest stable branch"
url="https://pyload.net/"
license=('GPL')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('var/lib/pyload/pyload.conf')
depends=('python2' 'python2-crypto' 'python2-imaging' 'python2-pycurl' 'python2-pyopenssl' 'tesseract')
optdepends=('js68: ClickNLoad'
  'python2-flup: for additional webservers'
  'python2-notify: Notifications for GUI'
  'python2-pyqt: Gui')
makedepends=('git')
install='pyload-git.install'

source=("${pkgname%-git}::git+https://github.com/pyload/pyload.git#branch=stable"
  'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/applications/pyload-gui.desktop'
  'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/applications/pyload.desktop'
  'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/pixmaps/pyload-gui.png'
  'http://bitbucket.org/ranan/pyload-dist/raw/bf705af8f412/debian/pyload/usr/share/pixmaps/pyload.svg'
  'pyload.service' 'pyload.conf' 'pyLoadCore' 'pyLoadCli' 'pyLoadGui')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  sed -i 's_#!/usr/bin/env python$_#!/usr/bin/env python2_' pyLoad*.py
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  python2 -O -m compileall .
}

package() {
  cd "${srcdir}/"

  install -dm755 "${pkgdir}/opt/${pkgname%-git}"
  cp -r "${pkgname%-git}"/* "${pkgdir}/opt/${pkgname%-git}"

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgname%-git}.desktop" \
    "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgname%-git}-gui.desktop" \
    "${pkgdir}/usr/share/applications"

  # Create desktop icons
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${pkgname%-git}.svg" \
    "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${pkgname%-git}-gui.png" \
    "${pkgdir}/usr/share/pixmaps"

  # Create launcher scripts
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 pyLoadCore "${pkgdir}/usr/bin/pyLoadCore"
  install -Dm755 pyLoadCli "${pkgdir}/usr/bin/pyLoadCli"
  install -Dm755 pyLoadGui "${pkgdir}/usr/bin/pyLoadGui"

  # Create systemd service
  install -Dm644 "${pkgname%-git}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
  install -Dm644 "${pkgname%-git}.conf" \
    "${pkgdir}/var/lib/${pkgname%-git}/${pkgname%-git}.conf"
}

md5sums=('SKIP'
  'b96a4e5091463b3b7fd79208623f1a3a'
  'c67462993d27d5884677dd6e8a8a17d2'
  '73fcec930d25a49e1b99576069d88bd5'
  '649d5af94101655d37fe50e7b127d1b6'
  '454e974b11ab31533423f336c3a182f2'
  '32b00d50be868c165930c592b99730a9'
  '6d764666ec89ce218cd00164e73e0989'
  '6fc2f343d2f324a66745524bbab93e5c'
  '806a22a74e8331dffcb8538182e4df2c')
