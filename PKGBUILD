# Maintainer:

# set source - chaotic-aur or bitbucket
: ${_pkg:=bitbucket}

# basic info
_pkgname="art-rawconverter"
pkgname="$_pkgname-bin"
pkgver=1.21.1
pkgrel=1
pkgdesc="Raw image converter forked from RawTherapee with ease of use in mind"
url="https://bitbucket.org/agriggio/art"
license=('GPL-3.0-or-later')
arch=('x86_64')

# main package
_main_package() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  options=(!strip !debug)

  if [[ "${_pkg::1}" == 'c' ]] ; then
    _main_chaotic
  else
    _main_bitbucket
  fi
}

# chaotic-aur
_main_chaotic() {
  _regex='^art-rawconverter-([0-9]+.+)(\.r[0-9]+.*)?-([0-9]+.*)-(.+)\.pkg\.tar\.zst$'

  _filelist=$(curl "https://builds.garudalinux.org/repos/chaotic-aur/pkgs.files.txt" -s)

  _filename=$(printf '%s' "$_filelist" | grep -E "$_regex" | tail -1)

  pkgver=$(
    printf '%s' "$_filename" \
      | sed -E "s@$_regex@\1@"
  )

  pkgrel="${pkgrel}.1"

  _dl_url="https://cdn-mirror.chaotic.cx/chaotic-aur/$CARCH"
  source=("$_dl_url/$_filename")
  sha256sums+=('SKIP')

  package() {
    depends+=(
      'desktop-file-utils'
      'exiv2'
      'fftw'
      'glibmm'
      'gtk3'
      'gtkmm3'
      'lcms2'
      'lensfun'
      'libcanberra'
      'libiptcdata'
      'libraw'
      'mimalloc'
      'opencolorio'
      'openmp'
    )
    optdepends+=(
      'art-rawconverter-imageio: add support for additional image formats'
      'lcms2-ff: lcms2 with fast-float plugin for improved export speed'
      'perl-image-exiftool: metadata support for CR3 images'
    )

    mv "$srcdir/usr" "$pkgdir/"

    ln -s "ART" "$pkgdir/usr/bin/art"
    ln -s "ART-cli" "$pkgdir/usr/bin/art-cli"
  }
}

# bitbucket
_main_bitbucket() {
  source=(
    "$_pkgname-$pkgver.tar.xz"::"$url/downloads/ART-$pkgver-linux64.tar.xz"
  )
  sha256sums+=(
    'e3d07a4685aee2558ad620bcd1c23b2371a4b4fa444211d8d32175c7b5f0b0aa'
  )

  prepare() {
    cp -rl "ART-$pkgver-linux64" "$_pkgname-$pkgver"

    cat "$_pkgname-$pkgver/share/applications/ART.desktop" \
      | sed 's/Name=ART/Name=ART Raw Converter/' \
      | sed 's/Exec=ART/Exec=art/' \
      | sed "s/Icon=ART/Icon=$_pkgname/" \
      > "$_pkgname.desktop"
  }

  package() {
    local OPT_PATH="opt/$_pkgname"

    # Install the package files
    install -dm755 "$pkgdir/opt"
    cp --reflink=auto -r "$_pkgname-$pkgver" "$pkgdir/$OPT_PATH"

    # symlinks
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/$OPT_PATH/ART" "$pkgdir/usr/bin/art"
    ln -s "/$OPT_PATH/ART-cli" "$pkgdir/usr/bin/art-cli"

    install -dm755 "$pkgdir/usr/share/man/man1"
    ln -s "/$OPT_PATH/share/man/man1/ART.1" "$pkgdir/usr/share/man/man1/art.1"

    # .desktop
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

    # icons
    local SRC_LOC="$srcdir/$_pkgname-$pkgver/share/icons/hicolor"
    local DEST_LOC="$pkgdir/usr/share/icons/hicolor"
    for i in 16 24 48 128 256 ; do
      install -Dm644 "$SRC_LOC/${i}x${i}/apps/ART.png" "$DEST_LOC/${i}x${i}/apps/$_pkgname.png"
    done

    # fix permissions
    chmod -R u+rwX,go+rX,go-w "$pkgdir"
  }
}

# execute
_main_package
