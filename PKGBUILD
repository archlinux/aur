# Maintainer:
# Contributor: Yvaniak <Yvaniak 11 at gmail dot com>
# Contributor: Vladimir Svyatski <vsvyatski@yandex.ru>
# Contributor: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>

: ${_widgets:=gtk2}

[[ "${_widgets::3}" == "gtk" ]] \
  && : ${_cksum=25eeb581ec5ee08e068c50751479d3465e399581938f773a9ab9029a1c736b7e}

: ${_pkgtype:=-${_widgets}-bin}

_pkgname="peazip"
pkgname="$_pkgname${_pkgtype:?}"
pkgver=10.2.0
pkgrel=2
pkgdesc="Cross-platform file and archive manager (${_widgets^^})"
url="https://github.com/peazip/PeaZip"
license=('LGPL-3.0-or-later')
arch=('x86_64')

makedepends+=(
  'patchelf'
)

optdepends=(
  'arc: Arc file archiver and compressor'
)

options=('!debug' '!emptydirs')

provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-debug")

_pkgsrc_plugins="peazip-additional-formats-plugin.6.LINUX"
source=(
  "$url/releases/download/$pkgver/peazip-$pkgver.LINUX.${_widgets^^}-1.$CARCH.rpm"
  "https://cyfuture.dl.sourceforge.net/project/peazip/Resources/PeaZip%20Additional%20Formats%20Plugin/$_pkgsrc_plugins.tar"
)
sha256sums=(
  "${_cksum:-SKIP}"
  'SKIP'
)

prepare() {
  local _plugin_path="usr/lib/peazip/res/bin"
  local _plugins=(
    lpaq
    paq
    quad
    upx
    zpaq
  )

  ln -sf /usr/bin/7z "$_plugin_path"/7z/7z
  ln -sf /usr/bin/brotli "$_plugin_path"/brotli/brotli
  ln -sf /usr/bin/zstd "$_plugin_path"/zstd/zstd

  install -dm755 "$_plugin_path"/arc
  ln -sf /usr/bin/arc "$_plugin_path"/arc/arc

  ln -sf /usr/lib/peazip/peazip "usr/bin/peazip"
  ln -sf /usr/lib/peazip/pea "usr/bin/pea"

  for i in ${_plugins[@]}; do
    cp --reflink=auto -a "$srcdir/$_pkgsrc_plugins/$i" "$_plugin_path/"
  done

  patchelf --add-rpath '$ORIGIN' "usr/lib/peazip/peazip"
  patchelf --add-rpath '$ORIGIN' "usr/lib/peazip/pea"

  local _unwanted=(
    "$_plugin_path"/*/note.txt
    "$_plugin_path"/7z/*
    usr/lib/.build-id
    usr/share/doc
    usr/share/icons
    usr/share/peazip/*/readme*.txt
    usr/share/peazip/batch
    usr/share/peazip/copying
    usr/share/peazip/icons/peazip_seven.icl
    usr/share/peazip/lang-wincontext
    usr/share/peazip/readme
  )

  if [[ "${_widgets::2}" == "qt" ]]; then
    _unwanted+=(
      usr/lib/libQt6Pas.so*
    )

    local _lib=("usr/lib/peazip"/libQt6Pas.so.[0-9].[0-9].[0-9])
    ln -sf "${_lib[0]}" "${_lib[0]%.[0-9].[0-9]}"
  fi

  rm -rf ${_unwanted[@]}
}

package() {
  depends=(
    '7zip'
    'brotli'
    'zstd'
  )

  if [[ "${_widgets::3}" == "gtk" ]]; then
    depends+=("${_widgets}")
  fi

  cp --reflink=auto -a usr "$pkgdir/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
