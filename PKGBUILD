# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme-git
_pkgname=arc-theme
pkgname=('arc-gtk-theme-git' 'arc-solid-gtk-theme-git')
pkgver=20220405.r43.ga76102bb
pkgrel=1
pkgdesc="A flat theme suite with transparent elements."
arch=('any')
url="https://github.com/jnsh/arc-theme"
license=('GPL3')
makedepends=('meson' 'sassc' 'inkscape' 'git')
optdepends=('gtk-engine-murrine: GTK2 support'
            'gnome-themes-extra: GTK2 support')
source=("${_pkgname}::git+https://github.com/jnsh/${_pkgname}.git")
md5sums=('SKIP')

# Latest stable Arch package versions
_cinnamonver=5.4
_gnomeshellver=43

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  meson --prefix=/usr build \
    -Dgnome_shell_gresource=true \
    -Dcinnamon_version="${_cinnamonver}" \
    -Dgnome_shell_version="${_gnomeshellver}"
  meson compile -C build

  meson --prefix=/usr build-solid \
    -Dtransparency=false \
    -Dgnome_shell_gresource=true \
    -Dcinnamon_version="${_cinnamonver}" \
    -Dgnome_shell_version="${_gnomeshellver}"
  meson compile -C build-solid
}

package_arc-gtk-theme-git() {
  conflicts=('arc-gtk-theme')

  cd "${_pkgname}"
  DESTDIR="$pkgdir" meson install -C build
}

package_arc-solid-gtk-theme-git() {
  pkgdesc="A flat theme suite without transparent elements."
  conflicts=('arc-solid-gtk-theme')

  cd "${_pkgname}"
  DESTDIR="$pkgdir" meson install -C build-solid
}
