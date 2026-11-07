# Maintainer: Alexander Kurilo <alex at kurilo dot me>
_gitname=goodix-5f10-linux-driver
_branch=${GOODIX_GIT_BRANCH:-psk-file}
pkgname=libfprint-tod-goodix5f10-git
pkgver=r4.gae212730
pkgrel=2
pkgdesc='TOD module for the Goodix 27c6:5f10 fingerprint reader'
arch=('x86_64')
url='https://github.com/kamazee/goodix-5f10-linux-driver'
license=('LGPL-2.1-or-later')
install='libfprint-tod-goodix5f10.install'
depends=('fprintd' 'libfprint-tod-git' 'glib2' 'libgusb' 'opencv' 'openssl')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'python')
source=("${_gitname}::git+https://github.com/kamazee/${_gitname}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  meson setup build --prefix=/usr --libdir=lib
  meson compile -C build
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 build/libfprint-tod-goodix5f10.so \
    "$pkgdir/usr/lib/libfprint-2/tod-1/libfprint-tod-goodix5f10.so"
  install -Dm644 packaging/70-goodix-5f10.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-goodix-5f10.rules"
  local default_psk_hex
  default_psk_hex=$(tr -d '[:space:]' <provisioning/docs/psk.hex)
  if [[ ${#default_psk_hex} -ne 64 || $default_psk_hex == *[![:xdigit:]]* ]]; then
    error 'provisioning/docs/psk.hex must contain exactly 32 bytes as hexadecimal'
    return 1
  fi
  install -Dm600 /dev/null \
    "$pkgdir/var/lib/fprint/goodix-5f10/psk-default"
  python -c 'from pathlib import Path; import sys; p = Path(sys.argv[2]); k = bytes.fromhex(sys.argv[1]); assert len(k) == 32; p.write_bytes(k)' \
    "$default_psk_hex" "$pkgdir/var/lib/fprint/goodix-5f10/psk-default"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
