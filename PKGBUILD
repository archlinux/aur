# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>
pkgname=ruvio-bin
_name=ruvio
pkgver=0.3.4
pkgrel=1
pkgdesc='Rust key-value server speaking RESP2 (Redis-compatible), prebuilt binaries'
arch=('x86_64' 'aarch64')
url='https://github.com/salihcantekin/ruvio'
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs')
provides=("$_name=$pkgver")
conflicts=("$_name")
backup=('etc/ruvio/ruvio.toml')
options=('!strip' '!debug')

_rel="$url/releases/download/${_name}-${pkgver}"
source=('ruvio.sysusers'
        'ruvio.tmpfiles'
        'ruvio.service')
source_x86_64=("${_name}-${pkgver}-linux-x64.tar.gz::${_rel}/${_name}-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${_name}-${pkgver}-linux-arm64.tar.gz::${_rel}/${_name}-${pkgver}-linux-arm64.tar.gz")

sha256sums=('7edf8e9feb904d38698570af31e9d15045a44db30b6ba8c2ddcd080b0b4244f3'
            'a725acd34d0218a74128582afee86c26c4da2a2e37442c00e918df5d06623e02'
            '1b4cee9fa4f43fb71fa3e72bd284dc14146febb68a4fc490428c21a925d3195e')
sha256sums_x86_64=('c07e7345f68b702659c1720453145ce185e23975e25d889c264e0e6353c2c227')
sha256sums_aarch64=('ea205da19eb564f80352d37922f93553f0800662744ef3e465114b015e4e4cd8')

package() {
  case "$CARCH" in
    x86_64)  _dir="${_name}-${pkgver}-linux-x64" ;;
    aarch64) _dir="${_name}-${pkgver}-linux-arm64" ;;
  esac

  install -Dm755 "$srcdir/$_dir/ruvio"     -t "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/$_dir/ruvio-ctl" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/$_dir/ruvio.example.toml" \
                 "$pkgdir/etc/ruvio/ruvio.toml"
  install -Dm644 "$srcdir/$_dir/README.md" \
                 -t "$pkgdir/usr/share/doc/$_name/"
  install -Dm644 "$srcdir/$_dir/UI_CONNECTIONS.md" \
                 -t "$pkgdir/usr/share/doc/$_name/"

  install -Dm644 ruvio.sysusers "$pkgdir/usr/lib/sysusers.d/ruvio.conf"
  install -Dm644 ruvio.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/ruvio.conf"
  install -Dm644 ruvio.service  "$pkgdir/usr/lib/systemd/system/ruvio.service"
}
