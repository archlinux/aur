# Maintainer: Daniel Bausch <db@edv-bausch.de>
pkgbase=uglycraft
pkgname=('uglycraft' 'ugli')
pkgver=1.6
pkgrel=1
arch=('x86_64')
url='https://github.com/dbausch/uglycraft'
license=('GPL-3.0-only')
makedepends=('fpc' 'python' 'python-build' 'python-installer' 'python-numpy'
             'python-pygame' 'python-setuptools' 'hicolor-icon-theme')
_tag=v$pkgver
_uos_commit=ffd165382aeae1cc1bf80673d5c02497c06f4efa
_themes_commit=e144651f75891cf4795ef1e7c24bb3e27c47aa06
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$_tag.tar.gz"
        "uos.pas::https://raw.githubusercontent.com/fredvs/uos/$_uos_commit/src/uos.pas"
        "uos_flat.pas::https://raw.githubusercontent.com/fredvs/uos/$_uos_commit/src/uos_flat.pas"
        "uos_portaudio.pas::https://raw.githubusercontent.com/fredvs/uos/$_uos_commit/src/uos_portaudio.pas"
        "ANSI-87.conf::https://raw.githubusercontent.com/kovidgoyal/kitty-themes/$_themes_commit/themes/ANSI-87.conf")
sha256sums=('4839be4a5be511a3dc3b41f1f215c122184daf891c2d9f5a825aaf87229acd5b'
            '22f3e9215611d9877d21f7c835085baf9a393eac1a9e9047f195559ca1e949e4'
            '2ceb6afccad36f520fb57123dd7b38b59f36dedcc0bd3e099657086d7bd352b7'
            'bea6c3c79b42fdf67f8b5d3ba7895dae341a9ed72d53d0f0526a736dda3f8489'
            'f3de3caf475fedeb5b0498520bb82b7d511d07d1072cd604387177f238cde9b9')

prepare() {
  cd "$pkgbase-$pkgver"
  mkdir -p original/uos
  cp "$srcdir"/{uos.pas,uos_flat.pas,uos_portaudio.pas} original/uos/
  _uos_warn_block='{$WARN 4105 OFF} {$WARN 5025 OFF} {$WARN 5027 OFF} {$WARN 5089 OFF} {$WARN 5093 OFF} {$WARN 6058 OFF} { UGLYCRAFT-WARN-SUPPRESS BL-75: fetched third-party UOS unit — see spec 0091 }'
  for f in uos.pas uos_flat.pas uos_portaudio.pas; do
    grep -q 'UGLYCRAFT-WARN-SUPPRESS' "original/uos/$f" \
      || sed -i "1i $_uos_warn_block" "original/uos/$f"
  done
  cp "$srcdir/ANSI-87.conf" original/
  cat > original/uos/uos_define.inc <<'EOF'
{$DEFINE portaudio}
{$DEFINE synthesizer}
EOF
}

build() {
  cd "$pkgbase-$pkgver"
  rm -rf dist
  python -m build --wheel --no-isolation
  cd original
  echo "const GitVersion = '$pkgver';" > git_sha.inc
  fpc -Fuuos -k-z -krelro -k-z -know UGLI_2.pp
}

package_uglycraft() {
  pkgdesc='Retro style treasure hunting game with various puzzles'
  arch=('any')
  license=('GPL-3.0-only' 'OFL-1.1')
  depends=('python' 'python-pygame' 'python-numpy' 'hicolor-icon-theme')
  conflicts=('uglycraft-git')

  cd "$pkgbase-$pkgver"

  # PEP 517 install (spec 0094): the wheel carries the code, the assets
  # (uglycraft/fonts, uglycraft/translations — via [tool.setuptools.package-data],
  # whose globs must cover any new asset type), the byte-compiled .pycs, the
  # .dist-info metadata, and the /usr/bin/uglycraft entry point generated
  # from [project.scripts].
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 packaging/uglycraft.desktop \
    "$pkgdir/usr/share/applications/uglycraft.desktop"
  install -Dm644 packaging/uglycraft.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/uglycraft.svg"

  install -Dm644 LICENSES/GPL-3.0.txt \
    "$pkgdir/usr/share/licenses/$pkgname/GPL-3.0.txt"
  install -Dm644 LICENSES/OFL-1.1-ShareTechMono.txt \
    "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1-ShareTechMono.txt"
}

package_ugli() {
  pkgdesc='Terminal treasure hunting game'
  depends=('bash' 'glibc' 'hicolor-icon-theme')
  optdepends=('portaudio: sound support via UOS/PortAudio'
              'kitty: terminal launcher with ANSI-87 colour theme'
              'ttf-liberation: Liberation Mono font for kitty launcher')
  conflicts=('ugli-git')

  cd "$pkgbase-$pkgver"

  install -Dm755 original/UGLI_2 "$pkgdir/usr/lib/ugli/UGLI_2"
  install -Dm644 original/ANSI-87.conf "$pkgdir/usr/share/ugli/ANSI-87.conf"
  install -d "$pkgdir/usr/lib/ugli/translations"
  install -m644 original/translations/*.mo \
    "$pkgdir/usr/lib/ugli/translations/"
  install -m644 original/translations/history_*.txt \
    "$pkgdir/usr/lib/ugli/translations/"

  install -Dm755 packaging/ugli.sh "$pkgdir/usr/bin/ugli"

  install -Dm644 packaging/ugli.desktop \
    "$pkgdir/usr/share/applications/ugli.desktop"
  install -Dm644 packaging/ugli.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/ugli.svg"

  install -Dm644 LICENSES/GPL-3.0.txt \
    "$pkgdir/usr/share/licenses/$pkgname/GPL-3.0.txt"
}
