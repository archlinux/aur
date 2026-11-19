# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
pkgname=pamac-fix
pkgver=0.1.0
pkgrel=1
pkgdesc='Pamac-Fix development preview: integrated libpamac, CLI, GTK manager and tray'
arch=('x86_64')
url='https://github.com/username227/Pamac-Fix'
license=('GPL-3.0-or-later')
depends=('pacman>=7.0' 'libalpm.so=16' 'glib2' 'json-glib' 'libsoup3' 'polkit' 'appstream' 'archlinux-appstream-data' 'flatpak' 'snapd-glib' 'gtk3' 'gtk4' 'libadwaita' 'libnotify' 'xapp' 'libayatana-appindicator')
makedepends=('git' 'meson' 'ninja' 'vala' 'pkgconf' 'gcc' 'binutils' 'glib2-devel' 'gobject-introspection' 'gettext' 'asciidoc')
optdepends=('snapd: Snap package management support (requires a running snapd service)')
provides=('libpamac=11.7.4' 'libpamac-aur=11.7.4' 'libpamac-full=1:11.7.4' 'libpamac-flatpak=1:11.7.4' 'libpamac.so' 'pamac=11.7.5' 'pamac-cli=11.7.4' 'pamac-aur=11.7.5' 'pamac-all=11.7.5')
conflicts=('libpamac' 'libpamac-aur' 'libpamac-full' 'libpamac-flatpak' 'libpamac-full-fix' 'libpamac-full-fix-debug' 'pamac' 'pamac-cli' 'pamac-aur' 'pamac-all' 'pamac-flatpak' 'pamac-git' 'pamac-aur-git' 'pamac-gtk3' 'pamac-classic' 'pamac-classic-fixed' 'pamac-all-fix' 'pamac-cli-fix' 'pamac-gtk-fix')
backup=('etc/pamac.conf')
options=('!debug')

_libpamac_commit='b2f06a46084aef5b6be3dbe63e7f9a12905cc279'
_gtk_commit='2b1873a3e14fe6ae09f68c7a60d346df2445d7b5'
_cli_commit='66a7df6ceb6928b7bee93924f7e49673d6913696'

source=("libpamac-fix::git+https://github.com/username227/libpamac-fix.git#commit=${_libpamac_commit}"
		"pamac-gtk-fix::git+https://github.com/username227/pamac-gtk-fix.git#commit=${_gtk_commit}"
		"pamac-cli-fix::git+https://github.com/username227/pamac-cli-fix.git#commit=${_cli_commit}")
sha256sums=('5319b4cb646f4fa0fcdb34f83bb0d5ae5db65547a92857904ee45c63048a91b9'
            '29a833d42b176ce267420b793dbddc337b1fd80659a3f5dbfe83451e611af839'
            'd7f03bc62225f3003760d7fcbf294401fb283d134b23d62923dfc0df91d3fd29')

build() {
  # Arch runs build() from the extracted source directory. Derive all
  # paths from that working directory and fail closed if it is wrong.
  # Do not concatenate an unset srcdir with /build-* (which targets /).
  local _srcroot
  _srcroot=$(pwd -P) || return 1
  if [[ "${_srcroot}" == / ]] || \
     [[ ! -f "${_srcroot}/libpamac-fix/meson.build" ]] || \
     [[ ! -f "${_srcroot}/pamac-gtk-fix/meson.build" ]] || \
     [[ ! -f "${_srcroot}/pamac-cli-fix/meson.build" ]]; then
    printf 'ERROR: build() must run from the extracted source directory; got %s\n' "${_srcroot}" >&2
    return 1
  fi
  local _build_libpamac="${_srcroot}/build-libpamac"
  local _build_gtk="${_srcroot}/build-pamac-gtk"
  local _build_cli="${_srcroot}/build-pamac-cli"
  local _stage="${_srcroot}/pamac-fix-stage"

  # 1. libpamac - Compile the matching library, daemon, plugins and shared coordinator.
  meson setup "${_build_libpamac}" "${_srcroot}/libpamac-fix" \
    --prefix=/usr --libdir=lib --sysconfdir=/etc --buildtype=release \
    -Denable-aur=true \
    -Denable-appstream=true \
    -Denable-flatpak=true \
    -Denable-snap=true
  meson compile -C "${_build_libpamac}"

  # Install only to a temporary staging root for dependent builds.
  # Nothing is written to the live /usr or /etc at this stage.
  meson install -C "${_build_libpamac}" --destdir "${_stage}" --no-rebuild

  # Meson's installed pamac.pc normally points to /usr. Relocate only the
  # temporary copy so dependent builds use our freshly staged libpamac.
  local _pc="${_stage}/usr/lib/pkgconfig/pamac.pc"
  if [[ ! -f "${_pc}" ]]; then
    printf 'ERROR: staged pamac.pc not found at %s\n' "${_pc}" >&2
    return 1
  fi
  sed -i "s|^prefix=/usr$|prefix=${_stage}/usr|" "${_pc}"
  if ! grep -Fxq "prefix=${_stage}/usr" "${_pc}"; then
    printf 'ERROR: failed to relocate staged pamac.pc prefix\n' >&2
    return 1
  fi

  # Meson passes each source tree's vapi/ folder to valac. Populate those
  # folders with the generated matching pamac.vapi, never the host VAPI.
  local _vapi
  _vapi=$(find "${_stage}/usr" "${_build_libpamac}/src" \
    -type f -name 'pamac.vapi' -print -quit)
  if [[ -z "${_vapi}" ]]; then
    printf 'ERROR: compiled pamac.vapi not found in staged/build outputs\n' >&2
    return 1
  fi
  local _component
  for _component in pamac-gtk-fix pamac-cli-fix; do
    cp -f "${_vapi}" "${_srcroot}/${_component}/vapi/pamac.vapi"
    if [[ -f "${_vapi%.vapi}.deps" ]]; then
      cp -f "${_vapi%.vapi}.deps" "${_srcroot}/${_component}/vapi/pamac.deps"
    fi
  done

  # Abort if pkg-config would resolve the host's old libpamac instead.
  export PKG_CONFIG_PATH="${_stage}/usr/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  export LD_LIBRARY_PATH="${_stage}/usr/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
  local _selected_libdir
  _selected_libdir=$(pkg-config --variable=libdir pamac) || return 1
  if [[ "${_selected_libdir}" != "${_stage}/usr/lib" ]]; then
    printf 'ERROR: pkg-config selected %s instead of staged libpamac\n' "${_selected_libdir}" >&2
    return 1
  fi
  printf 'Building against staged libpamac in %s\n' "${_selected_libdir}"

  # 2. pamac-gti - Compile graphical manager, installer, GTK bindings and tray backends.
  meson setup "${_build_gtk}" "${_srcroot}/pamac-gtk-fix" \
    --prefix=/usr --libdir=lib --sysconfdir=/etc --buildtype=release \
    -Djemalloc=false -Denable-fake-gnome-software=false
  meson compile -C "${_build_gtk}"

  # 3. pamac-cli - Compile CLI against exactly the same freshly built library.
  meson setup "${_build_cli}" "${_srcroot}/pamac-cli-fix" \
    --prefix=/usr --libdir=lib --sysconfdir=/etc --buildtype=release
  meson compile -C "${_build_cli}"
}

package() {
  local _srcroot="${srcdir:?}"	
  local _build_libpamac="${_srcroot}/build-libpamac"
  local _build_gtk="${_srcroot}/build-pamac-gtk"
  local _build_cli="${_srcroot}/build-pamac-cli"
  local _stage="${_srcroot}/pamac-fix-stage"
  meson install -C "${_build_libpamac}" --destdir "${pkgdir}" --no-rebuild
  meson install -C "${_build_gtk}" --destdir "${pkgdir}" --no-rebuild
  meson install -C "${_build_cli}" --destdir "${pkgdir}" --no-rebuild
}
