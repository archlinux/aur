# Maintainer: buckket <felix@buckket.org>

_pkgname=gotify-server
pkgname=${_pkgname}-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='A simple server for sending and receiving messages'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/gotify/server'
depends=('glibc')
license=('MIT')
provides=('gotify-server')
conflicts=('gotify-server')
backup=('etc/gotify/server.env')
install=gotify-server.install
source=("https://raw.githubusercontent.com/gotify/server/v${pkgver}/gotify-server.env.example"
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

sha256sums=('ad02425f9f0739c45d59fb2c9aad2ac5353e6a1c87b7987c2fab9f239be4db7a'
            'a5348cf2dbf74552ff334bd138b24e7d24cd3bfea7fb1f8c3ef9ca9a3f0903c8'
            '37de5cad703025c5ce2c8f5eb132b44fd2cfa1e59a2784c41fb2de657585f467'
            '150a84f2f89d70c147cc3a2dbddb469f262ed2e8b6d3ffcb74eccb49dfdb2a24'
            'fd77369ddf3ec0097066517ade97fe06bb1336557adbac41a11f37df852c9814')
sha256sums_x86_64=('b21c83f19fcc5715e5427f11797207ceddc345bebc1b5342aaf143967a979534')
sha256sums_i686=('264da9aa569574e879a8a3a9a350fd3b001edb8095a3972f9151e54d72db8081')
sha256sums_armv7h=('7f66df9c941e300006f2b37abca6703747ad4c322b2cb47686c89fa658bc94e1')
sha256sums_aarch64=('abdb55509a8f3844c866a135a3858d579388a7c4b23f5676a1f6c4d8e8ddb227')

prepare() {
  patch --follow-symlinks --forward -o "$srcdir/server.env" gotify-server.env.example config.patch
}

# The _arches associative array is not visible inside package(). I don't know
# why. If someone does, please post a solution in the comments.
_exe_name=gotify-linux-${_arches[$CARCH]}
package() {
  install -Dm755 "${_exe_name}" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/server.env" "$pkgdir/etc/gotify/server.env"
  install -Dm644 gotify-server.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
}
