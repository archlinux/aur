# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=librespot
pkgname=librespot-alsa-git
pkgver=r258.9e495d6
pkgrel=1
pkgdesc='An open source client library for Spotify (ALSA Backend).'
url='https://github.com/plietar/librespot.git'
license=('MIT')
source=('git://github.com/plietar/librespot.git'
'librespot.service'
'librespot.conf'
'librespot.sysusers'
'librespot.tmpfiles')
sha256sums=('SKIP'
            '3a54158edc94b35934dc3a9421041fd1a5e8be634610ddcef7e8cb04b0c15624'
            '40967abb5fc74d47fb2e564f95d8847aa899bf4e12d8c073f217cc63d137f375'
            'cd05d40dcc1572aba86aed732b5e0e47ff644d6c40380cc2d2b4d80acc2c2b1f'
            '61b68cf5776374218caf525d707a52bf14d349e4f1a7c8ef76b8ed5789f19114')
arch=('x86_64' 'i686')
depends=('alsa-lib' 'portaudio')
makedepends=('git' 'rust' 'protobuf' 'cargo')
install=librespot.install
backup=('etc/librespot.conf')
conflicts=('librespot' 'librespot-git')
provides=('librespot')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build \
    --features alsa-backend \
    --release
}

package() {
  install -dm755 ${pkgdir}/var/cache/${_pkgname}
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/target/release/librespot" "${pkgdir}/usr/bin/librespot"
  install -Dm644 "${srcdir}/librespot.conf" "${pkgdir}/etc/librespot.conf"
  install -Dm644 "${srcdir}/librespot.service" "${pkgdir}/usr/lib/systemd/system/librespot.service"
  install -Dm644 "${srcdir}/librespot.sysusers" "${pkgdir}/usr/lib/sysusers.d/librespot.conf"
  install -Dm644 "${srcdir}/librespot.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/librespot.conf"
}
