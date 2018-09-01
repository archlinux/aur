# Maintainer: Ainola
# Maintainer: Thorsten Töpper (Official Arch Package)

pkgname=i3lock-media-keys
pkgver=2.10
pkgrel=5
pkgdesc="An improved screenlocker based upon XCB and PAM. Includes patches for media control support when locked."
arch=('x86_64')
url="https://i3wm.org/i3lock/"
license=('MIT')
groups=("i3")
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11' 'pam')
options=('docs')
conflicts=('i3lock')
provides=('i3lock')
backup=("etc/pam.d/i3lock")
install="$pkgname.install"
source=("https://i3wm.org/i3lock/i3lock-$pkgver.tar.bz2"
        "https://i3wm.org/i3lock/i3lock-$pkgver.tar.bz2.asc"
        "allow_media_keys.patch")
sha256sums=('29eb32bf317fad7b292e15be6c02d693bfc6dbfdd6d98f0a6db71e189140c8ee'
            'SKIP'
            '077d3fd09a3f32e8aa13d9a7d5639e8e6112938287e185653d23ac674f3d92ec')
validpgpkeys=('424E14D703E7C6D43D9D6F364E7160ED4AC8EE1D') # Michael Stapelberg

prepare() {
    # Allow media keys to be passed through to the desktop even when locked.
    # NOTE: This that your media keys are not bound to something potentially
    # harmful. Make sure that you are okay with the functions that your media
    # keys are bound to! See https://github.com/i3/i3lock/issues/52

    # This patch was written by Johannes Frankenau (with a few updates applied
    # as it was for an older version of i3lock):
    # https://github.com/i3/i3lock/commit/4d85b886fc16376c85c9ea444ca6b9c0a65cccc5
    patch -d i3lock-"$pkgver" -p1 < "$srcdir"/allow_media_keys.patch
}

build() {
  cd "${srcdir}/i3lock-${pkgver}"

  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' i3lock.pam

  make
  gzip i3lock.1
}

package() {
  cd "${srcdir}/i3lock-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make clean
}

# vim:set ts=2 sw=2 et:
