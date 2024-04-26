# Maintainer: Furai <lucasgrzegroczyk+archlinux at gmail dot com>
# Contributor: fossdd <fossdd@pwned.life>

pkgname=valkey-git
_pkgname=valkey
pkgver=r12278.a5a1377
pkgrel=1
pkgdesc='A new project to resume development on the formerly open-source Redis project (development version)'
arch=('x86_64')
url="https://github.com/$_pkgname-io/$_pkgname"
license=('BSD-3-Clause')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('jemalloc' 'systemd-libs' 'openssl' 'glibc')
makedepends=('systemd' 'git' 'tcl' 'procps-ng')
backup=(
  "etc/$_pkgname/$_pkgname.conf"
  "etc/$_pkgname/sentinel.conf"
)
source=(
  "git+$url.git"
  "${_pkgname}.service"
  "${_pkgname}-sentinel.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
  "${_pkgname}.dir-jemalloc.patch"
)
b2sums=(
  'SKIP'
  'd04ddea27e56af9ef6b42a0adf9772079f754632b5bf5f150826f488272d3870c3cd877953f36503c511411025daf78f630a49986a9d5ed8288d868673bff72b'
  '98655ce2bb511fcda5aa656d7393bc44c3647a03b1bcc7d86fd18525212eee2cc8766c9aeb2f91dd2c665ae48b091ed6f7144d6481455cb115d64ca67b01adf6'
  '3080be28343535008db179fb6b1c11f508e2f6cfa39d83f21388f19deb01503a76d2e1ac9b1057110fa331ec9bb6f863b1c0897782bf304e792f9808d361ceb0'
  '6222a87edab159f85e96fa7e4db13dc5144eb9e523dd65324f7bd579bf5c331a71cf8148ab2e23a9fcd5879bedc72121585e0df45aa1d77979d444975694ae76'
  '24db5f9fd3e23d88684601b1abd68ba1a72711ef8a4d87c2cfc4153a6fd9788f1acfc8d895fb324f6c78ba9e1c89a8db50715e87f99c4ae5b073c337aa0773ee'
)

pkgver() {
  cd "${srcdir}/${_pkgname}" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}" || exit 1
  patch -Np1 <../valkey.dir-jemalloc.patch
}

build() {
  make BUILD_TLS=yes \
    USE_SYSTEMD=yes \
    USE_REDIS_SYMLINKS=no \
    -C "${_pkgname}"
}

check() {
  make test \
    BUILD_TLS=yes \
    USE_SYSTEMD=yes \
    USE_REDIS_SYMLINKS=no \
    -C "${_pkgname}"
}

package() {
  cd "${_pkgname}" || exit 1
  make PREFIX="$pkgdir"/usr \
    USE_REDIS_SYMLINKS=no \
    install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}"/etc/valkey valkey.conf sentinel.conf
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system/ ../valkey.service ../valkey-sentinel.service
  install -Dm644 "${srcdir}"/valkey.sysusers "${pkgdir}"/usr/lib/sysusers.d/valkey.conf
  install -Dm644 "${srcdir}"/valkey.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/valkey.conf
}
