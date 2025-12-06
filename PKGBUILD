# Maintainer:
# Contributor: Yvaniak <Yvaniak 11 at gmail dot com>
# Contributor: Vladimir Svyatski <vsvyatski@yandex.ru>
# Contributor: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>

: ${_widgets:=GTK2}

[[ "$_widgets" == "GTK2" ]] \
  && : ${_cksum=84eeba5c9efc5df79b4e38bd6533afaf959f17e25796f2be5d682b8f36d2ea56}

: ${_pkgtype:=-${_widgets,,}-bin}

_pkgname="peazip"
pkgname="$_pkgname${_pkgtype:?}"
pkgver=10.8.0
pkgrel=1
pkgdesc="Cross-platform file and archive manager (${_widgets})"
url="https://github.com/peazip/PeaZip"
license=('LGPL-3.0-or-later')
arch=('x86_64')

_depends=(
  '7zip'
  'brotli'
  'zstd'
)
makedepends=(
  'patchelf'
)
optdepends=(
  'arc: Arc file archiver and compressor'
)

case "${_widgets::1}" in
  g | G)
    _depends+=("${_widgets,,}")
    ;;
  q | Q)
    _depends+=("${_widgets,,}-base")
    ;;
esac

options=('!debug' '!emptydirs')

provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-debug")

_pkgsrc_plugins="peazip-additional-formats-plugin.7.LINUX"
source=(
  "$url/releases/download/$pkgver/peazip-$pkgver.LINUX.$_widgets-1.$CARCH.rpm"
  "https://cyfuture.dl.sourceforge.net/project/peazip/Resources/PeaZip%20Additional%20Formats%20Plugin/$_pkgsrc_plugins.tar"
)
sha256sums=(
  "${_cksum:-SKIP}"
  'f74abf2c3d97a72c80457d6dff369929bcfd0df619b0235d81a9b82f888a3d4c'
)

prepare() {
  local i _plugin_path _unwanted _plugins _symlinks
  _plugin_path="usr/lib/peazip/res/bin"

  # program
  ln -sf /usr/lib/peazip/peazip "usr/bin/peazip"
  ln -sf /usr/lib/peazip/pea "usr/bin/pea"

  patchelf --add-rpath '$ORIGIN' "usr/lib/peazip/peazip"
  patchelf --add-rpath '$ORIGIN' "usr/lib/peazip/pea"

  # remove extraneous
  _unwanted=(
    "$_plugin_path"/*/note.txt
    "$_plugin_path"/7z/*
    usr/lib/.build-id
    usr/lib/libQt6Pas.so*
    usr/share/doc
    usr/share/icons
    usr/share/peazip/*/readme*.txt
    usr/share/peazip/batch
    usr/share/peazip/copying
    usr/share/peazip/icons/peazip_seven.icl
    usr/share/peazip/lang-wincontext
    usr/share/peazip/readme
  )

  for i in "${_unwanted[@]}"; do
    [ -e "$i" ] || [ -L "$i" ] && rm -rf "$i"
  done

  # symlink plugins
  _symlinks=(
    7z
    arc
    brotli
    zstd
  )
  for i in "${_symlinks[@]}"; do
    mkdir -pm755 "$_plugin_path/$i"
    ln -sf "/usr/bin/$i" "$_plugin_path/$i/$i"
  done

  # binary plugins
  _plugins=(
    lpaq
    paq
    quad
    upx
    zpaq
  )
  for i in "${_plugins[@]}"; do
    cp -a "$srcdir/$_pkgsrc_plugins/$i" "$_plugin_path/"
  done
}

package() {
  depends=("${_depends[@]}")
  cp -a usr "$pkgdir/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
