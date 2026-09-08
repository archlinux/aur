# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alex S. <shantanna_at_hotmail_dot_com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Marco Scardovi <scardracs_at_disroot_dot_org>

# Hardware support is limited. Nvidia cards should work fine.
# If you're running a hybrid setup, try with primusrun/optirun.

# Get the source file DaVinci_Resolve_Studio_${pkgver}_Linux.zip from:
# https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion
# and save it in the same directory of this PKGBUILD

# This variant applies josephg/resolve-aacfix at build time for AAC support
# the e9patch trampolines are compiled and spliced into bin/resolve, and the 
# four bundled FFmpeg libraries are replaced by AAC-enabled LGPL builds of the
# same FFmpeg 6.0.1. Everything is built from source through the project's own
# scripts/dev-setup.sh -- no prebuilt release payload is used.

_pkgname=resolve
pkgname=davinci-resolve-studio-aacfix
pkgver=21.1
pkgrel=1
pkgdesc='Professional A/V post-production software suite from Blackmagic Design. Studio edition with AAC audio decode restored (resolve-aacfix), requires license key or license dongle.'
arch=('x86_64')
url="https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion"
license=('LicenseRef-scancode-commercial-license' 'MIT' 'LGPL-2.1-or-later')
depends=('glu' 'fuse2' 'opencl-driver' 'qt5-x11extras' 'qt5-svg'
         'qt5-quickcontrols2' 'qt5-multimedia' 'libxcrypt-compat' 'xmlsec'
         'java-runtime' 'ffmpeg4.4' 'gst-plugins-bad-libs' 'python-numpy'
         'tbb' 'apr-util' 'luajit' 'libc++' 'libc++abi')
# resolve-aacfix build chain: e9patch needs g++/xxd/which/zlib, FFmpeg needs
# nasm, the patcher needs capstone + pyelftools (system packages replace the
# pip-downloaded vendor/pylibs of a release tarball).
makedepends=('libarchive' 'xdg-user-dirs' 'patchelf'
             'git' 'nasm' 'xxd' 'which' 'zlib'
             'python' 'python-capstone' 'python-pyelftools')
provides=("davinci-resolve-studio=${pkgver}")
conflicts=('davinci-resolve' 'davinci-resolve-beta' 'davinci-resolve-studio'
           'davinci-resolve-studio-beta')
# Keep _e9patch_commit and _ffmpeg_ver in sync with
# resolve-aacfix/scripts/versions.sh (E9PATCH_COMMIT / FFMPEG_TAG) whenever
# _aacfix_ver is bumped.  e9patch stays a git source on purpose: the pinned
# commit is v1.0.1 plus an untagged fix, and scripts/dev-setup.sh re-clones
# vendor/e9patch unless it finds a .git there.
_aacfix_ver=0.1.1
_e9patch_commit=682ab1f7f0480aa45edf1fd94457e5ee2dd01043
_ffmpeg_ver=6.0.1
source=("file://DaVinci_Resolve_Studio_${pkgver}_Linux.zip"
        "davinci-control-panels-setup.sh"
        "resolve-aacfix-${_aacfix_ver}.tar.gz::https://github.com/josephg/resolve-aacfix/archive/refs/tags/v${_aacfix_ver}.tar.gz"
        "e9patch::git+https://github.com/GJDuck/e9patch.git#commit=${_e9patch_commit}"
        "https://ffmpeg.org/releases/ffmpeg-${_ffmpeg_ver}.tar.xz"{,.asc})
# The ffmpeg tarball sum below is a placeholder: run `updpkgsums` once.
sha256sums=('7968105cb1cc855892eaea20033fc457a26a37e6492b5d7be0815c975cdc5350'
            'f17236fd68cead727c647bc31404e402922cdd491df5526f4b62364cbef9d3b8'
            'd09e4d046d964c80ba58b51e8fc253f1102af229dd3bd28d83197736e505d981'
            '1384cf1df809ae4429cf42ce55cefc081766a6baa5c51537dd9ef083ccebbe13'
            '9b16b8731d78e596b4be0d720428ca42df642bb2d78342881ff7f5bc29fc9623'
            'SKIP')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # FFmpeg release signing key
install="${pkgname}.install"
# !lto: the trampoline and FFmpeg must be plain objects; !debug: nothing here
# gets stripped, so don't bake -g into 60 MB of FFmpeg libs.
options=('!strip' '!debug' '!lto')

prepare() {
  chmod u+x "./DaVinci_Resolve_Studio_${pkgver}_Linux.run"
  "./DaVinci_Resolve_Studio_${pkgver}_Linux.run" --appimage-extract

  # Fix permission to all files and dirs
  chmod -R u+rwX,go+rX,go-w "squashfs-root"

  pushd "squashfs-root/share/panels"
  tar -zxf dvpanel-framework-linux-x86_64.tgz
  chmod -R u+rwX,go+rX,go-w "lib"
  mv *.so "${srcdir}/squashfs-root/libs"
  mv lib/* "${srcdir}/squashfs-root/libs"
  popd

  rm -rf squashfs-root/{installer*,AppRun*,CentOSUpdate}

  while IFS= read -r -d '' _file; do
    chmod 0755 "${_file}"
  done < <(find "squashfs-root" -type d -print0)

  while IFS= read -r -d '' _file; do
    [[ -f "${_file}" && $(od -t x1 -N 4 "${_file}") == *"7f 45 4c 46"* ]] || continue
    chmod 0755 "${_file}"
  done < <(find "squashfs-root" -type f -print0)

  # Prepare list of paths for patchelf
  _patchelf_paths=(
    "libs"
    "libs/plugins/"{sqldrivers,xcbglintegrations,imageformats,platforms}
    "libs/Fusion"
    "plugins"
    "bin"
    "BlackmagicRAWSpeedTest/BlackmagicRawAPI"
    "BlackmagicRAWSpeedTest/plugins/"{platforms,imageformats,mediaservice,audio,xcbglintegrations,bearer}
    "BlackmagicRAWPlayer/BlackmagicRawAPI"
    "BlackmagicRAWPlayer/plugins/"{mediaservice,imageformats,audio,platforms,xcbglintegrations,bearer}
    "Onboarding/plugins/"{xcbglintegrations,qtwebengine,platforms,imageformats}
    "DaVinci Control Panels Setup/plugins/"{platforms,imageformats,bearer}
    "DaVinci Control Panels Setup/AdminUtility/PlugIns/"{DaVinciKeyboards,DaVinciPanels}
  )
  for _index in "${!_patchelf_paths[@]}"
  do
    _patchelf_paths[${_index}]="/opt/${_pkgname}/${_patchelf_paths[${_index}]}"
  done
  while IFS= read -r -d '' _file; do
    [[ -f "${_file}" && $(od -t x1 -N 4 "${_file}") == *"7f 45 4c 46"* ]] || continue
    patchelf --set-rpath "$(IFS=":"; echo "${_patchelf_paths[*]}:\$ORIGIN")" "${_file}"
  done < <(find "squashfs-root" -type f -size -32M -print0)

  while IFS= read -r -d '' _file; do
    sed -i "s|RESOLVE_INSTALL_LOCATION|/opt/${_pkgname}|g" "${_file}"
  done < <(find . -type f '(' -name "*.desktop" -o -name "*.directory" -o -name "*.directory" -o -name "*.menu" ')' -print0)

  rm squashfs-root/libs/libglib-2.0.so.0{,.8200.4} \
     squashfs-root/libs/libgio-2.0.so.0{,.8200.4} \
     squashfs-root/libs/libgmodule-2.0.so.0{,.8200.4} \
     squashfs-root/libs/libgobject-2.0.so.0{,.8200.4} \
     squashfs-root/libs/libc++.so.1{,.0} \
     squashfs-root/libs/libc++abi.so.1{,.0}
  ln -s "../BlackmagicRAWPlayer/BlackmagicRawAPI" "squashfs-root/bin/"
  ln -s -t squashfs-root/libs/ \
    /usr/lib/lib{glib,gio,gmodule,gobject}-2.0.so.0 \
    /usr/lib/libgdk_pixbuf-2.0.so.0 \
    /usr/lib/lib{c++,c++abi}.so.1

  echo "StartupWMClass=resolve" >> "squashfs-root/share/DaVinciResolve.desktop"

  echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"' > "squashfs-root/share/etc/udev/rules.d/99-DavinciPanel.rules"

  # Fix desktop files
  sed -i 's#Exec=.*#Exec=davinci-control-panels-setup#' \
    "squashfs-root/share/DaVinciControlPanelsSetup.desktop"
  sed -i 's#Icon=.*#Icon=davinci-resolve#' \
    "squashfs-root/share/DaVinciResolve.desktop"
  sed -i 's#Icon=.*#Icon=davinci-resolve-panels-setup#' \
    "squashfs-root/share/DaVinciControlPanelsSetup.desktop"
  sed -i 's#Icon=.*#Icon=blackmagicraw-player#' \
    "squashfs-root/share/blackmagicraw-player.desktop"
  sed -i 's#Icon=.*#Icon=blackmagicraw-speedtest#' \
    "squashfs-root/share/blackmagicraw-speedtest.desktop"

  # --- resolve-aacfix ------------------------------------------------------
  # Put the makepkg-managed e9patch checkout where scripts/dev-setup.sh looks
  # for it (vendor/e9patch, with a .git), so it neither clones nor needs the
  # network.
  mkdir -p "resolve-aacfix-${_aacfix_ver}/vendor"
  ln -sfn "${srcdir}/e9patch" "resolve-aacfix-${_aacfix_ver}/vendor/e9patch"

  # The AV3A ("Audio Vivid") demuxer backport dev-setup.sh would apply to a
  # git checkout, applied to the release tarball instead.  Without it the
  # rebuilt libavformat silently loses a demuxer Blackmagic's build has.
  patch -d "ffmpeg-${_ffmpeg_ver}" -Np1 \
    -i "${srcdir}/resolve-aacfix-${_aacfix_ver}/src/ffmpeg/patches/0001-av3a-demuxer-backport.patch"

  # build-ffmpeg.sh is written to run in a bare rockylinux:8 image, where
  # FFmpeg's autodetection finds nothing but zlib.  On a desktop host it finds
  # whatever is installed: nv-codec-headers too new for 6.0.1 breaks the
  # compile, and vaapi/vdpau/vulkan/libxcb/alsa/... would silently add
  # DT_NEEDED entries to libraries loaded into Resolve's process.  Reproduce
  # the container's effective environment: no autodetection, zlib only.
  sed -i '/^    --disable-iconv \\$/a\    --disable-autodetect \\\n    --enable-zlib \\' \
    "resolve-aacfix-${_aacfix_ver}/src/ffmpeg/build-ffmpeg.sh"
  grep -q -- '--disable-autodetect' \
    "resolve-aacfix-${_aacfix_ver}/src/ffmpeg/build-ffmpeg.sh"

  # Upstream targets Blackmagic's Rocky Linux 8 baseline (glibc 2.28) and
  # rebuilds anything newer inside a docker/podman container.  An Arch package
  # is built on and for the host glibc, so that floor is meaningless here:
  # raising it makes dev-setup.sh build natively and turns the glibc/GLIBCXX
  # ceiling checks into no-ops.  Everything else in the scripts is untouched.
  sed -i -e 's/^MAX_GLIBC=.*/MAX_GLIBC=99.99/' \
         -e 's/^MAX_GLIBCXX=.*/MAX_GLIBCXX=99.99.99/' \
    "resolve-aacfix-${_aacfix_ver}/scripts/versions.sh"
}

build() {
  cd "resolve-aacfix-${_aacfix_ver}"

  # Build e9patch + e9tool and compile the aacadd trampoline.  The "pylibs"
  # component is deliberately skipped: it pip-downloads capstone and
  # pyelftools, which python-capstone / python-pyelftools provide instead.
  scripts/dev-setup.sh e9patch

  # FFmpeg 6.0.1 from the release tarball.  dev-setup.sh's "ffmpeg" component
  # insists on a git checkout (it re-clones otherwise), so its steps are
  # reproduced here with the project's own scripts: build-ffmpeg.sh applies
  # Blackmagic's recovered configure line minus the AAC strip and injects
  # RUNPATH=$ORIGIN; check-ffmpeg-libs.sh then verifies sonames, RUNPATH,
  # the codec inventory (by dlopen) and the LGPL-only configure line.
  FFMPEG_SRC="${srcdir}/ffmpeg-${_ffmpeg_ver}" \
  FFMPEG_BUILD="${srcdir}/ffmpeg-build" \
  FFMPEG_PREFIX="${srcdir}/ffmpeg-install" \
    src/ffmpeg/build-ffmpeg.sh
  install -d "prebuilt/ffmpeg-aac"
  (
    . scripts/versions.sh
    for _lib in ${FFMPEG_LIBS}; do
      install -m 0755 "${srcdir}/ffmpeg-install/lib/${_lib}" "prebuilt/ffmpeg-aac/"
    done
  )
  scripts/check-ffmpeg-libs.sh "prebuilt/ffmpeg-aac"
  # Belt and braces for the autodetect point above: the only shared objects
  # these libs may need are each other, zlib and glibc.
  local _needed
  _needed="$(readelf -dW prebuilt/ffmpeg-aac/*.so.* | sed -n 's/.*(NEEDED).*\[\(.*\)\]/\1/p' | sort -u \
    | grep -vE '^(libav(codec|format|util)\.so\.[0-9]+|libswscale\.so\.[0-9]+|libz\.so\.1|libm\.so\.6|libc\.so\.6|libpthread\.so\.0)$' || true)"
  if [[ -n "${_needed}" ]]; then
    echo "error: unexpected DT_NEEDED in the rebuilt FFmpeg libs:" >&2
    echo "${_needed}" >&2
    return 1
  fi

  # Apply the fix to the extracted tree: signature-located additive trampolines
  # in bin/resolve, and the four libav*.so replaced by the AAC-enabled builds.
  # --originals remove: no ~670 MB of pristine copies shipped in the package;
  # reverting means reinstalling the stock davinci-resolve-studio package.
  ./aac-patch-tree apply --originals remove "${srcdir}/squashfs-root"
  ./aac-patch-tree status "${srcdir}/squashfs-root"
}

package() {
  # Install binary launchers
  install -D -m 0755 "${srcdir}/davinci-control-panels-setup.sh" \
    "${pkgdir}/usr/bin/davinci-control-panels-setup"
  ln -s "/opt/resolve/bin/resolve" "${pkgdir}/usr/bin/davinci-resolve-studio"
  # Install other files
  install -d -m 0755 "${pkgdir}/opt/${_pkgname}"
  cp -rf squashfs-root/* "${pkgdir}/opt/${_pkgname}"

  # Distribute files into other directories
  pushd "${pkgdir}/opt/${_pkgname}"
  install -D -m 0644 -t "${pkgdir}/opt/${_pkgname}/configs" \
    share/{default-config.dat,log-conf.xml}
  install -D -m 0644 -t "${pkgdir}/opt/${_pkgname}/DolbyVision" \
    "share/default_cm_config.bin"
  install -d -m 0755 "${pkgdir}/opt/${_pkgname}/.license"
  install -d -m 0755 "${pkgdir}/opt/${_pkgname}/Apple Immersive/Calibration"
  # Install licenses
  install -d -m 0644 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/resolve/docs/License.html" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m 0644 "${srcdir}/resolve-aacfix-${_aacfix_ver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.resolve-aacfix"
  install -D -m 0644 "${srcdir}/resolve-aacfix-${_aacfix_ver}/THIRD-PARTY.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY.resolve-aacfix.md"
  # Install Desktop files and menu
  install -D -m 0644 -t "${pkgdir}/usr/share/applications" \
    "share/DaVinciResolve.desktop" \
    "share/DaVinciControlPanelsSetup.desktop" \
    "share/blackmagicraw-player.desktop" \
    "share/blackmagicraw-speedtest.desktop"
  install -D -m 0644 -t "${pkgdir}/usr/share/desktop-directories" \
    "share/DaVinciResolve.directory"
  install -D -m 0644 -t "${pkgdir}/etc/xdg/menus" \
    "share/DaVinciResolve.menu"
  # Install icons
  install -D -m 0644 -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps" \
    "graphics/DV_Resolve.png" \
    "graphics/DV_ResolveProj.png"
  install -D -m 0644 "graphics/DV_Resolve.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve.png"
  install -D -m 0644 "graphics/DV_Panels.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/davinci-resolve-panels-setup.png"
  install -D -m 0644 "graphics/blackmagicraw-player_256x256_apps.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/blackmagicraw-player.png"
  install -D -m 0644 "graphics/blackmagicraw-speedtest_256x256_apps.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/blackmagicraw-speedtest.png"
  # Install other files
  install -D -m 0644 -t "${pkgdir}/usr/share/mime/packages" \
    "share/resolve.xml"
  install -D -m 0644 -t "${pkgdir}/usr/lib/udev/rules.d" \
    "share/etc/udev/rules.d"/{99-BlackmagicDevices.rules,99-ResolveKeyboardHID.rules,99-DavinciPanel.rules}
  popd
}
