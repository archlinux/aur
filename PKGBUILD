# Maintainer:

## useful links:
# https://gitlab.winehq.org/wine/wine
# https://gitlab.winehq.org/wine/wine-staging

# options
: ${_build_staging:=true}
: ${_build_wow64:=true}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_staging::1}" == "t" ]] && _pkgtype+="-staging"
[[ "${_build_wow64::1}" == "t" ]] && _pkgtype+="-wow64"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="wine"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=9.8.r57.gae9bdbda
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs"
url="https://gitlab.winehq.org/wine/wine"
license=('LGPL-2.1-or-later')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    alsa-lib              #lib32-alsa-lib
    fontconfig            #lib32-fontconfig
    freetype2             #lib32-freetype2
    gettext               #lib32-gettext
    gst-plugins-base-libs #lib32-gst-plugins-base-libs
    libpulse              #lib32-libpulse
    libxcomposite         #lib32-libxcomposite
    libxcursor            #lib32-libxcursor
    libxi                 #lib32-libxi
    libxinerama           #lib32-libxinerama
    libxrandr             #lib32-libxrandr
    opencl-icd-loader     #lib32-opencl-icd-loader
    pcsclite              #lib32-pcsclite
    sdl2                  #lib32-sdl2
    v4l-utils             #lib32-v4l-utils
    desktop-file-utils
    libgphoto2

    # with-wayland
    libxkbcommon
    wayland
  )
  makedepends=(
    libxxf86vm        #lib32-libxxf86vm
    mesa              #lib32-mesa
    mesa-libgl        #lib32-mesa-libgl
    vulkan-icd-loader #lib32-vulkan-icd-loader
    autoconf
    bison
    flex
    git
    mingw-w64-gcc
    opencl-headers
    perl
    vulkan-headers
  )
  local _makeoptdeps=(
    ::alsa-plugins #lib32-alsa-plugins
    ::dosbox
    libcups::cups #lib32-libcups
    samba::samba
    sane::sane
  )
  for i in "${_makeoptdeps[@]}"; do
    [ -n "${i%%::*}" ] && makedepends+=("${i%%::*}")
    [ -n "${i##*::}" ] && optdepends+=("${i##*::}")
  done

  options=(staticlibs !lto)
  backup=("usr/lib/binfmt.d/wine.conf")

  # provides/depends
  _pkgdep="$pkgname"
  if [[ "$_pkgdep" =~ .*staging-wow64.* ]]; then
    provides+=("wine-wow64=${pkgver%%.r*}")
    conflicts+=("wine-wow64")
  fi
  while [[ "$_pkgdep" =~ .*-.* ]]; do
    _pkgdep="${_pkgdep%-*}"
    provides+=("${_pkgdep}=${pkgver%%.r*}")
    conflicts+=("${_pkgdep}")
  done

  # sources
  if [[ "${_build_git::1}" != "t" ]]; then
    _main_stable
  else
    _main_git
  fi

  if [[ "${_build_staging::1}" == "t" ]]; then
    source+=("git+https://gitlab.winehq.org/wine/wine-staging.git")
    sha256sums+=('SKIP')

    _prepare_staging() {
      pushd "$_pkgsrc"

      # apply wine-staging patchset
      "$srcdir/wine-staging/staging/patchinstall.py" --all "${_staging_options[@]}"

      popd
    }
  else
    _prepare_staging() {
      :
    }
  fi

  source+=(
    30-win32-aliases.conf
    wine-binfmt.conf
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=wine-${pkgver%%.r*}")
  sha256sums+=('SKIP')

  _prepare_main() {
    pushd "$_pkgsrc"

    _pkgver=$(
      git tag --list 'wine-[0-9]*.[0-9]*' \
        | sed -E 's/^[^0-9]+//;s/^.*[A-Za-z]{2}.*$//' \
        | sort -V | tail -1
    )

    if [[ "${_pkgver:?}" != "${pkgver%%.r*}" ]]; then
      git checkout -f "wine-$_pkgver"
      git describe --tags --long
    fi

    if [[ "${_build_staging::1}" == "t" ]]; then
      git -C "$srcdir/wine-staging" checkout -f "v$_pkgver"
      git -C "$srcdir/wine-staging" describe --tags --long
    fi

    popd
  }

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  _prepare_main() {
    _staging_options=(
      #-Wserver-PeekMessage
      #-Weventfd_synchronization
    )
  }

  pkgver() {
    cd "$_pkgsrc"
    local _version=$(
      git tag --list 'wine-[0-9]*.[0-9]*' \
        | sed -E 's/^[^0-9]+//;s/^.*[A-Za-z]{2}.*$//' \
        | sort -V | tail -1
    )
    local _revision=$(git rev-list --count --cherry-pick wine-$_version...HEAD)
    local _hash=$(git rev-parse --short=8 HEAD)
    printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
  }
}

# common functions
prepare() {
  _prepare_main
  _prepare_staging
}

build() {
  # Apply flags for cross-compilation
  export CROSSCFLAGS="${CFLAGS/-Werror=format-security/}"
  export CROSSCXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
  export CROSSLDFLAGS="${LDFLAGS//-Wl,-z*([^[:space:]])/}"

  local _configure_options=(
    --disable-tests
    --prefix=/usr
    --libdir=/usr/lib
    --enable-archs=x86_64,i386
    --with-wayland
  )

  cd "$_pkgsrc"
  ./configure "${_configure_options[@]}"
  make
}

package() {
  cd "$_pkgsrc"

  make install \
    prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine"

  ln -sf wine "$pkgdir/usr/bin/wine64"

  # Font aliasing settings for Win32 applications
  install -Dm644 "$srcdir/30-win32-aliases.conf" -t "$pkgdir/usr/share/fontconfig/conf.avail/"

  install -d "$pkgdir/usr/share/fontconfig/conf.default"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"

  # binfmt config
  install -Dm644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"
}

# execute
_main_package
