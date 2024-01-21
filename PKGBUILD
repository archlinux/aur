# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
_appdata_id=org.nicotine_plus.Nicotine
pkgver=3.3.0.dev6.r9955.023383076
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.org"
license=('GPL-3.0-or-later')
depends=('python-gobject')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('gtk4: default GTK version'
            'libadwaita: for Adwaita theme on GNOME (GTK 4)'
            'gtk3: fallback if GTK 4 is not installed'
            'gspell: for spell checking in chat (GTK 3)')
checkdepends=('appstream-glib' 'desktop-file-utils' 'python-pytest')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(python setup.py --version)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/${pkgname%-git}"

  # Tests requiring an Internet connection are disabled
  pytest --deselect=test/unit/test_version.py

  desktop-file-validate "data/${_appdata_id}.desktop"
  appstream-util validate-relax --nonet "data/${_appdata_id}.appdata.xml"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  cd po
  for lang in $(ls *.po); do
    echo "lang: ${lang}"
    lang=${lang::-3}
    install -d "$pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES"
    msgfmt -c -o "$pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES/nicotine.mo" "${lang}.po"
  done
}
