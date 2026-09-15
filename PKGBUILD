# Maintainer: buckket <felix@buckket.org>

_pkgname=gotify-server
pkgname=${_pkgname}-bin
pkgver=3.1.1
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

sha256sums=('1d3b4d7563ba17a60f872e050715c4b3743114e74f3a9b7dddc76653c8bfd8c1'
            'a5348cf2dbf74552ff334bd138b24e7d24cd3bfea7fb1f8c3ef9ca9a3f0903c8'
            '9f2740e770ebf5b894370df3529ed7d244ff71d549088b24dd73eaa343b24ecf'
            '150a84f2f89d70c147cc3a2dbddb469f262ed2e8b6d3ffcb74eccb49dfdb2a24'
            '2f4b11daa1c7f3be0ad4a6fdcc01ffbda6e918539bfe10bb4dc90ea97f1d6723')
sha256sums_x86_64=('d452faad071981d191d5c95f70d0f9520dc2ef2336b2b03055e12cfabfbae2d2')
sha256sums_i686=('8da97485bff9902cecda851053dd0a78e72df5954c1d67d57f1e90fef33025dc')
sha256sums_armv7h=('5c9b9323a72af163cff50a61597f8f0724d4ab7bbe26ca0ff3b5a74ff3af94e1')
sha256sums_aarch64=('742ca7e0dd63b0902b7fb01552bd37f4df4d3bb66ced583144faff90a3e76901')

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
