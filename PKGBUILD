# Maintainer: Martin Piatka <(lastname) @ cesnet.cz>
pkgname='ultragrid-git'
pkgver=v1.9.r1556.gef0a54f6f
pkgrel=1
pkgdesc='Low-latency audio and video network transmission system (from git)'
arch=('x86_64')
url="https://www.ultragrid.cz/"
license=('BSD-4-Clause')

depends=(
	'curl'
	'speexdsp'
)
makedepends=(
	'git'
)
optdepends=(
	'alsa-lib: ALSA sound support'
	'jack2: Jack sound support'
	'portaudio: Portaudio sound support'
	'ffmpeg: Video/Audio support'
	'v4l-utils: v4l device support (webcams, etc.)'
	'sdl2: SDL sw. display, vulkan sw. display support'
	'glew: OpenGL sw. display support'
	'glfw: OpenGL sw. display support'
	'vulkan-icd-loader: vulkan sw. display support'
	'vulkan-headers: vulkan sw. display support'
	'glm: 360 video displays support'
	'openxr: 360 video hmd display support'
	'cuda: gpu accelerated FEC, DXT'
	'qt5-base: QT GUI support'
	'gpujpeg: gpu accelerated jpeg'
	'libx11: X11 screen recording'
	'libjuice: UDP holepunching support'
	'opencv: resize filter, conference video mix'
	'pipewire: audio capture/playback, video capture/display, screen capture'
	'glib2: pipewire screen capture on wayland'
)

provides=('ultragrid')
conflicts=('ultragrid')
options=('debug')

source=("${pkgname}::git+https://github.com/CESNET/UltraGrid"
        0001-GUI-Executable-rename.patch)
sha256sums=('SKIP'
            '5f1acfb6cdf7134bf3af97dad056565b4d8f9fe4008a8e6955135e6777e63d5d')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    patch -Np1 -i ../0001-GUI-Executable-rename.patch
}

build() {
  cd "${pkgname}"

  EXTRA_CUDA_OPTS=

  if command -v gcc-12 &> /dev/null
  then
      EXTRA_CUDA_OPTS="$EXTRA_CUDA_OPTS --with-cuda-host-compiler=gcc-12 "
  fi

  ./autogen.sh --prefix=/usr --enable-plugins \
      $EXTRA_CUDA_OPTS \
	  --enable-qt=auto \
	  --enable-holepunch=auto \
	  --enable-opencv=auto \
	  --disable-dvs \
	  --disable-decklink \
	  --disable-gpustitch \
	  --disable-bluefish444 \
	  --disable-aja \
	  --disable-deltacast \
	  --disable-ximea \
	  --disable-sage \
	  --disable-text \
	  --disable-syphon \
	  --disable-spout \
	  --disable-bitflow \
	  --disable-cmpto-j2k \
	  --disable-ndi \
	  --disable-cineform \
	  --disable-pcp \
	  --disable-rtsp-server \
	  --disable-caca \
	  --disable-zfec

  make clean && make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir/" install

  rm "$pkgdir/usr/share/doc/ultragrid/ultragrid-bugreport-collect.sh"
  mv "$pkgdir/usr/bin/uv" "$pkgdir/usr/bin/ultragrid"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
