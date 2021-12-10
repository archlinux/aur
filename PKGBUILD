# Maintainer: buckket <felix@buckket.org>

_pkgname=gotify-server
pkgname=${_pkgname}-bin
pkgver=2.1.3
pkgrel=1
pkgdesc='A simple server for sending and receiving messages'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/gotify/server'
depends=('glibc')
license=('MIT')
provides=('gotify-server')
conflicts=('gotify-server')
backup=('etc/gotify/config.yml')
source=("https://raw.githubusercontent.com/gotify/server/v${pkgver}/config.example.yml"
        'config.patch'
        'tmpfiles.conf'
        'sysusers.conf'
        'gotify-server.service')

declare -xA _arches
_arches['x86_64']=amd64
_arches['i686']=386
_arches['armv7h']=arm-7
_arches['aarch64']=arm64

# Add sources for the supported architectures.
for key in "${!_arches[@]}"
do
  declare -n source_x="source_${key}"
  source_x=("gotify-linux-${_arches[$key]}-${pkgver}.zip::$url/releases/download/v${pkgver}/gotify-linux-${_arches[$key]}.zip")
done

sha256sums=('d6f9716c7f67cfb518f3f50a18cbc950ef3e8e9c8ba1f226654dfdd3bf8226d4'
            'a8a511e2b98fa548391a1602fcfa05df0e10fae6f5904cbfc4202566f2dd8265'
            '14bd1a9270b089b99d9bbe8ebdd0c208c3f74c7347a792d508ffce75b0e1c641'
            '150a84f2f89d70c147cc3a2dbddb469f262ed2e8b6d3ffcb74eccb49dfdb2a24'
            '9aa04ff9a2981aa885d4f8df7467c4d7722aa12de7ae27376a4a11b559a0d1e2')
sha256sums_x86_64=('94255062144505bbf48eaf23762140d2d2d34bf72d17165b8a85e52d3bf45493')
sha256sums_i686=('cec96fb0189ef401a7252417008aa2889e9d51eec079f5009ed583daf5591c70')
sha256sums_armv7h=('bb7394414379d3f09b24bfd0778431f1b71b85ff14ccdbc2505afef47c7a3d3f')
sha256sums_aarch64=('78e7d5495e8c6bd2348bb709903ee0e84c65788ac768a7629c10becfe3a0bd52')

prepare() {
  patch --follow-symlinks --forward -o "$srcdir/config.yml" config.example.yml config.patch
}

# The _arches associative array is not visible inside package(). I don't know
# why. If someone does, please post a solution in the comments.
_exe_name=gotify-linux-${_arches[$CARCH]}
package() {
  install -Dm755 "${_exe_name}" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/config.yml" "$pkgdir/etc/gotify/config.yml"
  install -Dm644 gotify-server.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
}
