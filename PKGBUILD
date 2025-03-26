# Maintainer: xiota / aur.chaotic.cx

## options
: ${_build_largeboards:=true}

: ${_build_clang:=true}
: ${_build_python:=false}

: ${_build_pgo:=true}

: ${_build_level:=1}
: ${_build_git:=false}

unset _pkgtype
[[ "${_build_level::1}" == "2" ]] && _pkgtype+="-x64v2"
[[ "${_build_level::1}" == "3" ]] && _pkgtype+="-x64v3"
[[ "${_build_level::1}" == "4" ]] && _pkgtype+="-x64v4"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

_pkgname="fairy-stockfish"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=14.0.1
pkgrel=8
pkgdesc="Chess engine with support for Xiangqi, Shogi, Janggi, and many other variants"
url="https://github.com/fairy-stockfish/Fairy-Stockfish"
arch=('aarch64' 'i686' 'x86_64' 'x86_64_v2' 'x86_64_v3' 'x86_64_v4')
license=('GPL-3.0-only')

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

if [[ "${_build_clang::1}" == "t" ]]; then
  makedepends+=(
    'clang'
    'lld'
    'llvm'
  )
fi

_source_stable() {
  _tag="fairy_sf_${pkgver//./_}_xq"
  _pkgsrc="Fairy-Stockfish-$_tag"
  _pkgext="tar.gz"
  source+=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$_tag.$_pkgext")
  sha256sums+=('53914fc89d89afca7cfcfd20660ccdda125f1751f59a68b1f3ed1d4eb6cfe805')
}

_source_git() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    git describe --long --tags --abbrev=7 --match="fairy_sf_[0-9]*" \
      | sed -E 's/^[^0-9]*//;s/_[a-z]+$//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

_source_common() {
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

prepare() {
  sed -E \
    -e 's/^EXE = stockfish$/EXE = fairy-stockfish/' \
    -e '/^.*experimental-new-pass-manager.*/d' \
    -i "$_pkgsrc/src/Makefile"

  sed -E -e 's/^(\s*  ss <<) " XQ";$/\1 " LB";/' \
    -i "$_pkgsrc/src/misc.cpp"
}

build() {
  export CFLAGS CXXFLAGS LDFLAGS

  local _ldflags=(${LDFLAGS})
  LDFLAGS="${_ldflags[@]//*fuse-ld*/}"

  if [[ ${_build_level::1} =~ ^[2-4]$ ]]; then
    local _cxxflags=(
      -march=x86-64-v${_build_level::1} -mtune=generic -O3
      $(sed -E -e 's&-(march|mtune)=\S+\b&&g' -e 's&-O[0-9]+\b&&g' <<< "${CXXFLAGS}")
    )
    CXXFLAGS="${_cxxflags[@]}"
  fi

  if [[ "${_build_largeboards::1}" == "t" ]]; then
    CXXFLAGS+=" -DLARGEBOARDS"
    CXXFLAGS+=" -DPRECOMPUTED_MAGICS"
    CXXFLAGS+=" -DALLVARS"
  fi

  CXXFLAGS+=" -DNNUE_EMBEDDING_OFF"
  CXXFLAGS+=" -DNDEBUG"

  if [[ "${_build_python::1}" == "t" ]]; then
    printf "\nStep 0. Building python module ...\n"
    (
      cd "$_pkgsrc"
      python -m build --wheel --no-isolation --skip-dependency-check
    )
  fi

  # upstream stockfish / fairy-stockfish build scripts detect
  # and force-enable cpu features, ignoring user CXXFLAGS,
  # producing binaries that are unusable on some computers.
  #
  # The following replicates `make profile-build` without cpu-detection.
  cd "$_pkgsrc/src"

  if [[ "${_build_clang::1}" == "t" ]]; then
    local _make=(make COMP=clang 'ARCH=" "')
    LDFLAGS="${_ldflags[@]//*fuse-ld*/} -fuse-ld=lld"
  else
    local _make=(make COMP=gcc 'ARCH=" "')
  fi

  if [[ "${_build_pgo::1}" == "t" ]]; then
    if [[ "${_build_clang::1}" == "t" ]]; then
      local _pgo_gen_options=(
        EXTRACXXFLAGS="-fprofile-generate"
        EXTRALDFLAGS=""
      )
      local _pgo_use_options=(
        EXTRACXXFLAGS="-fprofile-use=$pkgname.prof"
        EXTRALDFLAGS=""
      )
    else
      local _pgo_gen_options=(
        EXTRACXXFLAGS="-fprofile-generate=profdir"
        EXTRALDFLAGS="-lgcov"
      )
      local _pgo_use_options=(
        EXTRACXXFLAGS="-fprofile-use=profdir -fno-peel-loops -fno-tracer"
        EXTRALDFLAGS="-lgcov"
      )
    fi

    # "${_make[@]}" net
    printf "\nStep 1. Building instrumented executable ...\n"
    mkdir -p profdir
    "${_make[@]}" "${_pgo_gen_options[@]}" all

    printf "\nStep 2. Running benchmark for pgo-build ...\n"
    ./fairy-stockfish bench > PGOBENCH.out

    if [[ "${_build_clang::1}" == "t" ]]; then
      llvm-profdata merge -output=$pkgname.prof *.profraw
    fi

    printf "\nStep 3. Building optimized executable ...\n"

    "${_make[@]}" objclean
    "${_make[@]}" "${_pgo_use_options[@]}" all

    #printf "\nStep 4. Deleting profile data ...\n"
    #"${_make[@]}" profileclean
  else
    printf "\nStep 1. Building standard executable ...\n"
    "${_make[@]}" all
  fi
}

_package_python-pyffish() {
  pkgdesc="Python bindings for fairy-stockfish"
  depends=(
    'python'
    "fairy-stockfish${_pkgtype:-}"
  )
  optdepends=(
    'python-pysimplegui: for gui'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # fairyfishgui
  local _fairyfishgui="$pkgdir/usr/bin/fairyfishgui"
  install -Dm755 /dev/stdin "$_fairyfishgui" << END
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

  if [ "$pkgname" != "$_pkgname" ]; then
    provides+=(fairy-stockfish="${pkgver%%.r*}")
    conflicts+=(fairy-stockfish)
  fi

  if [[ "${_build_largeboards::1}" == "t" ]]; then
    # xboard shogi
    install -Dm755 "$srcdir/xbfs-shogi.sh" "$pkgdir/usr/bin/xbfs-shogi"
    install -Dm644 "$srcdir/xbfs-shogi.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/xbfs-shogi.svg" -t "$pkgdir/usr/share/pixmaps/"

    # xboard xiangqi
    install -Dm755 "$srcdir/xbfs-xiangqi.sh" "$pkgdir/usr/bin/xbfs-xiangqi"
    install -Dm644 "$srcdir/xbfs-xiangqi.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/xbfs-xiangqi.svg" -t "$pkgdir/usr/share/pixmaps/"
  fi

  cd "$_pkgsrc/src"
  make PREFIX="$pkgdir/usr" install
}

if [ "${_build_git::1}" != "t" ]; then
  _source_stable
else
  _source_git
fi

_source_common

pkgname=("$_pkgname${_pkgtype:-}")
[[ "${_build_python::1}" == "t" ]] && pkgname+=("python-pyffish${_pkgtype:-}")

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%$_pkgtype}")
    _package_${_p%$_pkgtype}
  }"
done
