# Maintainer: anispwyn <anisphia_wynn_palettia@proton.me>
pkgname="elysia-git"
_pkgname="${pkgname%-git}"
pkgver=v0.1.r1.gb1bed5c
pkgrel=1
pkgdesc="Universal anime game launcher, supporting Wine and Proton"
arch=("x86_64")
url="url"
license=(GPL-3.0-only)
provides=("elysia")
conflicts=("elysia")
depends=(
    'ffmpeg'        'openssl'
    'freetype2'     'fontconfig'
    'mesa'          'libx11'
    'libxcb'        'alsa-lib'
    'libpulse'      'libwebp'
    'gcc-libs'      'glibc'
    'cairo'         'glib2'
    'pango'         'harfbuzz'
    'librsvg'       'gdk-pixbuf2'
    'libva'         'libdrm'
)
makedepends=(rust)
source=(
  "git+https://dawn.wine/elysia/elysia"
)
md5sums=('SKIP')

pkgver() { 
  cd "$srcdir/${_pkgname}" 
  git fetch --tags # Fallback in case there are no tags 
  if ! git describe --long --tags &>/dev/null; then 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  else 
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
  fi
}

prepare() {
  cd "$srcdir/${_pkgname}"
  git checkout dev 
  git submodule update --init --recursive --single-branch
  git pull

}

build() {
  cd "$srcdir/${_pkgname}"
  export CFLAGS+=" -ffat-lto-objects"
  cargo build --release
}

package() {
  cd "$srcdir/${_pkgname}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"

  cp target/release/elysia "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
  ln -s "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}/assets/elysia.png" "${pkgdir}/usr/share/pixmaps/elysia.png"
  install -Dm644 "${srcdir}/${_pkgname}/assets/elysia.png" "${pkgdir}/usr/share/icons/elysia.png"
  install -Dm644 "${srcdir}/${_pkgname}/assets/elysia.desktop" -t "${pkgdir}/usr/share/applications"
} 
