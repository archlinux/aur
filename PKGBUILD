# Maintainer: Ilya Chelyadin <ilya77105@gmail.com>

_pkgname=amd-gpu-i2c
pkgname="${_pkgname}-dkms-git"
pkgver=r5.06ca41f
pkgrel=1
pkgdesc='AMD GPU internal I2C/SMBus bus driver'
arch=('x86_64')
url='https://github.com/twifty/amd-gpu-i2c'
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=("${_pkgname}-dkms")
conflicts=("${_pkgname}-dkms" "${_pkgname}")
source=("${_pkgname}::git+https://github.com/twifty/amd-gpu-i2c.git"
        'dkms.conf'
        'amdgpu-i2c.conf')
sha256sums=('SKIP'
            '9191267839d18cb818959a91a4f9cae0ab9425f1ff05b474101ef120ef360214'
            'a82419375efa45a97e28a4158613bfe9d1b54106770b771b61ccd64e8bb62186')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -i 's/ -DDEBUG//' Makefile
}

package() {
  local _src="$pkgdir/usr/src/${_pkgname}-${pkgver}"

  install -d "$_src"
  cp -r "$srcdir/$_pkgname/." "$_src/"
  rm -rf "$_src/.git"

  install -Dm644 "$srcdir/dkms.conf" "$_src/dkms.conf"

  sed -e "s/@PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "$_src/dkms.conf"

  install -Dm644 "$srcdir/amdgpu-i2c.conf" \
    "$pkgdir/usr/lib/modules-load.d/amdgpu-i2c.conf"
}
