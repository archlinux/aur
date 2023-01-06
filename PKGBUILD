# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=xfce4-settings
_pkgver=4.18.1
pkgname=${_pkgname}-standalone
pkgver=4.18.1+1ce79a55
pkgrel=1
pkgdesc="Settings manager of the Xfce desktop"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfce4-settings/start"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'libxfce4ui' 'xfconf' 'libnotify' 'libcanberra'
         'colord' 'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra')
makedepends=('intltool' 'xf86-input-libinput' 'git' 'xfce4-dev-tools' 'garcon')
optdepends=('python: xfce4-compose-mail -- "mailto:" URI handling' 'elementary-icon-theme')

provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}#tag=${_pkgname}-${_pkgver}"
        'default-xsettings-xml.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/default-xsettings-xml.patch?h=packages/xfce4-settings'
        'remove-settings-manager.patch'
        'remove-accessibility-settings.patch'
        'remove-session-manager-connection.patch')
sha256sums=('SKIP'
            '8e9a6c70ab0ceb5d91b637dc290768f8a47edb5d7b6e2eebc4459dbc4ee040d7'
            'c74353e795c54a8c1268835026236fae37ac196a621d871a2e518c1087aa0248'
            '250ffff5d8c19649e649eed3b2025efbee938432097b8dc50d807581d145ef1b'
            'd536164dbe05d9f33f3d9b0f022d4146bd74285ac87deaec81e7cd6e9349a252')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s+%s" "${_pkgver}" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # Enable Adwaita theme and font hinting by default
  patch -Np1 -i "$srcdir/default-xsettings-xml.patch"

  # Do not build xfce4-settings-manager to remove extra package dependencies
  patch -Np1 -i "$srcdir/remove-settings-manager.patch"

  # Do not build accessibility-settings
  patch -Np1 -i "$srcdir/remove-accessibility-settings.patch"

  # Remove session-manager support
  patch -Np1 -i "$srcdir/remove-session-manager-connection.patch"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-xrandr \
    --enable-xcursor \
    --enable-libnotify \
    --enable-libxklavier \
    --disable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
