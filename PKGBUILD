# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-material-you-theme-git
pkgver=r96.06b1f24
pkgrel=2
pkgdesc="Applies generated libadwaita theme from wallpaper using Material You"
arch=('any')
url="https://github.com/avanishsubbiah/material-you-theme"
license=('GPL3')
depends=('adw-gtk3' 'gnome-shell' 'sassc')
makedepends=('git')
optdepends=('python-pywal: Run wal on background change')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/avanishsubbiah/material-you-theme.git'
        'https://github.com/avanishsubbiah/material-you-theme/pull/56.patch')
sha256sums=('SKIP'
            'cf8088d220547417013de81a2b0623572599d65b5b3f474ff858a747b7d93fbd')

pkgver() {
  cd "$srcdir/material-you-theme"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/material-you-theme"

  # Run wal on background change and use system sassc
  patch -Np1 -i ../56.patch
}

build() {
  cd "$srcdir/material-you-theme"
  make build
}

package() {
  cd "$srcdir/material-you-theme"
  _uuid='material-you-theme@asubbiah.com'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.material-you-theme.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
