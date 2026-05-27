# Maintainer: Keon Cachia  <keonfarrugia@gmail.com>
pkgname=kwim
pkgver=0.2.0
_mvzrver=0.3.9
_zigwlver=0.6.0
_xkbver=0.4.0
_clapver=0.12.0
pkgrel=2
pkgdesc="Kewuaa's input manager for River"
arch=('x86_64')
url="https://github.com/kewuaa/kwim"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'river')
# https://github.blog/open-source/git/update-on-the-future-stability-of-source-code-archives-and-hashes/
# Github does not guarantee consistent archives so I am using Git.
source=($pkgname-$pkgver::$url.git"#tag=${pkgver}"
  mvzr-${_mvzrver}::https://github.com/mnemnion/mvzr.git"#tag=${_mzvrver}"
  zigwl-${_zigwlver}::git+https://github.com/ifreund/zig-wayland.git"#tag=v${_zigwlver}"
  xkb-${_xkbver}::git+https://github.com/ifreund/zig-xkbcommon.git"#tag=v${_xkbver}"
  clap-${_clapver}::git+https://github.com/Hejsil/zig-clap.git"#tag=${_clapver}")
sha256sums=('9ba1db5d6a6962f7c5870dafaf495722cdb86dc6de4011f87ba22423bb1d7ff6'
            '436a4560aabdd42d578f81a349b0422b368f6819fbded8734f5a34b8a1e0a31c'
            '9ff3bf408bee528889a9dd3059235cb5611c8e38e80e2af880187c00f387ac78'
            '7d4145fbf3062c891254b60c02cd9f45675b867338b3c251b6428291abbaccc1'
            'ee15320d050ba9c676d5e0eda5eb907a834ff04a140f442c93e86efe51d9ffee')
makedepends=('zig' 'git')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    --fork="$srcdir"/xkb-$_xkbver \
    --fork="$srcdir"/mvzr-$_mvzrver \
    --fork="$srcdir"/clap-$_clapver \
    --fork="$srcdir"/zigwl-$_zigwlver \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe

}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  zig build test \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --fork="$srcdir"/xkb-$_xkbver \
    --fork="$srcdir"/mvzr-$_mvzrver \
    --fork="$srcdir"/clap-$_clapver \
    --fork="$srcdir"/zigwl-$_zigwlver --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cp -r build/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:
