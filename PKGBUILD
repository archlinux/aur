# Maintainer: Devachandra <devachandra@protonmail.com>

pkgname=netscape-communicator
pkgver=4.79
pkgrel=4
_bldver=4.79.0.20011017
_libstdcver=2.91.66-4
# Private 32-bit X libraries, rebuilt with stack realignment (see build()).
_libx11=1.8.14
_libxext=1.3.7
_libxt=1.3.1
_libxmu=1.3.1
_libxpm=3.5.17
pkgdesc='Netscape Communicator 4.79 web browser, mail and news client (2001, static Motif)'
url='https://archive.org/details/ftp.netscape.com'
arch=('x86_64')
license=('LicenseRef-Netscape' 'GPL-2.0-or-later WITH GCC-exception-2.0' 'MIT' 'X11')
depends=('lib32-glibc' 'lib32-libxcb' 'lib32-libsm' 'lib32-libice' 'libx11')
makedepends=('gcc' 'xorgproto' 'xtrans' 'xorg-util-macros')
optdepends=('xorg-fonts-75dpi: classic bitmap fonts for page rendering'
            'xorg-fonts-100dpi: classic bitmap fonts for page rendering')
options=('!strip' '!debug' '!lto')
source=("communicator-v${pkgver//./}-us.x86-unknown-linux2.2.tar.gz::https://archive.org/download/ftp.netscape.com/2014.06.ftp.netscape.com.tar/ftp.netscape.com/pub/communicator/english/${pkgver}/unix/supported/linux22/complete_install/communicator-v${pkgver//./}-us.x86-unknown-linux2.2.tar.gz"
        "https://archive.debian.org/debian/pool/main/e/egcs1.1/libstdc++2.9-glibc2.1_${_libstdcver}_i386.deb"
        "https://xorg.freedesktop.org/releases/individual/lib/libX11-${_libx11}.tar.xz"
        "https://xorg.freedesktop.org/releases/individual/lib/libXext-${_libxext}.tar.xz"
        "https://xorg.freedesktop.org/releases/individual/lib/libXt-${_libxt}.tar.xz"
        "https://xorg.freedesktop.org/releases/individual/lib/libXmu-${_libxmu}.tar.xz"
        "https://xorg.freedesktop.org/releases/individual/lib/libXpm-${_libxpm}.tar.xz"
        'ns4jmp.S'
        'ns4jmp.c'
        'ns4jmp-stub.c'
        'netscape.sh'
        'netscape-communicator.desktop'
        'oldweb-toolbar.html')
noextract=("libstdc++2.9-glibc2.1_${_libstdcver}_i386.deb")
sha256sums=('d8372b79fd8da4e92559ddfbcec14e121fbc648286af7dab5d4bdff2af77b5c1'
            '1e71b4caa8d408dde0d3669e474905844e45c2bfc121e96840f0bf2437c6d1bd'
            'bbc78c46217174655c2b32b138ad119f3ac15f50808b4d0b3a2677a4b1afc950'
            '6c643c7035cdacf67afd68f25d01b90ef889d546c9fcd7c0adf7c2cf91e3a32d'
            'e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d931288'
            '81a99e94c4501e81c427cbaa4a11748b584933e94b7a156830c3621256857bc4'
            '64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43'
            'f2946a548f6fba763e25e3346b111d0fbdc4e8ae996e533e905d62811643e483'
            'a80e0fff2b208cf6f1fcf5d035ff9b7ed547e56aba1389bdac662ccdff42848f'
            '736e2d32f2984bbd2492f1ad88a7b49492055cc4f9c6242ba1f412d29f44da5e'
            '582537fb6641636e29ebc321cf26c5c6b7834ee0378d014d87f012eca3a7c8a0'
            'dcc39970f73245786c61eba04f28fe14e8c16b2ad66b161a9558b6038987b7ce'
            '1f67e0aaf635294a407e49627dee68c46f6bed7289fc9be77c8c9a4ee851054c')

prepare() {
  cd "communicator-v${pkgver//./}.x86-unknown-linux2.2"

  # Unpack the .nif component archives (what ns-install does).
  rm -rf "$srcdir/root"
  mkdir -p "$srcdir/root"
  for _nif in netscape-v${pkgver//./}.nif nethelp-v${pkgver//./}.nif spellchk-v${pkgver//./}.nif; do
    bsdtar -xf "$_nif" -C "$srcdir/root"
  done

  # libstdc++ from egcs 1.1 (gcc 2.91), which the binary links against.
  rm -rf "$srcdir/libstdc++"
  mkdir -p "$srcdir/libstdc++"
  bsdtar -xOf "$srcdir/libstdc++2.9-glibc2.1_${_libstdcver}_i386.deb" data.tar.gz \
    | bsdtar -xf - -C "$srcdir/libstdc++"

  # Default bookmarks for new profiles: the Personal Toolbar's links point
  # at long-dead home.netscape.com pages, so swap in plain-HTTP sites.
  chmod u+w "$srcdir/root/bookmark.htm"
  awk -v frag="$srcdir/oldweb-toolbar.html" '
    /<DT><H3>Personal Toolbar Folder<\/H3>/ {
      print; getline; print
      while ((getline line < frag) > 0) print line
      skip = 1; next
    }
    skip && /^    <\/DL><p>/ { skip = 0 }
    !skip
  ' "$srcdir/root/bookmark.htm" > "$srcdir/bookmark.htm"

  # Standalone copy for Bookmarks > File > Import... in existing profiles.
  {
    printf '%s\n' '<!DOCTYPE NETSCAPE-Bookmark-file-1>' \
      '<TITLE>Old Web Bookmarks</TITLE>' '<H1>Old Web Bookmarks</H1>' '<DL><p>' \
      '    <DT><H3>Old Web (plain HTTP)</H3>' '    <DL><p>'
    cat "$srcdir/oldweb-toolbar.html"
    printf '%s\n' '    </DL><p>' '</DL><p>'
  } > "$srcdir/oldweb-import.html"
}

build() {
  # Code from 2001 keeps the stack only 4-byte aligned, while Arch's lib32
  # libraries assume 16 bytes and fault on SSE spills (movaps) when Netscape
  # calls them.  Rebuild the X libraries it calls directly so they realign.
  # -static-libgcc lives in CC because libtool drops it from LDFLAGS.
  export CC="gcc -m32 -static-libgcc"
  export CFLAGS="-O2 -pipe -mincoming-stack-boundary=2"
  export CPPFLAGS="-I$srcdir/xroot/usr/include"
  export LDFLAGS="-L$srcdir/xroot/usr/lib32 -Wl,-O1 -Wl,-z,relro -Wl,-z,now"
  export PKG_CONFIG_PATH="$srcdir/xroot/usr/lib32/pkgconfig"
  export PKG_CONFIG_LIBDIR="/usr/lib32/pkgconfig:/usr/share/pkgconfig"

  rm -rf "$srcdir/xroot"
  local _lib
  for _lib in libX11-$_libx11 libXext-$_libxext libXt-$_libxt libXmu-$_libxmu libXpm-$_libxpm; do
    cd "$srcdir/$_lib"
    ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc \
      --host=i686-pc-linux-gnu --disable-static \
      --disable-specs --without-xmlto --without-fop --disable-open-zfile
    make
    make DESTDIR="$srcdir/xroot" install
    # Let later builds link against these, not the system copies.
    sed -i "s|=/usr|=$srcdir/xroot/usr|" "$srcdir"/xroot/usr/lib32/pkgconfig/*.pc
    rm -f "$srcdir"/xroot/usr/lib32/*.la
  done

  cd "$srcdir"
  $CC -O2 -fPIC -shared -fno-stack-protector -Wl,-z,noexecstack \
    -o libns4jmp.so ns4jmp.S ns4jmp.c
  gcc -O2 -fPIC -shared -o libns4jmp-stub.so ns4jmp-stub.c
}

package() {
  local _dest="$pkgdir/opt/netscape"
  local _inst="$srcdir/communicator-v${pkgver//./}.x86-unknown-linux2.2"

  install -d "$_dest"
  cp -a "$srcdir/root/." "$_dest/"

  # The dynamic-Motif build needs libXm.so.1, which nothing ships anymore.
  rm -f "$_dest/netscape-dynMotif" "$_dest/libnullplugin-dynMotif.so"

  install -Dm644 -t "$_dest/java/classes" "$_inst"/*.jar
  install -Dm755 -t "$_dest" "$_inst/vreg"

  install -d "$_dest/lib"
  ln -s ../libjsd.so "$_dest/lib/libjsd.so"
  install -Dm644 -t "$_dest/lib" "$srcdir/libstdc++/usr/lib/libstdc++-2-libc6.1-1-2.9.0.so"
  ln -s libstdc++-2-libc6.1-1-2.9.0.so "$_dest/lib/libstdc++-libc6.1-1.so.2"
  cp -a "$srcdir"/xroot/usr/lib32/lib{X11,Xext,Xt,Xmu,Xpm}.so.* "$_dest/lib/"

  install -Dm755 "$srcdir/libns4jmp.so" "$_dest/preload/lib32/libns4jmp.so"
  install -Dm755 "$srcdir/libns4jmp-stub.so" "$_dest/preload/lib/libns4jmp.so"

  # Version registry for Automatic Software Download, as ns-install writes it.
  local _infile="$srcdir/nsreg.infile"
  echo "Communicator,${_bldver},/opt/netscape" > "$_infile"
  for _jar in "$_inst"/*.jar; do
    echo "${_jar##*/},${_bldver},/opt/netscape/java/classes" >> "$_infile"
  done
  for _nif in nethelp spellchk; do
    echo "${_nif}-v${pkgver//./}.nif,${_bldver},/opt/netscape" >> "$_infile"
  done
  # vreg is 32-bit, so fakeroot's 64-bit preload cannot load into it anyway.
  env -u LD_PRELOAD "$_dest/vreg" "$_dest/registry" "$_infile"

  # The archives ship read-only modes; normalise them.
  chmod -R u+w,go-w "$_dest"

  install -Dm644 "$srcdir/bookmark.htm" "$_dest/bookmark.htm"
  install -Dm644 "$srcdir/oldweb-import.html" "$_dest/oldweb-bookmarks.html"

  install -Dm755 "$srcdir/netscape.sh" "$pkgdir/usr/bin/netscape"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/netscape-communicator.desktop"

  install -Dm644 "$_dest/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/libstdc++/usr/share/doc/libstdc++2.9-glibc2.1/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/libstdc++.copyright"
  local _lib
  for _lib in libX11-$_libx11 libXext-$_libxext libXt-$_libxt libXmu-$_libxmu libXpm-$_libxpm; do
    install -Dm644 "$srcdir/$_lib/COPYING" "$pkgdir/usr/share/licenses/$pkgname/${_lib%-*}.COPYING"
  done
}
