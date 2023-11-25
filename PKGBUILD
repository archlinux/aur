# Maintainer:  dreieck
# Contributor: Stefan Husmann (https://aur.archlinux.org/account/haawda)
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ripperx-git
pkgver=2.8.0+11.r124.20200719.554b75f
pkgrel=2
pkgdesc="GTK2 program to rip Audio CDs and encode to FLAC, OGG and MP3."
arch=(
  'x86_64'
  'i686'
)
url="http://ripperx.sourceforge.net/"
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk2'
  'taglib'
)
makedepends=('git')
license=('GPL')
source=(
  "${pkgname%-git}::git+https://git.code.sf.net/p/ripperx/git"
  "config.rpath_-_ripperx-stable-2.8.0" # This one is missing in the git checkout and taken from the stable release "http://downloads.sourceforge.net/project/ripperx/ripperx/2.8.0/ripperx-2.8.0.tar.bz2"
)
sha256sums=(
  'SKIP'
  '9b98b066c0c2902f32984613cb7454b73f1cb93a83422666d73b3c08731a5c80'
)
conflicts=("ripperx")
provides=("ripperx=${pkgver}")

prepare() {
  cd "${pkgname%-git}"

  cp "${srcdir}/config.rpath_-_ripperx-stable-2.8.0" "config/config.rpath"

#   sed -i 's|Icon=.*|Icon=ripperX.xpm|g' ripperX.desktop
#   echo "Categories=GTK;GNOME;AudioVideo;DiscBurning;" >>ripperX.desktop
#   patch ripperX.pc.in <<EOF
# diff -r ripperX-2.7.3/ripperX.pc.in ripperX-2.7.3.y/ripperX.pc.in
# 3a4
# > includedir=@includedir@
# EOF
#   sed -i 's/.*gtk_cpp_workaround.h.*//g' \
#     src/config_window_handler.c \
#     src/select_frame_handler.c \
#     src/status_frame_handler.c
}

pkgver() {
  cd "${pkgname%-git}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${pkgname%-git}"
  sh ./bootstrap
  CFLAGS+=" -fpermissive"
  export CFLAGS

  ./configure \
    --prefix=/usr \
    --enable-nls

  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
  install -Dm0644 ripperX.desktop "$pkgdir"/usr/share/applications/ripperX.desktop
  install -Dm0644 src/xpms/ripperX-icon.xpm "$pkgdir"/usr/share/pixmaps/ripperX.xpm
}
