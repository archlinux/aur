# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme-git
_pkgname=arc-theme
pkgname=('arc-gtk-theme-git' 'arc-solid-gtk-theme-git')
pkgver=20200819.r58.g0c53316
pkgrel=1
pkgdesc="A flat theme suite with transparent elements."
arch=('any')
url="https://github.com/jnsh/arc-theme"
license=('GPL3')
makedepends=('sassc' 'inkscape' 'optipng' 'git')
optdepends=('gtk-engine-murrine: GTK2 support'
            'gnome-themes-extra: GTK2 support')
source=("${_pkgname}::git+https://github.com/jnsh/${_pkgname}.git")
md5sums=('SKIP')

# Latest stable Arch package versions
_cinnamonver=4.8
_gnomeshellver=3.38
_gtk3ver=3.24

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  ./autogen.sh --prefix=/usr \
    --with-cinnamon="${_cinnamonver}" \
    --with-gnome-shell="${_gnomeshellver}" \
    --with-gtk3="${_gtk3ver}"
  make

  cd "${srcdir}"
  cp -a "${_pkgname}"{,-solid}

  cd "${_pkgname}-solid"
  ./autogen.sh --prefix=/usr \
    --with-cinnamon="${_cinnamonver}" \
    --with-gnome-shell="${_gnomeshellver}" \
    --with-gtk3="${_gtk3ver}" \
    --disable-transparency
  make
}

package_arc-gtk-theme-git() {
  conflicts=('arc-gtk-theme')

  cd "${_pkgname}"
  make DESTDIR="$pkgdir/" install
}

package_arc-solid-gtk-theme-git() {
  pkgdesc="A flat theme suite without transparent elements."
  conflicts=('arc-solid-gtk-theme')

  cd "${_pkgname}-solid"
  make DESTDIR="$pkgdir/" install
}
