# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Eric Engestrom (https://aur.archlinux.org/account/1ace)

_pkgname=igt-gpu-tools
pkgname="$_pkgname-git"
pkgver=1.28+606.g17a41dcf1e
pkgrel=3
pkgdesc="Collection of tools for development and testing of the DRM drivers."
url="https://gitlab.freedesktop.org/drm/igt-gpu-tools"
arch=("x86_64" "aarch64")
license=("LicenseRef-several_in_onefile")
makedepends=(
  'bison'
  'flex'
  git
  meson
  ninja
  peg # For executable `leg`, needed to build with `-Doverlay=enabled`.
  'python>=3'
  'python-docutils'
  'python-sphinx'
  'rst2pdf'
  valgrind
)
depends=(
  alsa-lib
  bash
  cairo
  glib2
  glibc
  gsl
  gtk-doc
  json-c
  kmod
  libdrm
  libelf
  liboping
  libpciaccess
  libudev
  libunwind
  libx11
  libxext
  libxmlrpc
  libxrandr
  libxv
  openblas
  perl
  pixman
  procps-ng
  python-docutils
  systemd-libs
  # valgrind
  zlib
)
optdepends=(
  "python>=3:              To use /usr/bin/code_cov_gather_on_test and /usr/bin/intel-gfx-fw-info"
  "python-dissect.cstruct: To use /usr/bin/intel-gfx-fw-info"
)
provides=(
  "${_pkgname}=${pkgver}"
  "gputop=${pkgver}"
  "lsgpu=${pkgver}"
  "dpcd_reg=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  gputop
  lsgpu
  dpcd_reg
)

source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  cd "${srcdir}"

  MESON_OPTS=(
    "-Doverlay=enabled"
    "-Doverlay_backends=['x','xv']"
    "-Dchamelium=enabled"
    "-Dvalgrind=enabled"
    "-Dman=enabled"
    "-Dtestplan=enabled"
    "-Dsphinx=enabled"
    "-Ddocs=disabled" # If enabled, `meson install` fails with `ERROR: Error in gtkdoc helper script:`.
    "-Dtests=enabled"
    "-Dxe_driver=enabled"
    "-Dlibdrm_drivers=['intel','nouveau','amdgpu']"
    "-Dlibunwind=enabled"
    "-Drunner=enabled"
    "-Doping=enabled"
  )
  meson setup --prefix /usr --libexecdir lib --sbindir bin --buildtype plain --auto-features enabled --wrap-mode nodownload "${_pkgname}" build "${MESON_OPTS[@]}"
}

build() {
  cd "${srcdir}"
  ninja -C build
}

# Some tests time out after 30s and are killed by the test running system, making `check()` failing. So we disable them here.
#check() {
#  cd "${srcdir}"
#  ninja -C build test
#}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/docs/testplan/pdf" "build/docs/testplan/pdf/tests.pdf"

  cd "${srcdir}/${_pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log CONTRIBUTING.md MAINTAINERS NEWS README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
