# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=efl
pkgname=$_pkgname-git
pkgver=1.17.99.47007.gfa344ea
pkgrel=2
pkgdesc="Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('avahi' 'bullet' 'curl' 'fontconfig' 'fribidi' 'gst-plugins-base-libs' 'luajit' 'libexif'
         'libgl' 'libinput' 'libpulse' 'libwebp' 'libxcomposite' 'libxcursor' 'libxinerama'
         'libxkbcommon' 'libxp' 'libxrandr' 'libxss' 'libunwind' 'openjpeg' 'wayland')
makedepends=('git' 'python2')
optdepends=('evas_generic_loaders-git: More video/graphic/icon loaders for Evas'
            'geoclue: For elocation'
            'gst-plugins-base: Access more types of video in Emotion'
            'gst-plugins-good: Access more types of video in Emotion'
            'gst-plugins-bad: Access more types of video in Emotion'
            'gst-plugins-ugly: Access more types of video in Emotion'
            'gst-libav: Access video with ffmpeg/libav in Emotion'
            'python2: Compare Eina benchmarks')
provides=("$_pkgname=$pkgver" "elementary=$pkgver" "elementary-git=$pkgver")
conflicts=("$_pkgname" 'elementary' 'elementary-git' 'elementary_test' 'elementary_test-git')
options=('debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local efl_version=$(grep -m1 EFL_VERSION configure.ac | awk -F [][] '{print $2 "." $4 "." $6}')
  efl_version=$(awk -F , -v efl_version=${efl_version%.} '/^AC_INIT/ {gsub(/efl_version/, efl_version); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "%s.%s.g%s" "$efl_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --with-tests=none \
    --with-opengl=full \
    --disable-egl \
    --enable-wayland \
    --enable-drm \
    --enable-fb \
    --disable-tslib \
    --enable-image-loader-webp \
    --enable-systemd \
    --enable-harfbuzz \
    --enable-xinput22 \
    --enable-multisense \
    --enable-liblz4

  make
}

package() {
  cd $_pkgname

  make -j1 DESTDIR="$pkgdir" install

# compile python files
  python2 -m compileall -q "$pkgdir"
  python2 -O -m compileall -q "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING COPYING.images licenses/COPYING.{BSD,SMALL}
}
