# Maintainer: buckket <felix@buckket.org>

_pkgname=gotify-server
pkgname=${_pkgname}-bin
pkgver=2.1.7
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
sha256sums_x86_64=('c1bead32dc1aafeceff5f9783be9e62294a84c3ceb03260c829a10ce7a9a8a10')
sha256sums_i686=('03ed0ace3065985c81531fc2f09ae3ee33e56bc86c6aff63603bea71c4f260f4')
sha256sums_armv7h=('52d5f75a73c5a6a987749e5ff2158335b62a97322dc96dc597c7c6329f2234ce')
sha256sums_aarch64=('35da7810260521412b06ca169c602b6a84aba96d960fe4f7410ca49551ef0c09')

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
