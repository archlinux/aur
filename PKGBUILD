# Maintainer: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_basename=weston
pkgname="$_basename-git"
pkgver=5.0.90.6411.bc315aa2
pkgrel=2
pkgdesc='Reference implementation of a Wayland compositor'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('wayland-git' 'libxkbcommon' 'libinput' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'pango' 'libva' 'libxcursor' 'colord')
makedepends=('meson' 'wayland-protocols-git' 'git')
conflicts=("$_basename")
provides=("$_basename")

source=("git://anongit.freedesktop.org/wayland/$_basename")
sha1sums=('SKIP')

_builddir="build"

pkgver() {
    #_basever="$(meson introspect --projectinfo "$_builddir" | \
    #    sed 's/.*"version":\s*"\([0-9.]\+\)".*/\1/')"

    # This is a dirty hack for as long as I can't figure out how to get meson
    # introspect working. arch-meson needs to run first, but there's nowhere
    # good I can run it. CFLAGS etc aren't defined in prepare() or in this
    # function, and arch-meson relies on them to work properly.
    _basever="$(cat "$_basename/meson.build" | \
        sed -n 's/.*version:\s*'\''\([0-9.]\+\)'\''.*/\1/p')"
        ##          version:   '---            '---

    cd "$_basename"
    echo "$_basever.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$_builddir" "$_basename" -Dbackend-drm-screencast-vaapi=false \
        -Dscreenshare=false -Dbackend-rdp=false -Dshell-ivi=false \
        -Dsimple-dmabuf-drm= -Dremoting=false
    ninja -C "$_builddir"
}

package() {
    DESTDIR="$pkgdir" ninja -C "$_builddir" install
    install -Dm644 "$_basename/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
