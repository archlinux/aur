# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=beehost-git
_pkgname=${pkgname%-git}
pkgver=1.3.0.r0.gdb68cc2
pkgrel=1
pkgdesc="A native messaging host application for Browser's Exernal Editor extension."
arch=('x86_64')
url='https://github.com/rosmanov/bee-host'
license=('MIT')
makedepends=('git' 'cmake')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

    cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir" install


  # Necessary to also support chromium, shamelessly stolen from https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=chrome-remote-desktop
  install -dm755 "${pkgdir}/etc/chromium/native-messaging-hosts"

  for _file in $(find "${pkgdir}/etc/opt/chrome/native-messaging-hosts" -type f); do
    local _filename=$(basename ${_file})
    if [[ ! -f "/etc/chromium/native-messaging-hosts/${_filename}" ]]; then
      ln -s "/etc/opt/chrome/native-messaging-hosts/${_filename}" "${pkgdir}/etc/chromium/native-messaging-hosts/${_filename}"
    fi
  done
}

