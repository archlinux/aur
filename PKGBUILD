pkgname=mako-center-git
pkgver=1.11.0.r649.g2824f04
pkgrel=1
pkgdesc='Lightweight notification daemon for Wayland with notification center history support'
arch=('x86_64')
url='https://github.com/AuthenticSm1les/mako-center'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'json-glib'
  'pango'
  'systemd-libs'
  'wayland'
)
makedepends=(
  'git'
  'meson'
  'scdoc'
  'wayland-protocols'
)
optdepends=('jq: support for makoctl menu')
provides=('mako')
conflicts=('mako' 'mako-git')
source=('git+https://github.com/AuthenticSm1les/mako-center.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mako-center"
  printf '%s.r%s.g%s\n' \
    "$(meson introspect --projectinfo . | sed -n "s/.*\"version\": \"\\([^\"]*\\)\".*/\\1/p")" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  local meson_options=(
    -Dbash-completions=true
    -Dfish-completions=true
    -Dman-pages=enabled
    -Dsd-bus-provider=libsystemd
    -Dzsh-completions=true
  )

  arch-meson "${srcdir}/mako-center" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${srcdir}/mako-center/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
