# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=jack-example-tools-git
pkgver=r647.fc9e9c4
pkgrel=2
pkgdesc="Official JACK example clients and tools"
arch=(x86_64)
url="https://github.com/jackaudio/jack-example-tools"
license=(GPL2 GPL3)
depends=(glibc opus)
makedepends=(alsa-lib git jack libsamplerate libsndfile meson readline
zita-alsa-pcmi zita-resampler)
provides=(jack-example-tools)
conflicts=(jack-example-tools)
source=("$pkgname::git+https://github.com/jackaudio/jack-example-tools.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local _meson_args=()
  # jack1 does not provide libjacknet.so, but arch-meson enables all features,
  # so we disable the building jack_net integration manually
  if (( $(vercmp "$(pkgconf --mod-version jack)" '1.9.0') < 0 )); then
    _meson_args+=(-D jack_net=disabled)
  fi

  arch-meson build "$pkgname" "${_meson_args[@]}"
  ninja -vC build
}

package() {
  depends+=(libasound.so libjack.so libsamplerate.so libsndfile.so
  libreadline.so libzita-alsa-pcmi.so libzita-resampler.so)

  DESTDIR="$pkgdir" meson install -C build
}
