# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>

_pkgname=xfce4-settings
_pkgver=4.16.2
pkgname=${_pkgname}-standalone
pkgver=${_pkgver}+0+g2076199f
pkgrel=2
pkgdesc="Settings manager of the Xfce desktop"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfce4-settings/start"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'libxfce4ui' 'xfconf' 'libnotify' 'libcanberra'
         'colord' 'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra')
makedepends=('intltool' 'xf86-input-libinput' 'git' 'xfce4-dev-tools')
optdepends=('python: xfce4-compose-mail -- "mailto:" URI handling')

provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}#tag=${_pkgname}-${_pkgver}"
        'default-xsettings-xml.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/default-xsettings-xml.patch?h=packages/xfce4-settings'
        'remove-settings-manager.patch')
sha256sums=('SKIP'
            '8e9a6c70ab0ceb5d91b637dc290768f8a47edb5d7b6e2eebc4459dbc4ee040d7'
            'c74353e795c54a8c1268835026236fae37ac196a621d871a2e518c1087aa0248')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"

  # Enable Adwaita theme and font hinting by default
  patch -Np1 -i "$srcdir/default-xsettings-xml.patch"

  # Do not build xfce4-settings-manager to remove extra package dependencies
  patch -Np1 -i "$srcdir/standalone.patch"
  rm -vrf "$srcdir/$pkgname-$pkgver/xfce4-settings-manager"
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
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
