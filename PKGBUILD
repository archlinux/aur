# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak
pkgver=5.0.0beta72
pkgrel=1
pkgdesc="Software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'avahi' 'dbus'
         'e2fsprogs' 'expat' 'flac' 'gcc-libs' 'glib2' 'glibc' 'gmp' 'gnutls'
         'keyutils' 'krb5' 'libasyncns' 'libcap' 'libcups' 'libdrm' 'libffi'
         'libgcrypt' 'libgpg-error' 'libidn2' 'libogg' 'libp11-kit' 'libpulse'
         'libsndfile' 'libtasn1' 'libunistring' 'libvorbis' 'libx11' 'libxau'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes'
         'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxshmfence' 'lz4'
         'mesa' 'nettle' 'nspr' 'nss' 'opus' 'pcre' 'systemd-libs'
         'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd')
optdepends=('libpulse')
arch=('x86_64')
source=("teamspeak-client-$pkgver.tar.xz::http://update.teamspeak.com/linux/x64/latest/0-1671465207.patch"
        "teamspeak-client.desktop")
sha512sums=('de1930ba086c3862c6bdc23088939b2a3bf6ddd559cdeb8dedfd7eec692a303e202d967f23a1399bee63f64c5bd1678709ace019a6861045a1c0f91113c5c958'
            '28f6cfbb842cd25d51819eccaa282aa0edd1e5b37e7eb14ef7e7e07723bd83fa7b3babc8f303021f83d3591a7d7f4db824f770c86d1b6a7326466e256cf787d0')
# Following authorization token is hard-coded. It is not bound to any account, but without it you will get 403 Forbidden error from any request to update.teamspeak.com
# The archive starts at offset of 200 bytes
DLAGENTS=("http::/usr/bin/curl --basic -u teamspeak5:LFZ6Z^kvGrnX~an,\$L#4gxL3'a7/a[[&_7>at}A3ARRGY -A teamspeak.downloader/1.0 -C 200 -o %o %u")

package() {
  install -d "$pkgdir"/usr/{bin,share/{licenses,pixmaps},lib/$pkgname}/

  # Recursively installing all top-level regular files and directories from srcdir
  #   Files supplied to makepkg as sources are present in srcdir using symbolic links
  #   That way we can only copy files extracted from source archives
  find "$srcdir" \
    -mindepth 1 \
    -maxdepth 1 \
    -type d,f \
    ! -name teamspeak-client.desktop \
    -exec cp -r {} "$pkgdir/usr/lib/$pkgname/" \;

  chmod 755 "$pkgdir/usr/lib/$pkgname/TeamSpeak"

  install -Dm644 "$srcdir/teamspeak-client.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  ln -s /usr/lib/$pkgname/logo-256.png "$pkgdir/usr/share/pixmaps/teamspeak-client.png"
  ln -s /usr/lib/$pkgname/licenses "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/lib/$pkgname/TeamSpeak "$pkgdir/usr/bin/teamspeak"
}
