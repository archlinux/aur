# Maintainer: xiota / aur.chaotic.cx

## options
: ${_build_avx:=false}
: ${_build_git:=false}

[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="fairy-stockfish"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=14.0.1
pkgrel=6
pkgdesc="Chess engine with support for fairy chess and other variants"
url="https://github.com/fairy-stockfish/Fairy-Stockfish"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-3.0-only')

pkgname=(
  "$_pkgname${_pkgtype:-}"
  "python-pyffish${_pkgtype:-}"
)

# main package
_main_package() {
  makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
  )

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi

  source+=(
    "fairyfishgui"::"git+https://github.com/fairy-stockfish/FairyFishGUI.git"
    'xbfs-shogi.desktop'
    'xbfs-shogi.sh'
    'xbfs-shogi.svg'
    'xbfs-xiangqi.desktop'
    'xbfs-xiangqi.sh'
    'xbfs-xiangqi.svg'
  )
  sha256sums+=(
    'SKIP'
    'd4300a0b1ca55b7a1bc152924b3d0103445fe04bedacd6759c82501167b32115'
    '62589d92889ffa8aa47b537c8c7e69307f4cd938167f5cbb8b41dc06d259e607'
    'aba44a13030469f60f66eb27c6c4fa2a4d957372fce2808e4dad29914566baed'
    'dcbafb9ce71a6effc8d0cab2fa6e1b355e53f6283ea8ecc13e21013fb59c1cb1'
    'e7101ca94fb9b5fc1b5529734c3e6239171778f2aae1bfb0a14c9d8cd4171229'
    '814ee2fc2ec1ee379ac98c3d94d0b628c706231f862a1d03a2ef0ce9d1d2ed15'
  )
}

# stable package
_main_stable() {
  _tag="fairy_sf_${pkgver//./_}_xq"
  _pkgsrc="Fairy-Stockfish-$_tag"
  _pkgext="tar.gz"
  source+=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$_tag.$_pkgext")
  sha256sums+=('53914fc89d89afca7cfcfd20660ccdda125f1751f59a68b1f3ed1d4eb6cfe805')
}

# git package
_main_git() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    git describe --long --tags --abbrev=8 --match="fairy_sf_[0-9]*" \
      | sed -E 's/^[^0-9]*//;s/_[a-z]+$//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

## common functions
prepare() {
  sed -e 's/^EXE = stockfish$/EXE = fairy-stockfish/' \
    -i "$_pkgsrc/src/Makefile"

  sed -E -e 's/^(\s*  ss <<) " XQ";$/\1 " LB";/' \
    -i "$_pkgsrc/src/misc.cpp"
}

build() {
  if [ "${_build_avx::1}" == "t" ] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi
  CXXFLAGS+=" -DLARGEBOARDS"
  CXXFLAGS+=" -DPRECOMPUTED_MAGICS"
  CXXFLAGS+=" -DNNUE_EMBEDDING_OFF"
  CXXFLAGS+=" -DALLVARS"
  CXXFLAGS+=" -DNDEBUG"

  (
    printf "\nStep 1. Building python module ...\n"
    cd "$_pkgsrc"
    python -m build --wheel --no-isolation --skip-dependency-check
  )

  # upstream stockfish / fairy-stockfish build scripts detect
  # and force-enable cpu features, ignoring user CFLAGS and CXXFLAGS,
  # producing binaries that are unusable on some computers.
  #
  # The following replicates `make profile-build` without cpu-detection.
  cd "$_pkgsrc/src"
  local _make=(make 'ARCH=" "')

  # "${_make[@]}" net
  printf "\nStep 2. Building instrumented executable ...\n"
  mkdir -p profdir
  "${_make[@]}" \
    EXTRACXXFLAGS='-fprofile-generate=profdir' \
    EXTRALDFLAGS='-lgcov' \
    all

  printf "\nStep 3. Running benchmark for pgo-build ...\n"
  ./fairy-stockfish bench > PGOBENCH.out

  printf "\nStep 4. Building optimized executable ...\n"

  "${_make[@]}" objclean
  "${_make[@]}" \
    EXTRACXXFLAGS='-fprofile-use=profdir -fno-peel-loops -fno-tracer' \
    EXTRALDFLAGS='-lgcov' \
    all

  #printf "\nStep 5. Deleting profile data ...\n"
  #"${_make[@]}" profileclean
}

_package_python-pyffish() {
  pkgdesc="Python bindings for fairy-stockfish variant chess engine"
  depends=(
    'python'
    'python-pysimplegui'
    "fairy-stockfish${_pkgtype:-}"
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # fairyfishgui
  local _fairyfishgui="$pkgdir/usr/bin/fairyfishgui"
  install -Dm755 /dev/stdin "$_fairyfishgui" <<END
#!/usr/bin/env python
END
  cat "$srcdir/fairyfishgui/fairyfishgui.py" >> "$_fairyfishgui"
}

_package_fairy-stockfish() {
  depends=(
    'libnotify'
  )
  optdepends+=(
    # 'polyglot-winboard: For xboard support'
    'xboard: GUI frontend'
  )

  if [[ "${_build_git::1}" == "t" ]] || [[ "${_build_avx::1}" == "t" ]] ; then
    provides+=(fairy-stockfish="${pkgver%%.r*}")
    conflicts+=(fairy-stockfish)
  fi

  cd "$_pkgsrc/src"
  make PREFIX="$pkgdir/usr" install

  # xboard shogi
  install -Dm755 "$srcdir/xbfs-shogi.sh" "$pkgdir/usr/bin/xbfs-shogi"
  install -Dm644 "$srcdir/xbfs-shogi.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/xbfs-shogi.svg" -t "$pkgdir/usr/share/pixmaps/"

  # xboard xiangqi
  install -Dm755 "$srcdir/xbfs-xiangqi.sh" "$pkgdir/usr/bin/xbfs-xiangqi"
  install -Dm644 "$srcdir/xbfs-xiangqi.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/xbfs-xiangqi.svg" -t "$pkgdir/usr/share/pixmaps/"
}

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%$_pkgtype}")
    _package_${_p%$_pkgtype}
  }"
done

# execute
_main_package
