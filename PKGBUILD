# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
_app_id=org.nicotine_plus.Nicotine
pkgver=3.3.2.r27.gc39868a1e
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.org"
license=('GPL-3.0-or-later')
depends=('gtk4' 'python-gobject')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('libadwaita: for Adwaita theme on GNOME')
checkdepends=('appstream' 'desktop-file-utils' 'python-pytest')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"

  # Tests requiring an Internet connection are disabled
  pytest --deselect=test/unit/test_version.py

  desktop-file-validate "data/${_app_id}.desktop"
  appstreamcli validate --no-net "data/${_app_id}.appdata.xml"
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  cd po
  for lang in $(ls *.po); do
    echo "lang: ${lang}"
    lang=${lang::-3}
    install -d "$pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES"
    msgfmt -c -o "$pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES/nicotine.mo" "${lang}.po"
  done
}
