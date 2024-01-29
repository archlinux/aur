# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: xodj (https://aur.archlinux.org/account/xodj)

pkgname="ryzenctrl-git"
epoch=1
pkgver=0.5.1.870+9.r140.20220301.baf6084
pkgrel=2
pkgdesc="Fine-tuning of power limits and frequency of APU Ryzen Mobile"
url="https://github.com/xodj/RyzenAdjCtrl"
arch=("x86_64")
depends=(
  "gcc-libs"
  "glibc"
  "hicolor-icon-theme"
  "ryzen_smu"
  "ryzenadj"
  "qt5-base"
  # "qt5-svg"
)
makedepends=(
  "binutils"
  "cmake"
  "gcc"
  "git"
  "make"
)
optdepends=()
license=("GPL-3.0-or-later")
provides=(
  "${pkgname%-git}=${pkgver}"
)
conflicts=(
  "${pkgname%-git}"
)
source=(
  "xodj-RyzenAdjCtrl::git+https://github.com/xodj/RyzenAdjCtrl.git"
  #"ryzenadj::git+https://github.com/FlyGoat/RyzenAdj.git" # Needed for `lib/ryzenadj.h`, and needed to be downloaded to `ryzenadj`.
  "fix-ryzenadj.h-path.patch"
)
sha256sums=(
  "SKIP"
  #"SKIP"
  "95389e1380d8a18ae55b0500916053016ad830f5b942e9f5ca2c8f82d53c061a"
)

prepare() {
  cd "${srcdir}/xodj-RyzenAdjCtrl"

  for _patch in "${srcdir}/fix-ryzenadj.h-path.patch"; do
    printf '%s\n' "    > Applying patch '$(basename "${_patch}")' ..."
    patch -N -p1 --follow-symlinks -i "${_patch}"
  done

  mkdir -p build

  git log > git.log
}


pkgver() {
  cd "${srcdir}/xodj-RyzenAdjCtrl"
  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/xodj-RyzenAdjCtrl"
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STANDALONE=false \
    ..
  make
}

package() {
  cd "${srcdir}/xodj-RyzenAdjCtrl"

  install -Dsm755 "build/Appfolder/RyzenCtrl"  "${pkgdir}/usr/bin/RyzenCtrl"
  install -Dvm644 "ru.ryzenctrl.service.conf"  "${pkgdir}/etc/dbus-1/system.d/ru.ryzenctrl.service.conf"
  install -Dvm755 "RyzenCtrl.desktop"          "${pkgdir}/usr/share/applications/RyzenCtrl.desktop"
  install -Dvm644 "ryzenctrl-root.service"     "${pkgdir}/usr/lib/systemd/system/ryzenctrl-root.service"
  install -Dvm644 "media/main/amd_icon.png"    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/amd_icon.png"

  for _docfile in git.log README.md; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" "${_docfile}"
  done
  for _licensefile in LICENSE; do
    install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${pkgname%-git}/$(basename "${_licensefile}")"
  done
}
