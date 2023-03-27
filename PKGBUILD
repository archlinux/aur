# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=xfce4-settings
_pkgver=4.18.2
pkgname=${_pkgname}-standalone
pkgver=4.18.2+f9cb09a7
pkgrel=1
pkgdesc="Xfce's Configuration System"
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
        'default-xsettings-xml.patch'
        'remove-settings-manager.patch'
        'remove-accessibility-settings.patch'
        'remove-session-manager-connection.patch'
        'remove-colord-support.patch')
sha256sums=('SKIP'
            '4ae19d6ddb5b343490bae5c31342d5c179ab707ec45f0ac74f5b7d3096484353'
            '32891ce3341b66393278527a77e1fa3091c569c32e722b2906c7af77b5787c65'
            'faccdfa9d632d8eb5d837ec8e6718ad3e8988f3843d1035bd3133b76046f0aae'
            '60673ce39d805366abbd512055a2294bece7c1663ae04f013d5271bcbc1a7275'
            '185f8577db0365086b1f687c0e83a7eee4ad50fce5c3f15882c105a26f7864be')

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

  # Remove colord support.
  patch -Np1 -i "$srcdir/remove-colord-support.patch"
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
